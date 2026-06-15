import 'package:bookcatch/l10n/app_localizations.dart';

abstract final class LabelCatalog {
  static String displayName(String id, AppLocalizations l10n) {
    if (id.startsWith('custom.')) {
      return id.substring('custom.'.length);
    }

    return switch (id) {
      'emotion.comfort' => l10n.labelEmotionComfort,
      'emotion.relief' => l10n.labelEmotionRelief,
      'emotion.calm' => l10n.labelEmotionCalm,
      'topic.insight' => l10n.labelTopicInsight,
      'emotion.melancholy' => l10n.labelEmotionMelancholy,
      'emotion.joy' => l10n.labelEmotionJoy,
      'topic.reflection' => l10n.labelTopicReflection,
      'topic.travel' => l10n.labelTopicTravel,
      'topic.philosophy' => l10n.labelTopicPhilosophy,
      _ => id,
    };
  }
}
