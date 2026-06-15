import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bookcatch/features/record/record_photo_importer.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class RecordPhotoCropChoice {
  const RecordPhotoCropChoice(this.crop);

  final RecordPhotoCrop? crop;
}

class RecordPhotoCropScreen extends StatefulWidget {
  const RecordPhotoCropScreen({super.key, required this.candidate});

  final RecordPhotoCandidate candidate;

  @override
  State<RecordPhotoCropScreen> createState() => _RecordPhotoCropScreenState();
}

class _RecordPhotoCropScreenState extends State<RecordPhotoCropScreen> {
  static const _initialCrop = RecordPhotoCrop(
    left: 0.08,
    top: 0.24,
    right: 0.92,
    bottom: 0.76,
  );

  RecordPhotoCrop _crop = _initialCrop;
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final image = _image;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.recordPhotoCropTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: image == null
                      ? const CircularProgressIndicator()
                      : _CropPreview(
                          image: image,
                          crop: _crop,
                          onCropChanged: _setCrop,
                        ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton.outlined(
                    tooltip: l10n.recordPhotoCropReset,
                    onPressed: _resetCrop,
                    icon: const Icon(Icons.center_focus_strong_outlined),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.of(
                        context,
                      ).pop(const RecordPhotoCropChoice(null)),
                      icon: const Icon(Icons.image_outlined),
                      label: Text(l10n.recordPhotoCropUseFullImage),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () =>
                      Navigator.of(context).pop(RecordPhotoCropChoice(_crop)),
                  icon: const Icon(Icons.crop_outlined),
                  label: Text(l10n.recordPhotoCropUseSelection),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadImage() async {
    final bytes = File(widget.candidate.path).readAsBytesSync();
    final image = await _decodeImage(bytes);
    if (!mounted) {
      image.dispose();
      return;
    }
    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    _image?.dispose();
    super.dispose();
  }

  void _resetCrop() {
    setState(() {
      _crop = _initialCrop;
    });
  }

  void _setCrop(RecordPhotoCrop crop) {
    setState(() {
      _crop = crop;
    });
  }
}

class _CropPreview extends StatelessWidget {
  const _CropPreview({
    required this.image,
    required this.crop,
    required this.onCropChanged,
  });

  final ui.Image image;
  final RecordPhotoCrop crop;
  final ValueChanged<RecordPhotoCrop> onCropChanged;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: image.width / image.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Size(constraints.maxWidth, constraints.maxHeight);
          final cropRect = _toRect(crop, size);
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                RawImage(image: image, fit: BoxFit.fill),
                CustomPaint(painter: _CropMaskPainter(cropRect)),
                Positioned.fromRect(
                  rect: cropRect,
                  child: GestureDetector(
                    key: const ValueKey('record.photoCropArea'),
                    onPanUpdate: (details) => _move(details.delta, size),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BookcatchColors.surfaceContainerLowest,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: cropRect.right - 24,
                  top: cropRect.bottom - 24,
                  child: GestureDetector(
                    onPanUpdate: (details) => _resize(details.delta, size),
                    child: const _CropHandle(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _move(Offset delta, Size size) {
    final dx = delta.dx / size.width;
    final dy = delta.dy / size.height;
    final width = crop.right - crop.left;
    final height = crop.bottom - crop.top;
    final left = (crop.left + dx).clamp(0.0, 1.0 - width);
    final top = (crop.top + dy).clamp(0.0, 1.0 - height);
    onCropChanged(
      RecordPhotoCrop(
        left: left,
        top: top,
        right: left + width,
        bottom: top + height,
      ),
    );
  }

  void _resize(Offset delta, Size size) {
    final right = (crop.right + delta.dx / size.width).clamp(
      crop.left + 0.08,
      1.0,
    );
    final bottom = (crop.bottom + delta.dy / size.height).clamp(
      crop.top + 0.08,
      1.0,
    );
    onCropChanged(
      RecordPhotoCrop(
        left: crop.left,
        top: crop.top,
        right: right,
        bottom: bottom,
      ),
    );
  }
}

class _CropHandle extends StatelessWidget {
  const _CropHandle();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BookcatchColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: BookcatchColors.primary, width: 2),
      ),
      child: const SizedBox.square(dimension: 28),
    );
  }
}

class _CropMaskPainter extends CustomPainter {
  const _CropMaskPainter(this.cropRect);

  final Rect cropRect;

  @override
  void paint(Canvas canvas, Size size) {
    final background = Path()..addRect(Offset.zero & size);
    final hole = Path()..addRect(cropRect);
    canvas.drawPath(
      Path.combine(PathOperation.difference, background, hole),
      Paint()..color = Colors.black.withValues(alpha: 0.42),
    );
  }

  @override
  bool shouldRepaint(covariant _CropMaskPainter oldDelegate) {
    return oldDelegate.cropRect != cropRect;
  }
}

Rect _toRect(RecordPhotoCrop crop, Size size) {
  return Rect.fromLTRB(
    crop.left * size.width,
    crop.top * size.height,
    crop.right * size.width,
    crop.bottom * size.height,
  );
}

Future<ui.Image> _decodeImage(Uint8List bytes) async {
  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  return frame.image;
}
