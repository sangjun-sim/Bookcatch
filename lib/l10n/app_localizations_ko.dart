// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '북캐치';

  @override
  String get homeTitle => '오늘의 문장';

  @override
  String homeDateLabel(String date) {
    return '$date';
  }

  @override
  String homeGreeting(String readerName) {
    return '안녕하세요, $readerName';
  }

  @override
  String get homeDefaultReaderName => '독자님';

  @override
  String get todayUnderlineTitle => '오늘의 밑줄';

  @override
  String get recentQuotesTitle => '최근 기록';

  @override
  String get homeEmptyTitle => '아직 수집한 문장이 없어요';

  @override
  String get homeEmptyBody => '당신의 마음에 남은 책 속 한 줄을 기록하고 나만의 문장을 간직해보세요.';

  @override
  String get homeEmptyAction => '첫 문장을 낚아보세요';

  @override
  String get homeEmptyTipTitle => 'OCR로 빠르게 기록하기';

  @override
  String get homeEmptyTipBody => '사진으로 가져온 뒤 문장 영역만 선택하고 OCR 결과를 확인해 저장하세요.';

  @override
  String get homeEmptyFooterQuote => '\"기록되지 않은 모든 것은 잊혀진다.\"';

  @override
  String get reminderStatusTitle => '회상 알림';

  @override
  String get weeklyReportTitle => '이번 주의 사색 리포트';

  @override
  String get viewAllAction => '모두 보기';

  @override
  String get cancelAction => '취소';

  @override
  String get shareAction => '공유하기';

  @override
  String get shareCardAction => '카드 공유';

  @override
  String get shareAttribution => '북캐치에서 공유됨.';

  @override
  String get transcribeAction => '필사하기';

  @override
  String get captureQuoteAction => '문장 잡기';

  @override
  String get settingsAction => '설정';

  @override
  String get settingsTitle => '설정';

  @override
  String get libraryTitle => '서재';

  @override
  String get librarySearchHint => '문장, 도서, 키워드 검색';

  @override
  String get libraryFilterAll => '전체';

  @override
  String get libraryFilterByBook => '도서별';

  @override
  String get libraryFilterByEmotion => '감정별';

  @override
  String get libraryFilterBySituation => '상황별';

  @override
  String get libraryFilterFavorites => '즐겨찾기';

  @override
  String get libraryFoldersTitle => '폴더';

  @override
  String get libraryFolderAll => '전체';

  @override
  String get libraryFolderUncategorized => '미분류';

  @override
  String get libraryCreateFolderAction => '폴더 만들기';

  @override
  String get libraryCreateFolderTitle => '새 폴더 만들기';

  @override
  String get libraryFolderNameLabel => '폴더 이름';

  @override
  String get libraryFolderNameHint => '예: 다시 읽기';

  @override
  String get libraryFolderCreateConfirm => '만들기';

  @override
  String get libraryFolderCreateFailure => '폴더를 만들지 못했습니다.';

  @override
  String get libraryMoveToFolderAction => '폴더로 이동';

  @override
  String get libraryMoveToFolderTitle => '이동할 폴더';

  @override
  String get libraryFolderMoveFailure => '폴더를 변경하지 못했습니다.';

  @override
  String get libraryFolderDeleteAction => '폴더 삭제';

  @override
  String get libraryFolderDeleteTitle => '폴더를 삭제할까요?';

  @override
  String libraryFolderDeleteMessage(String folderName, int count) {
    return '$folderName 폴더와 안의 문장 $count개가 삭제됩니다.';
  }

  @override
  String get libraryFolderDeleteConfirm => '삭제하기';

  @override
  String get libraryFolderDeleteFailure => '폴더를 삭제하지 못했습니다.';

  @override
  String get libraryFolderEmptyTitle => '이 폴더는 비어 있습니다';

  @override
  String get libraryFolderEmptyBody => '문장 카드의 기록 옵션에서 이 폴더로 이동할 수 있습니다.';

  @override
  String libraryRecordedAt(String date) {
    return '기록일 $date';
  }

  @override
  String libraryQuoteReminderTime(String time) {
    return '알림 시간 $time';
  }

  @override
  String get libraryFavoriteAddAction => '즐겨찾기에 추가';

  @override
  String get libraryFavoriteRemoveAction => '즐겨찾기에서 제거';

  @override
  String get libraryQuoteMoreActions => '기록 옵션';

  @override
  String get libraryQuoteEditAction => '수정';

  @override
  String get libraryQuoteEditTitle => '문장 수정';

  @override
  String get libraryQuoteEditConfirm => '저장';

  @override
  String get libraryQuoteEditInProgress => '문장을 수정하는 중입니다.';

  @override
  String get libraryQuoteEditHelper => '수정한 내용은 서재와 동기화 대기열에 반영됩니다.';

  @override
  String get libraryQuoteEditSuccess => '문장을 수정했습니다.';

  @override
  String get libraryQuoteEditFailure => '문장을 수정하지 못했습니다.';

  @override
  String get libraryQuoteReminderAction => '알림 설정';

  @override
  String get libraryQuoteDeleteAction => '삭제';

  @override
  String get libraryQuoteDeleteTitle => '기록을 삭제할까요?';

  @override
  String get libraryQuoteDeleteMessage => '삭제한 기록은 서재와 홈에서 사라집니다.';

  @override
  String get libraryQuoteDeleteConfirm => '삭제하기';

  @override
  String get libraryQuoteDeleteSuccess => '기록을 삭제했습니다.';

  @override
  String get libraryQuoteDeleteFailure => '기록을 삭제하지 못했습니다.';

  @override
  String get libraryQuoteExportMarkdownAction => 'Markdown 내보내기';

  @override
  String get libraryEmptySearchHint => '보관된 문장 검색';

  @override
  String get libraryEmptyTitle => '나만의 문장 보관함이 비어 있습니다';

  @override
  String get libraryEmptyBody => '마음에 닿은 구절을 기록하고\n나만의 사색 아카이브를 만들어보세요';

  @override
  String get libraryEmptyAction => '문장 저장하기';

  @override
  String get exportMarkdownSuccessMessage => 'Markdown 파일을 준비했습니다.';

  @override
  String get exportMarkdownFailureMessage => '내보내기에 실패했습니다.';

  @override
  String get exportMarkdownMissingSource => '출처 미입력';

  @override
  String get exportMarkdownMemoHeading => '메모';

  @override
  String get settingsNotificationSection => '알림 및 회상';

  @override
  String get settingsNotificationSchedule => '전체 알림 시간/빈도 설정';

  @override
  String get settingsDataSection => '데이터 관리';

  @override
  String get settingsSaveOriginalPhotos => '사진 원본 저장 여부';

  @override
  String get settingsInfoSection => '정보';

  @override
  String get settingsCopyrightGuide => '저작권/공유 안내';

  @override
  String get settingsAppVersion => '앱 버전 정보';

  @override
  String get settingsFooter =>
      '북캐치는 당신의 모든 사색을 소중히 보관합니다.\n오늘도 책과 함께 평온한 하루 되세요.';

  @override
  String get homeTab => '홈';

  @override
  String get recordTab => '기록';

  @override
  String get libraryTab => '서재';

  @override
  String get settingsTab => '설정';

  @override
  String get recordTitle => '문장 기록';

  @override
  String get recordIntroTitle => '문장을 어떻게 기록할까요?';

  @override
  String get recordIntroBody => '책을 읽다 멈춘 문장을 바로 입력하거나, 사진에서 가져올 수 있어요.';

  @override
  String get recordEmptyTitle => '오늘의 회상이\n기다리고 있어요';

  @override
  String get recordEmptyBody => '아직 저장된 문장이 없어\n회상을 시작할 수 없습니다.';

  @override
  String get recordEmptyAction => '문장 저장하러 가기';

  @override
  String get recordEmptyHelper => '독서 중 마음에 드는 문장을 캡처해보세요';

  @override
  String get recordImportPhotoAction => '사진으로 가져오기';

  @override
  String get recordImportPhotoCamera => '카메라로 촬영';

  @override
  String get recordImportPhotoGallery => '사진 보관함에서 선택';

  @override
  String get recordImportPhotoInProgress => '사진에서 문장을 읽는 중입니다';

  @override
  String get recordImportPhotoNoText => '사진에서 문장을 찾지 못했습니다.';

  @override
  String get recordImportPhotoFailure => '사진에서 문장을 가져오지 못했습니다.';

  @override
  String get recordImportPhotoOverwriteTitle => '기존 문장을 바꿀까요?';

  @override
  String get recordImportPhotoOverwriteMessage =>
      '현재 입력한 문장을 사진에서 읽은 텍스트로 바꿉니다.';

  @override
  String get recordImportPhotoOverwriteConfirm => '바꾸기';

  @override
  String get recordPhotoCropTitle => '문장 영역 선택';

  @override
  String get recordPhotoCropReset => '영역 다시 맞추기';

  @override
  String get recordPhotoCropUseSelection => '선택 영역 가져오기';

  @override
  String get recordPhotoCropUseFullImage => '전체 사진 사용';

  @override
  String get recordBookQuestion => '어떤 책의 문장인가요?';

  @override
  String get recordBookPlaceholder => '책을 선택하거나 입력하세요';

  @override
  String get recordRecentBookLabel => '(최근 기록)';

  @override
  String get recordAuthorLabel => '저자';

  @override
  String get recordAuthorPlaceholder => '저자 이름을 입력하세요';

  @override
  String get recordEditQuoteLabel => '문장 편집';

  @override
  String get recordQuotePlaceholder => '기억하고 싶은 문장을 입력하세요...';

  @override
  String get recordPageLabel => '페이지';

  @override
  String get recordEmotionLabel => '감정 기록';

  @override
  String get recordCustomEmotionPlaceholder => '감정 라벨 추가';

  @override
  String get recordCustomEmotionAddAction => '감정 추가';

  @override
  String get recordCustomEmotionDuplicate => '이미 추가된 감정입니다.';

  @override
  String get recordMemoLabel => '메모';

  @override
  String get recordMemoPlaceholder => '이 문장에 멈춘 이유를 적어보세요.';

  @override
  String get recordSaveAction => '문장 보관하기';

  @override
  String get recordSaveHelper => '문장이 안전하게 서재에 보관됩니다.';

  @override
  String get recordSaveValidationEmptyQuote => '보관할 문장을 먼저 입력해주세요.';

  @override
  String get recordSaveInProgress => '문장을 보관하는 중입니다.';

  @override
  String get recordSaveLocalOnly => '문장을 이 기기에 보관했습니다.';

  @override
  String get recordSaveSyncDeferred => '문장을 보관했습니다. 동기화는 연결되면 이어집니다.';

  @override
  String get recordSaveSynced => '문장을 안전하게 보관했습니다.';

  @override
  String get recordSaveSnack => '문장이 안전하게 보관되었습니다.';

  @override
  String quoteSourceWithPage(String author, String bookTitle, String page) {
    return '$author, 『$bookTitle』 $page';
  }

  @override
  String quoteSource(String author, String bookTitle) {
    return '$author, 『$bookTitle』';
  }

  @override
  String quoteSourceBookOnly(String bookTitle) {
    return '『$bookTitle』';
  }

  @override
  String quoteSourceBookWithPage(String bookTitle, String page) {
    return '『$bookTitle』 $page';
  }

  @override
  String quoteSourceAuthorWithPage(String author, String page) {
    return '$author · $page';
  }

  @override
  String reminderStatusOn(int count, String time, String label) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$time, $label 문장 $count개가 찾아옵니다',
      zero: '$time에 예정된 $label 문장이 없습니다',
    );
    return '$_temp0';
  }

  @override
  String get reminderStatusOff => '회상 알림이 꺼져 있어요';

  @override
  String reminderOccurrenceToday(String time) {
    return '오늘 $time';
  }

  @override
  String reminderOccurrenceTomorrow(String time) {
    return '내일 $time';
  }

  @override
  String reminderOccurrenceThisWeek(String weekday, String time) {
    return '이번 주 $weekday $time';
  }

  @override
  String get reminderSettingsTitle => '회상 알림 설정';

  @override
  String get reminderEnableSwitch => '회상 알림';

  @override
  String get reminderTimeLabel => '시간';

  @override
  String get reminderWeekdaysLabel => '요일';

  @override
  String get reminderRepeatLabel => '반복';

  @override
  String get reminderLabelRuleLabel => '라벨';

  @override
  String get reminderRepeatOnce => '한 번만';

  @override
  String get reminderRepeatWeekly => '매주 반복';

  @override
  String get reminderRepeatOnceDescription => '선택한 각 요일에 한 번씩 알림을 보냅니다.';

  @override
  String get reminderLabelAll => '전체';

  @override
  String get reminderSaveAction => '저장';

  @override
  String get reminderPermissionDenied =>
      '알림 권한이 꺼져 있어요. 기기 설정에서 권한을 켠 뒤 다시 시도해주세요.';

  @override
  String get reminderEmptyWeekdays => '알림을 받을 요일을 하나 이상 선택해주세요.';

  @override
  String get reminderScheduleFailed => '알림을 저장하지 못했습니다. 잠시 뒤 다시 시도해주세요.';

  @override
  String get reminderSettingsSaved => '회상 알림을 저장했습니다.';

  @override
  String get reminderNotificationTitle => '저장한 문장이 기다려요';

  @override
  String get reminderNotificationBody => '북캐치에서 오늘의 문장을 다시 떠올려보세요.';

  @override
  String get quoteReminderSettingsTitle => '문장 알림 설정';

  @override
  String get quoteReminderEnableSwitch => '문장 알림';

  @override
  String get quoteReminderTimeLabel => '시간';

  @override
  String get quoteReminderWeekdaysLabel => '요일';

  @override
  String get quoteReminderRepeatLabel => '반복';

  @override
  String get quoteReminderRepeatOnce => '한 번만';

  @override
  String get quoteReminderRepeatWeekly => '매주 반복';

  @override
  String get quoteReminderRepeatOnceDescription =>
      '선택한 각 요일에 한 번씩 이 문장을 알려줍니다.';

  @override
  String get quoteReminderSaveAction => '저장';

  @override
  String get quoteReminderSettingsSaved => '문장 알림을 저장했습니다.';

  @override
  String get quoteReminderPermissionDenied =>
      '알림 권한이 꺼져 있어요. 기기 설정에서 권한을 켠 뒤 다시 시도해주세요.';

  @override
  String get quoteReminderEmptyWeekdays => '알림을 받을 요일을 하나 이상 선택해주세요.';

  @override
  String get quoteReminderPendingLimitReached =>
      '예약 가능한 알림 수를 초과했습니다. 다른 문장 알림을 줄인 뒤 다시 시도해주세요.';

  @override
  String get quoteReminderScheduleFailed =>
      '문장 알림을 저장하지 못했습니다. 잠시 뒤 다시 시도해주세요.';

  @override
  String get quoteReminderNotificationTitle => '문장이 다시 찾아왔어요';

  @override
  String quoteReminderNotificationBody(String quote) {
    return '$quote';
  }

  @override
  String get recallTitle => '회상';

  @override
  String get recallTodayReflectionTitle => '오늘의 사색';

  @override
  String get recallQuestionOneLabel => '질문 1';

  @override
  String get recallQuestionOnePrompt => '이 문장이 여전히 당신의 마음속에 울림을 주나요?';

  @override
  String get recallQuestionOneHint => '지금 떠오르는 생각을 적어보세요.';

  @override
  String get recallQuestionTwoLabel => '질문 2';

  @override
  String get recallQuestionTwoPrompt => '그때의 감정과 지금의 감정은 어떻게 다른가요?';

  @override
  String get recallQuestionTwoHint => '감정의 변화를 적어보세요.';

  @override
  String get recallPreviousRecordsTitle => '이 문장에 대한 이전 기록';

  @override
  String get recallEmptyHistory => '아직 이 문장에 대한 이전 기록이 없습니다.';

  @override
  String get recallSavedMessage => '이 문장에 대한 기록을 저장했습니다.';

  @override
  String get recallEmptyReflectionMessage => '질문에 대한 생각을 하나 이상 입력해주세요.';

  @override
  String get recallRecordedNow => '방금 전';

  @override
  String recallRecordedAt(String date) {
    return '$date 기록';
  }

  @override
  String get weekdayMonday => '월';

  @override
  String get weekdayTuesday => '화';

  @override
  String get weekdayWednesday => '수';

  @override
  String get weekdayThursday => '목';

  @override
  String get weekdayFriday => '금';

  @override
  String get weekdaySaturday => '토';

  @override
  String get weekdaySunday => '일';

  @override
  String weeklyReportSummary(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '지난 $days일간 $count개의 문장을 수집했습니다.',
      zero: '지난 $days일간 수집한 문장이 없습니다',
    );
    return '$_temp0';
  }

  @override
  String relativeYesterdayWithTime(String time) {
    return '어제 $time';
  }

  @override
  String relativeDaysAgo(int days) {
    return '$days일 전';
  }

  @override
  String get labelEmotionComfort => '위로';

  @override
  String get labelEmotionRelief => '안도';

  @override
  String get labelEmotionCalm => '고요함';

  @override
  String get labelTopicInsight => '통찰';

  @override
  String get labelEmotionMelancholy => '서글픔';

  @override
  String get labelEmotionJoy => '환희';

  @override
  String get labelTopicReflection => '성찰';

  @override
  String get labelTopicTravel => '여행';

  @override
  String get labelTopicPhilosophy => '철학';

  @override
  String get captureQuoteSnack => '촬영 화면은 다음 단계에서 연결합니다.';
}
