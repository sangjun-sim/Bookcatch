import 'package:bookcatch/features/home/data/home_initial_data.dart';
import 'package:bookcatch/features/home/home_formatters.dart';
import 'package:bookcatch/features/home/models/home_dashboard_data.dart';
import 'package:bookcatch/features/home/models/home_quote.dart';
import 'package:bookcatch/features/home/models/home_reminder_status.dart';
import 'package:bookcatch/features/home/widgets/home_empty_state.dart';
import 'package:bookcatch/features/home/widgets/home_status_banner.dart';
import 'package:bookcatch/features/home/widgets/recent_quote_card.dart';
import 'package:bookcatch/features/home/widgets/today_quote_card.dart';
import 'package:bookcatch/features/labels/label_catalog.dart';
import 'package:bookcatch/features/quotes/quote_share_message.dart';
import 'package:bookcatch/features/settings/reminder_formatters.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    HomeDashboardData? data,
    this.onCaptureQuotePressed,
    this.onReminderSettingsPressed,
    this.onShareQuote,
    this.onViewAllRecentQuotes,
    this.onQuotePressed,
  }) : data = data ?? initialHomeDashboardData();

  final HomeDashboardData data;
  final VoidCallback? onCaptureQuotePressed;
  final VoidCallback? onReminderSettingsPressed;
  final Future<void> Function(String text, String title, Rect? origin)?
  onShareQuote;
  final VoidCallback? onViewAllRecentQuotes;
  final ValueChanged<HomeQuote>? onQuotePressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final todayQuote = data.todayQuote;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
      children: [
        _Greeting(data: data),
        if (data.isEmpty) ...[
          const SizedBox(height: 24),
          HomeEmptyState(onCaptureQuotePressed: onCaptureQuotePressed),
        ] else ...[
          if (todayQuote != null) ...[
            const SizedBox(height: 32),
            TodayQuoteCard(
              quote: todayQuote,
              onSharePressed: (origin) =>
                  _shareQuote(context, todayQuote, origin),
              onOpenPressed: todayQuote.id == null
                  ? null
                  : () => onQuotePressed?.call(todayQuote),
            ),
          ],
          if (data.recentQuotes.isNotEmpty) ...[
            const SizedBox(height: 32),
            _RecentQuotesSection(
              data: data,
              onViewAllPressed: onViewAllRecentQuotes,
              onQuotePressed: onQuotePressed,
            ),
          ],
          const SizedBox(height: 32),
          HomeStatusBanner(
            title: l10n.reminderStatusTitle,
            body: _reminderStatusText(context, data.reminderStatus),
            icon: Icons.notifications_none_outlined,
            onActionPressed: onReminderSettingsPressed,
            actionTooltip: l10n.settingsAction,
          ),
          const SizedBox(height: 16),
          HomeStatusBanner(
            title: l10n.weeklyReportTitle,
            body: l10n.weeklyReportSummary(
              data.weeklyReport.capturedQuoteCount,
              data.weeklyReport.days,
            ),
            icon: Icons.insights_outlined,
          ),
        ],
      ],
    );
  }

  String _reminderStatusText(BuildContext context, HomeReminderStatus status) {
    final l10n = AppLocalizations.of(context);
    if (!status.isEnabled || status.scheduledAt == null) {
      return l10n.reminderStatusOff;
    }

    final scheduledAt = status.scheduledAt!;
    final label = status.labelId == null
        ? l10n.reminderLabelAll
        : LabelCatalog.displayName(status.labelId!, l10n);
    return l10n.reminderStatusOn(
      status.quoteCount,
      reminderOccurrenceLabel(
        context: context,
        scheduledAt: scheduledAt,
        now: data.today,
      ),
      label,
    );
  }

  Future<void> _shareQuote(
    BuildContext context,
    HomeQuote quote,
    Rect? origin,
  ) async {
    final share = onShareQuote;
    if (share == null) {
      return;
    }
    final l10n = AppLocalizations.of(context);
    final text = buildQuoteShareMessage(
      l10n,
      quoteText: quote.text,
      author: quote.author,
      bookTitle: quote.bookTitle,
      page: quote.page,
    );
    await share(text, l10n.todayUnderlineTitle, origin);
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting({required this.data});

  final HomeDashboardData data;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final readerName = data.readerNickname == defaultHomeReaderNickname
        ? l10n.homeDefaultReaderName
        : data.readerNickname;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomeFormatters.fullDate(context, data.today),
          style: theme.textTheme.labelMedium?.copyWith(
            color: BookcatchColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.homeGreeting(readerName),
          style: theme.textTheme.headlineLarge?.copyWith(
            color: BookcatchColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _RecentQuotesSection extends StatelessWidget {
  const _RecentQuotesSection({
    required this.data,
    this.onViewAllPressed,
    this.onQuotePressed,
  });

  final HomeDashboardData data;
  final VoidCallback? onViewAllPressed;
  final ValueChanged<HomeQuote>? onQuotePressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.recentQuotesTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: onViewAllPressed,
              child: Text(l10n.viewAllAction),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 224,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: data.recentQuotes.length,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final quote = data.recentQuotes[index];
              final savedAt = quote.savedAt;
              return RecentQuoteCard(
                quote: quote,
                savedAtLabel: savedAt == null
                    ? ''
                    : HomeFormatters.savedAt(context, savedAt, data.today),
                onPressed: quote.id == null
                    ? null
                    : () => onQuotePressed?.call(quote),
              );
            },
          ),
        ),
      ],
    );
  }
}
