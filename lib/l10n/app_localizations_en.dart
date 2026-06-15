// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Bookcatch';

  @override
  String get homeTitle => 'Today\'s Quote';

  @override
  String homeDateLabel(String date) {
    return '$date';
  }

  @override
  String homeGreeting(String readerName) {
    return 'Hello, $readerName';
  }

  @override
  String get homeDefaultReaderName => 'dear reader';

  @override
  String get todayUnderlineTitle => 'Today\'s Underline';

  @override
  String get recentQuotesTitle => 'Recent Saves';

  @override
  String get homeEmptyTitle => 'No saved sentences yet';

  @override
  String get homeEmptyBody =>
      'Keep one line from a book that stayed with you and make it your own.';

  @override
  String get homeEmptyAction => 'Catch your first sentence';

  @override
  String get homeEmptyFooterQuote => '\"Everything unrecorded is forgotten.\"';

  @override
  String get reminderStatusTitle => 'Reflection Reminder';

  @override
  String get weeklyReportTitle => 'This Week\'s Reflection Report';

  @override
  String get viewAllAction => 'View all';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get shareAction => 'Share';

  @override
  String get shareCardAction => 'Share card';

  @override
  String get shareAttribution => 'Shared from Bookcatch.';

  @override
  String get transcribeAction => 'Transcribe';

  @override
  String get captureQuoteAction => 'Capture quote';

  @override
  String get settingsAction => 'Settings';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get libraryTitle => 'Library';

  @override
  String get librarySearchHint => 'Search quotes, books, keywords';

  @override
  String get libraryFilterAll => 'All';

  @override
  String get libraryFilterByBook => 'By book';

  @override
  String get libraryFilterByEmotion => 'By emotion';

  @override
  String get libraryFilterBySituation => 'By situation';

  @override
  String get libraryFilterFavorites => 'Favorites';

  @override
  String get libraryFoldersTitle => 'Folders';

  @override
  String get libraryFolderAll => 'All';

  @override
  String get libraryFolderUncategorized => 'Unfiled';

  @override
  String get libraryCreateFolderAction => 'Create folder';

  @override
  String get libraryCreateFolderTitle => 'Create folder';

  @override
  String get libraryFolderNameLabel => 'Folder name';

  @override
  String get libraryFolderNameHint => 'For example, Read again';

  @override
  String get libraryFolderCreateConfirm => 'Create';

  @override
  String get libraryFolderCreateFailure => 'Could not create folder.';

  @override
  String get libraryMoveToFolderAction => 'Move to folder';

  @override
  String get libraryMoveToFolderTitle => 'Move to folder';

  @override
  String get libraryFolderMoveFailure => 'Could not change folder.';

  @override
  String get libraryFolderDeleteAction => 'Delete folder';

  @override
  String get libraryFolderDeleteTitle => 'Delete this folder?';

  @override
  String libraryFolderDeleteMessage(String folderName, int count) {
    return 'The $folderName folder and $count quotes inside it will be deleted.';
  }

  @override
  String get libraryFolderDeleteConfirm => 'Delete';

  @override
  String get libraryFolderDeleteFailure => 'Could not delete folder.';

  @override
  String get libraryFolderEmptyTitle => 'This folder is empty';

  @override
  String get libraryFolderEmptyBody =>
      'Use quote options on a card to move it into this folder.';

  @override
  String libraryRecordedAt(String date) {
    return 'Saved $date';
  }

  @override
  String libraryQuoteReminderTime(String time) {
    return 'Reminder $time';
  }

  @override
  String get libraryFavoriteAddAction => 'Add to favorites';

  @override
  String get libraryFavoriteRemoveAction => 'Remove from favorites';

  @override
  String get libraryQuoteMoreActions => 'Quote options';

  @override
  String get libraryQuoteEditAction => 'Edit';

  @override
  String get libraryQuoteEditTitle => 'Edit quote';

  @override
  String get libraryQuoteEditConfirm => 'Save';

  @override
  String get libraryQuoteEditInProgress => 'Updating quote.';

  @override
  String get libraryQuoteEditHelper =>
      'Changes are saved to your library and sync queue.';

  @override
  String get libraryQuoteEditSuccess => 'Quote updated.';

  @override
  String get libraryQuoteEditFailure => 'Could not update quote.';

  @override
  String get libraryQuoteReminderAction => 'Reminder settings';

  @override
  String get libraryQuoteDeleteAction => 'Delete';

  @override
  String get libraryQuoteDeleteTitle => 'Delete this quote?';

  @override
  String get libraryQuoteDeleteMessage =>
      'The quote will disappear from Home and Library.';

  @override
  String get libraryQuoteDeleteConfirm => 'Delete';

  @override
  String get libraryQuoteDeleteSuccess => 'Quote deleted.';

  @override
  String get libraryQuoteDeleteFailure => 'Could not delete quote.';

  @override
  String get libraryQuoteExportMarkdownAction => 'Export Markdown';

  @override
  String get libraryEmptySearchHint => 'Search saved sentences';

  @override
  String get libraryEmptyTitle => 'Your sentence archive is empty';

  @override
  String get libraryEmptyBody =>
      'Save a passage that moved you\nand build your own reflection archive';

  @override
  String get libraryEmptyAction => 'Save a sentence';

  @override
  String get exportMarkdownSuccessMessage => 'Markdown file is ready.';

  @override
  String get exportMarkdownFailureMessage => 'Could not export Markdown.';

  @override
  String get exportMarkdownMissingSource => 'Source not entered';

  @override
  String get exportMarkdownMemoHeading => 'Memo';

  @override
  String get settingsNotificationSection => 'Reminders';

  @override
  String get settingsNotificationSchedule => 'All reminder time and frequency';

  @override
  String get settingsDataSection => 'Data';

  @override
  String get settingsSaveOriginalPhotos => 'Save original photos';

  @override
  String get settingsInfoSection => 'Information';

  @override
  String get settingsCopyrightGuide => 'Copyright and sharing guide';

  @override
  String get settingsAppVersion => 'App version';

  @override
  String get settingsFooter =>
      'Bookcatch keeps your reflections carefully.\nHave a quiet day with your books.';

  @override
  String get homeTab => 'Home';

  @override
  String get recordTab => 'Record';

  @override
  String get libraryTab => 'Library';

  @override
  String get settingsTab => 'Settings';

  @override
  String get recordTitle => 'Record Quote';

  @override
  String get recordIntroTitle => 'How would you like to record it?';

  @override
  String get recordIntroBody =>
      'Type the sentence that stopped you, or bring it in from a photo.';

  @override
  String get recordEmptyTitle => 'Today\'s reflection\nis waiting';

  @override
  String get recordEmptyBody =>
      'There are no saved sentences yet,\nso reflection cannot begin.';

  @override
  String get recordEmptyAction => 'Go save a sentence';

  @override
  String get recordEmptyHelper =>
      'Capture a sentence that stays with you while reading';

  @override
  String get recordImportPhotoAction => 'Add from photo';

  @override
  String get recordImportPhotoCamera => 'Take a photo';

  @override
  String get recordImportPhotoGallery => 'Choose from library';

  @override
  String get recordImportPhotoInProgress =>
      'Reading the sentence from the photo';

  @override
  String get recordImportPhotoNoText => 'No sentence was found in the photo.';

  @override
  String get recordImportPhotoFailure =>
      'Could not import a sentence from the photo.';

  @override
  String get recordImportPhotoOverwriteTitle => 'Replace the current sentence?';

  @override
  String get recordImportPhotoOverwriteMessage =>
      'The sentence you typed will be replaced with text read from the photo.';

  @override
  String get recordImportPhotoOverwriteConfirm => 'Replace';

  @override
  String get recordPhotoCropTitle => 'Select sentence area';

  @override
  String get recordPhotoCropReset => 'Reset area';

  @override
  String get recordPhotoCropUseSelection => 'Use selected area';

  @override
  String get recordPhotoCropUseFullImage => 'Use full photo';

  @override
  String get recordBookQuestion => 'Which book is this quote from?';

  @override
  String get recordBookPlaceholder => 'Choose or type a book';

  @override
  String get recordRecentBookLabel => '(recent)';

  @override
  String get recordAuthorLabel => 'Author';

  @override
  String get recordAuthorPlaceholder => 'Type the author\'s name';

  @override
  String get recordEditQuoteLabel => 'Edit quote';

  @override
  String get recordQuotePlaceholder =>
      'Type the sentence you want to remember...';

  @override
  String get recordPageLabel => 'Page';

  @override
  String get recordEmotionLabel => 'Mood';

  @override
  String get recordCustomEmotionPlaceholder => 'Add a mood label';

  @override
  String get recordCustomEmotionAddAction => 'Add mood';

  @override
  String get recordCustomEmotionDuplicate => 'This mood is already added.';

  @override
  String get recordMemoLabel => 'Memo';

  @override
  String get recordMemoPlaceholder => 'Add why this sentence stopped you.';

  @override
  String get recordSaveAction => 'Save quote';

  @override
  String get recordSaveHelper =>
      'Your quote will be kept safely in the library.';

  @override
  String get recordSaveValidationEmptyQuote => 'Type a quote before saving.';

  @override
  String get recordSaveInProgress => 'Saving quote.';

  @override
  String get recordSaveLocalOnly => 'Quote saved on this device.';

  @override
  String get recordSaveSyncDeferred =>
      'Quote saved. Sync will continue when connected.';

  @override
  String get recordSaveSynced => 'Quote saved safely.';

  @override
  String get recordSaveSnack => 'Quote saved safely.';

  @override
  String quoteSourceWithPage(String author, String bookTitle, String page) {
    return '$author, $bookTitle $page';
  }

  @override
  String quoteSource(String author, String bookTitle) {
    return '$author, $bookTitle';
  }

  @override
  String quoteSourceBookOnly(String bookTitle) {
    return '$bookTitle';
  }

  @override
  String quoteSourceBookWithPage(String bookTitle, String page) {
    return '$bookTitle $page';
  }

  @override
  String quoteSourceAuthorWithPage(String author, String page) {
    return '$author $page';
  }

  @override
  String reminderStatusOn(int count, String time, String label) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$time, $count $label quotes will return',
      one: '$time, 1 $label quote will return',
      zero: 'No $label quotes are scheduled for $time',
    );
    return '$_temp0';
  }

  @override
  String get reminderStatusOff => 'Reflection reminders are off';

  @override
  String reminderOccurrenceToday(String time) {
    return 'Today $time';
  }

  @override
  String reminderOccurrenceTomorrow(String time) {
    return 'Tomorrow $time';
  }

  @override
  String reminderOccurrenceThisWeek(String weekday, String time) {
    return 'This $weekday $time';
  }

  @override
  String get reminderSettingsTitle => 'Reflection reminder settings';

  @override
  String get reminderEnableSwitch => 'Reflection reminder';

  @override
  String get reminderTimeLabel => 'Time';

  @override
  String get reminderWeekdaysLabel => 'Weekdays';

  @override
  String get reminderRepeatLabel => 'Repeat';

  @override
  String get reminderLabelRuleLabel => 'Label';

  @override
  String get reminderRepeatOnce => 'Once';

  @override
  String get reminderRepeatWeekly => 'Weekly';

  @override
  String get reminderRepeatOnceDescription =>
      'Sends one notification for each selected weekday.';

  @override
  String get reminderLabelAll => 'All';

  @override
  String get reminderSaveAction => 'Save';

  @override
  String get reminderPermissionDenied =>
      'Notifications are disabled. Turn them on in device settings and try again.';

  @override
  String get reminderEmptyWeekdays =>
      'Select at least one weekday for reminders.';

  @override
  String get reminderScheduleFailed =>
      'Could not save the reminder. Try again later.';

  @override
  String get reminderSettingsSaved => 'Reflection reminder saved.';

  @override
  String get reminderNotificationTitle => 'A saved quote is waiting';

  @override
  String get reminderNotificationBody =>
      'Open Bookcatch and revisit today\'s quote.';

  @override
  String get quoteReminderSettingsTitle => 'Quote reminder settings';

  @override
  String get quoteReminderEnableSwitch => 'Quote reminder';

  @override
  String get quoteReminderTimeLabel => 'Time';

  @override
  String get quoteReminderWeekdaysLabel => 'Weekdays';

  @override
  String get quoteReminderRepeatLabel => 'Repeat';

  @override
  String get quoteReminderRepeatOnce => 'Once';

  @override
  String get quoteReminderRepeatWeekly => 'Weekly';

  @override
  String get quoteReminderRepeatOnceDescription =>
      'Sends this quote once for each selected weekday.';

  @override
  String get quoteReminderSaveAction => 'Save';

  @override
  String get quoteReminderSettingsSaved => 'Quote reminder saved.';

  @override
  String get quoteReminderPermissionDenied =>
      'Notifications are disabled. Turn them on in device settings and try again.';

  @override
  String get quoteReminderEmptyWeekdays =>
      'Select at least one weekday for reminders.';

  @override
  String get quoteReminderPendingLimitReached =>
      'You have reached the scheduled notification limit. Reduce other quote reminders and try again.';

  @override
  String get quoteReminderScheduleFailed =>
      'Could not save the quote reminder. Try again later.';

  @override
  String get quoteReminderNotificationTitle => 'A quote is back';

  @override
  String quoteReminderNotificationBody(String quote) {
    return '$quote';
  }

  @override
  String get recallTitle => 'Recall';

  @override
  String get recallTodayReflectionTitle => 'Today\'s Reflection';

  @override
  String get recallQuestionOneLabel => 'Question 1';

  @override
  String get recallQuestionOnePrompt =>
      'Does this quote still resonate with you?';

  @override
  String get recallQuestionOneHint => 'Write what comes to mind now.';

  @override
  String get recallQuestionTwoLabel => 'Question 2';

  @override
  String get recallQuestionTwoPrompt =>
      'How is the feeling then different from now?';

  @override
  String get recallQuestionTwoHint => 'Write how the feeling changed.';

  @override
  String get recallPreviousRecordsTitle => 'Previous records for this quote';

  @override
  String get recallEmptyHistory =>
      'There are no previous records for this quote yet.';

  @override
  String get recallSavedMessage => 'Saved your record for this quote.';

  @override
  String get recallEmptyReflectionMessage =>
      'Enter at least one answer before saving.';

  @override
  String get recallRecordedNow => 'Just now';

  @override
  String recallRecordedAt(String date) {
    return 'Recorded $date';
  }

  @override
  String get weekdayMonday => 'Mon';

  @override
  String get weekdayTuesday => 'Tue';

  @override
  String get weekdayWednesday => 'Wed';

  @override
  String get weekdayThursday => 'Thu';

  @override
  String get weekdayFriday => 'Fri';

  @override
  String get weekdaySaturday => 'Sat';

  @override
  String get weekdaySunday => 'Sun';

  @override
  String weeklyReportSummary(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You captured $count quotes in the last $days days',
      one: 'You captured 1 quote in the last $days days',
      zero: 'No quotes captured in the last $days days',
    );
    return '$_temp0';
  }

  @override
  String relativeYesterdayWithTime(String time) {
    return 'Yesterday $time';
  }

  @override
  String relativeDaysAgo(int days) {
    return '$days days ago';
  }

  @override
  String get labelEmotionComfort => 'comfort';

  @override
  String get labelEmotionRelief => 'relief';

  @override
  String get labelEmotionCalm => 'calm';

  @override
  String get labelTopicInsight => 'insight';

  @override
  String get labelEmotionMelancholy => 'melancholy';

  @override
  String get labelEmotionJoy => 'joy';

  @override
  String get labelTopicReflection => 'reflection';

  @override
  String get labelTopicTravel => 'travel';

  @override
  String get labelTopicPhilosophy => 'philosophy';

  @override
  String get captureQuoteSnack => 'The capture screen will be connected next.';
}
