import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// No description provided for @appName.
  ///
  /// In ko, this message translates to:
  /// **'북캐치'**
  String get appName;

  /// No description provided for @homeTitle.
  ///
  /// In ko, this message translates to:
  /// **'오늘의 문장'**
  String get homeTitle;

  /// No description provided for @homeDateLabel.
  ///
  /// In ko, this message translates to:
  /// **'{date}'**
  String homeDateLabel(String date);

  /// No description provided for @homeGreeting.
  ///
  /// In ko, this message translates to:
  /// **'안녕하세요, {readerName}'**
  String homeGreeting(String readerName);

  /// No description provided for @homeDefaultReaderName.
  ///
  /// In ko, this message translates to:
  /// **'독자님'**
  String get homeDefaultReaderName;

  /// No description provided for @todayUnderlineTitle.
  ///
  /// In ko, this message translates to:
  /// **'오늘의 밑줄'**
  String get todayUnderlineTitle;

  /// No description provided for @recentQuotesTitle.
  ///
  /// In ko, this message translates to:
  /// **'최근 기록'**
  String get recentQuotesTitle;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In ko, this message translates to:
  /// **'아직 수집한 문장이 없어요'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyBody.
  ///
  /// In ko, this message translates to:
  /// **'당신의 마음에 남은 책 속 한 줄을 기록하고 나만의 문장을 간직해보세요.'**
  String get homeEmptyBody;

  /// No description provided for @homeEmptyAction.
  ///
  /// In ko, this message translates to:
  /// **'첫 문장을 낚아보세요'**
  String get homeEmptyAction;

  /// No description provided for @homeEmptyHelpTitle.
  ///
  /// In ko, this message translates to:
  /// **'도움이 필요하신가요?'**
  String get homeEmptyHelpTitle;

  /// No description provided for @homeEmptyTipTitle.
  ///
  /// In ko, this message translates to:
  /// **'OCR로 빠르게 기록하기'**
  String get homeEmptyTipTitle;

  /// No description provided for @homeEmptyTipBody.
  ///
  /// In ko, this message translates to:
  /// **'사진으로 가져온 뒤 문장 영역만 선택하고 OCR 결과를 확인해 저장하세요.'**
  String get homeEmptyTipBody;

  /// No description provided for @homeEmptyFooterQuote.
  ///
  /// In ko, this message translates to:
  /// **'\"기록되지 않은 모든 것은 잊혀진다.\"'**
  String get homeEmptyFooterQuote;

  /// No description provided for @reminderStatusTitle.
  ///
  /// In ko, this message translates to:
  /// **'회상 알림'**
  String get reminderStatusTitle;

  /// No description provided for @weeklyReportTitle.
  ///
  /// In ko, this message translates to:
  /// **'이번 주의 사색 리포트'**
  String get weeklyReportTitle;

  /// No description provided for @viewAllAction.
  ///
  /// In ko, this message translates to:
  /// **'모두 보기'**
  String get viewAllAction;

  /// No description provided for @cancelAction.
  ///
  /// In ko, this message translates to:
  /// **'취소'**
  String get cancelAction;

  /// No description provided for @shareAction.
  ///
  /// In ko, this message translates to:
  /// **'공유하기'**
  String get shareAction;

  /// No description provided for @shareCardAction.
  ///
  /// In ko, this message translates to:
  /// **'카드 공유'**
  String get shareCardAction;

  /// No description provided for @shareAttribution.
  ///
  /// In ko, this message translates to:
  /// **'북캐치에서 공유됨.'**
  String get shareAttribution;

  /// No description provided for @transcribeAction.
  ///
  /// In ko, this message translates to:
  /// **'필사하기'**
  String get transcribeAction;

  /// No description provided for @captureQuoteAction.
  ///
  /// In ko, this message translates to:
  /// **'문장 잡기'**
  String get captureQuoteAction;

  /// No description provided for @settingsAction.
  ///
  /// In ko, this message translates to:
  /// **'설정'**
  String get settingsAction;

  /// No description provided for @settingsTitle.
  ///
  /// In ko, this message translates to:
  /// **'설정'**
  String get settingsTitle;

  /// No description provided for @libraryTitle.
  ///
  /// In ko, this message translates to:
  /// **'서재'**
  String get libraryTitle;

  /// No description provided for @librarySearchHint.
  ///
  /// In ko, this message translates to:
  /// **'문장, 도서, 키워드 검색'**
  String get librarySearchHint;

  /// No description provided for @libraryFilterAll.
  ///
  /// In ko, this message translates to:
  /// **'전체'**
  String get libraryFilterAll;

  /// No description provided for @libraryFilterByBook.
  ///
  /// In ko, this message translates to:
  /// **'도서별'**
  String get libraryFilterByBook;

  /// No description provided for @libraryFilterByEmotion.
  ///
  /// In ko, this message translates to:
  /// **'감정별'**
  String get libraryFilterByEmotion;

  /// No description provided for @libraryFilterBySituation.
  ///
  /// In ko, this message translates to:
  /// **'상황별'**
  String get libraryFilterBySituation;

  /// No description provided for @libraryFilterFavorites.
  ///
  /// In ko, this message translates to:
  /// **'즐겨찾기'**
  String get libraryFilterFavorites;

  /// No description provided for @libraryFoldersTitle.
  ///
  /// In ko, this message translates to:
  /// **'폴더'**
  String get libraryFoldersTitle;

  /// No description provided for @libraryFolderAll.
  ///
  /// In ko, this message translates to:
  /// **'전체'**
  String get libraryFolderAll;

  /// No description provided for @libraryFolderUncategorized.
  ///
  /// In ko, this message translates to:
  /// **'미분류'**
  String get libraryFolderUncategorized;

  /// No description provided for @libraryCreateFolderAction.
  ///
  /// In ko, this message translates to:
  /// **'폴더 만들기'**
  String get libraryCreateFolderAction;

  /// No description provided for @libraryCreateFolderTitle.
  ///
  /// In ko, this message translates to:
  /// **'새 폴더 만들기'**
  String get libraryCreateFolderTitle;

  /// No description provided for @libraryFolderNameLabel.
  ///
  /// In ko, this message translates to:
  /// **'폴더 이름'**
  String get libraryFolderNameLabel;

  /// No description provided for @libraryFolderNameHint.
  ///
  /// In ko, this message translates to:
  /// **'예: 다시 읽기'**
  String get libraryFolderNameHint;

  /// No description provided for @libraryFolderCreateConfirm.
  ///
  /// In ko, this message translates to:
  /// **'만들기'**
  String get libraryFolderCreateConfirm;

  /// No description provided for @libraryFolderCreateFailure.
  ///
  /// In ko, this message translates to:
  /// **'폴더를 만들지 못했습니다.'**
  String get libraryFolderCreateFailure;

  /// No description provided for @libraryMoveToFolderAction.
  ///
  /// In ko, this message translates to:
  /// **'폴더로 이동'**
  String get libraryMoveToFolderAction;

  /// No description provided for @libraryMoveToFolderTitle.
  ///
  /// In ko, this message translates to:
  /// **'이동할 폴더'**
  String get libraryMoveToFolderTitle;

  /// No description provided for @libraryFolderMoveFailure.
  ///
  /// In ko, this message translates to:
  /// **'폴더를 변경하지 못했습니다.'**
  String get libraryFolderMoveFailure;

  /// No description provided for @libraryFolderDeleteAction.
  ///
  /// In ko, this message translates to:
  /// **'폴더 삭제'**
  String get libraryFolderDeleteAction;

  /// No description provided for @libraryFolderDeleteTitle.
  ///
  /// In ko, this message translates to:
  /// **'폴더를 삭제할까요?'**
  String get libraryFolderDeleteTitle;

  /// No description provided for @libraryFolderDeleteMessage.
  ///
  /// In ko, this message translates to:
  /// **'{folderName} 폴더와 안의 문장 {count}개가 삭제됩니다.'**
  String libraryFolderDeleteMessage(String folderName, int count);

  /// No description provided for @libraryFolderDeleteConfirm.
  ///
  /// In ko, this message translates to:
  /// **'삭제하기'**
  String get libraryFolderDeleteConfirm;

  /// No description provided for @libraryFolderDeleteFailure.
  ///
  /// In ko, this message translates to:
  /// **'폴더를 삭제하지 못했습니다.'**
  String get libraryFolderDeleteFailure;

  /// No description provided for @libraryFolderEmptyTitle.
  ///
  /// In ko, this message translates to:
  /// **'이 폴더는 비어 있습니다'**
  String get libraryFolderEmptyTitle;

  /// No description provided for @libraryFolderEmptyBody.
  ///
  /// In ko, this message translates to:
  /// **'문장 카드의 기록 옵션에서 이 폴더로 이동할 수 있습니다.'**
  String get libraryFolderEmptyBody;

  /// No description provided for @libraryRecordedAt.
  ///
  /// In ko, this message translates to:
  /// **'기록일 {date}'**
  String libraryRecordedAt(String date);

  /// No description provided for @libraryQuoteReminderTime.
  ///
  /// In ko, this message translates to:
  /// **'알림 시간 {time}'**
  String libraryQuoteReminderTime(String time);

  /// No description provided for @libraryFavoriteAddAction.
  ///
  /// In ko, this message translates to:
  /// **'즐겨찾기에 추가'**
  String get libraryFavoriteAddAction;

  /// No description provided for @libraryFavoriteRemoveAction.
  ///
  /// In ko, this message translates to:
  /// **'즐겨찾기에서 제거'**
  String get libraryFavoriteRemoveAction;

  /// No description provided for @libraryQuoteMoreActions.
  ///
  /// In ko, this message translates to:
  /// **'기록 옵션'**
  String get libraryQuoteMoreActions;

  /// No description provided for @libraryQuoteEditAction.
  ///
  /// In ko, this message translates to:
  /// **'수정'**
  String get libraryQuoteEditAction;

  /// No description provided for @libraryQuoteEditTitle.
  ///
  /// In ko, this message translates to:
  /// **'문장 수정'**
  String get libraryQuoteEditTitle;

  /// No description provided for @libraryQuoteEditConfirm.
  ///
  /// In ko, this message translates to:
  /// **'저장'**
  String get libraryQuoteEditConfirm;

  /// No description provided for @libraryQuoteEditInProgress.
  ///
  /// In ko, this message translates to:
  /// **'문장을 수정하는 중입니다.'**
  String get libraryQuoteEditInProgress;

  /// No description provided for @libraryQuoteEditHelper.
  ///
  /// In ko, this message translates to:
  /// **'수정한 내용은 서재와 동기화 대기열에 반영됩니다.'**
  String get libraryQuoteEditHelper;

  /// No description provided for @libraryQuoteEditSuccess.
  ///
  /// In ko, this message translates to:
  /// **'문장을 수정했습니다.'**
  String get libraryQuoteEditSuccess;

  /// No description provided for @libraryQuoteEditFailure.
  ///
  /// In ko, this message translates to:
  /// **'문장을 수정하지 못했습니다.'**
  String get libraryQuoteEditFailure;

  /// No description provided for @libraryQuoteReminderAction.
  ///
  /// In ko, this message translates to:
  /// **'알림 설정'**
  String get libraryQuoteReminderAction;

  /// No description provided for @libraryQuoteDeleteAction.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get libraryQuoteDeleteAction;

  /// No description provided for @libraryQuoteDeleteTitle.
  ///
  /// In ko, this message translates to:
  /// **'기록을 삭제할까요?'**
  String get libraryQuoteDeleteTitle;

  /// No description provided for @libraryQuoteDeleteMessage.
  ///
  /// In ko, this message translates to:
  /// **'삭제한 기록은 서재와 홈에서 사라집니다.'**
  String get libraryQuoteDeleteMessage;

  /// No description provided for @libraryQuoteDeleteConfirm.
  ///
  /// In ko, this message translates to:
  /// **'삭제하기'**
  String get libraryQuoteDeleteConfirm;

  /// No description provided for @libraryQuoteDeleteSuccess.
  ///
  /// In ko, this message translates to:
  /// **'기록을 삭제했습니다.'**
  String get libraryQuoteDeleteSuccess;

  /// No description provided for @libraryQuoteDeleteFailure.
  ///
  /// In ko, this message translates to:
  /// **'기록을 삭제하지 못했습니다.'**
  String get libraryQuoteDeleteFailure;

  /// No description provided for @libraryQuoteExportMarkdownAction.
  ///
  /// In ko, this message translates to:
  /// **'Markdown 내보내기'**
  String get libraryQuoteExportMarkdownAction;

  /// No description provided for @libraryEmptySearchHint.
  ///
  /// In ko, this message translates to:
  /// **'보관된 문장 검색'**
  String get libraryEmptySearchHint;

  /// No description provided for @libraryEmptyTitle.
  ///
  /// In ko, this message translates to:
  /// **'나만의 문장 보관함이 비어 있습니다'**
  String get libraryEmptyTitle;

  /// No description provided for @libraryEmptyBody.
  ///
  /// In ko, this message translates to:
  /// **'마음에 닿은 구절을 기록하고\n나만의 사색 아카이브를 만들어보세요'**
  String get libraryEmptyBody;

  /// No description provided for @libraryEmptyAction.
  ///
  /// In ko, this message translates to:
  /// **'문장 저장하기'**
  String get libraryEmptyAction;

  /// No description provided for @exportMarkdownSuccessMessage.
  ///
  /// In ko, this message translates to:
  /// **'Markdown 파일을 준비했습니다.'**
  String get exportMarkdownSuccessMessage;

  /// No description provided for @exportMarkdownFailureMessage.
  ///
  /// In ko, this message translates to:
  /// **'내보내기에 실패했습니다.'**
  String get exportMarkdownFailureMessage;

  /// No description provided for @exportMarkdownMissingSource.
  ///
  /// In ko, this message translates to:
  /// **'출처 미입력'**
  String get exportMarkdownMissingSource;

  /// No description provided for @exportMarkdownMemoHeading.
  ///
  /// In ko, this message translates to:
  /// **'메모'**
  String get exportMarkdownMemoHeading;

  /// No description provided for @settingsNotificationSection.
  ///
  /// In ko, this message translates to:
  /// **'알림 및 회상'**
  String get settingsNotificationSection;

  /// No description provided for @settingsNotificationSchedule.
  ///
  /// In ko, this message translates to:
  /// **'전체 알림 시간/빈도 설정'**
  String get settingsNotificationSchedule;

  /// No description provided for @settingsDataSection.
  ///
  /// In ko, this message translates to:
  /// **'데이터 관리'**
  String get settingsDataSection;

  /// No description provided for @settingsSaveOriginalPhotos.
  ///
  /// In ko, this message translates to:
  /// **'사진 원본 저장 여부'**
  String get settingsSaveOriginalPhotos;

  /// No description provided for @settingsInfoSection.
  ///
  /// In ko, this message translates to:
  /// **'정보'**
  String get settingsInfoSection;

  /// No description provided for @settingsCopyrightGuide.
  ///
  /// In ko, this message translates to:
  /// **'저작권/공유 안내'**
  String get settingsCopyrightGuide;

  /// No description provided for @settingsAppVersion.
  ///
  /// In ko, this message translates to:
  /// **'앱 버전 정보'**
  String get settingsAppVersion;

  /// No description provided for @settingsFooter.
  ///
  /// In ko, this message translates to:
  /// **'북캐치는 당신의 모든 사색을 소중히 보관합니다.\n오늘도 책과 함께 평온한 하루 되세요.'**
  String get settingsFooter;

  /// No description provided for @homeTab.
  ///
  /// In ko, this message translates to:
  /// **'홈'**
  String get homeTab;

  /// No description provided for @recordTab.
  ///
  /// In ko, this message translates to:
  /// **'기록'**
  String get recordTab;

  /// No description provided for @libraryTab.
  ///
  /// In ko, this message translates to:
  /// **'서재'**
  String get libraryTab;

  /// No description provided for @settingsTab.
  ///
  /// In ko, this message translates to:
  /// **'설정'**
  String get settingsTab;

  /// No description provided for @recordTitle.
  ///
  /// In ko, this message translates to:
  /// **'문장 기록'**
  String get recordTitle;

  /// No description provided for @recordIntroTitle.
  ///
  /// In ko, this message translates to:
  /// **'문장을 어떻게 기록할까요?'**
  String get recordIntroTitle;

  /// No description provided for @recordIntroBody.
  ///
  /// In ko, this message translates to:
  /// **'책을 읽다 멈춘 문장을 바로 입력하거나, 사진에서 가져올 수 있어요.'**
  String get recordIntroBody;

  /// No description provided for @recordEmptyTitle.
  ///
  /// In ko, this message translates to:
  /// **'오늘의 회상이\n기다리고 있어요'**
  String get recordEmptyTitle;

  /// No description provided for @recordEmptyBody.
  ///
  /// In ko, this message translates to:
  /// **'아직 저장된 문장이 없어\n회상을 시작할 수 없습니다.'**
  String get recordEmptyBody;

  /// No description provided for @recordEmptyAction.
  ///
  /// In ko, this message translates to:
  /// **'문장 저장하러 가기'**
  String get recordEmptyAction;

  /// No description provided for @recordEmptyHelper.
  ///
  /// In ko, this message translates to:
  /// **'독서 중 마음에 드는 문장을 캡처해보세요'**
  String get recordEmptyHelper;

  /// No description provided for @recordImportPhotoAction.
  ///
  /// In ko, this message translates to:
  /// **'사진으로 가져오기'**
  String get recordImportPhotoAction;

  /// No description provided for @recordImportPhotoCamera.
  ///
  /// In ko, this message translates to:
  /// **'카메라로 촬영'**
  String get recordImportPhotoCamera;

  /// No description provided for @recordImportPhotoGallery.
  ///
  /// In ko, this message translates to:
  /// **'사진 보관함에서 선택'**
  String get recordImportPhotoGallery;

  /// No description provided for @recordImportPhotoInProgress.
  ///
  /// In ko, this message translates to:
  /// **'사진에서 문장을 읽는 중입니다'**
  String get recordImportPhotoInProgress;

  /// No description provided for @recordImportPhotoNoText.
  ///
  /// In ko, this message translates to:
  /// **'사진에서 문장을 찾지 못했습니다.'**
  String get recordImportPhotoNoText;

  /// No description provided for @recordImportPhotoFailure.
  ///
  /// In ko, this message translates to:
  /// **'사진에서 문장을 가져오지 못했습니다.'**
  String get recordImportPhotoFailure;

  /// No description provided for @recordImportPhotoOverwriteTitle.
  ///
  /// In ko, this message translates to:
  /// **'기존 문장을 바꿀까요?'**
  String get recordImportPhotoOverwriteTitle;

  /// No description provided for @recordImportPhotoOverwriteMessage.
  ///
  /// In ko, this message translates to:
  /// **'현재 입력한 문장을 사진에서 읽은 텍스트로 바꿉니다.'**
  String get recordImportPhotoOverwriteMessage;

  /// No description provided for @recordImportPhotoOverwriteConfirm.
  ///
  /// In ko, this message translates to:
  /// **'바꾸기'**
  String get recordImportPhotoOverwriteConfirm;

  /// No description provided for @recordPhotoCropTitle.
  ///
  /// In ko, this message translates to:
  /// **'문장 영역 선택'**
  String get recordPhotoCropTitle;

  /// No description provided for @recordPhotoCropReset.
  ///
  /// In ko, this message translates to:
  /// **'영역 다시 맞추기'**
  String get recordPhotoCropReset;

  /// No description provided for @recordPhotoCropUseSelection.
  ///
  /// In ko, this message translates to:
  /// **'선택 영역 가져오기'**
  String get recordPhotoCropUseSelection;

  /// No description provided for @recordPhotoCropUseFullImage.
  ///
  /// In ko, this message translates to:
  /// **'전체 사진 사용'**
  String get recordPhotoCropUseFullImage;

  /// No description provided for @recordBookQuestion.
  ///
  /// In ko, this message translates to:
  /// **'어떤 책의 문장인가요?'**
  String get recordBookQuestion;

  /// No description provided for @recordBookPlaceholder.
  ///
  /// In ko, this message translates to:
  /// **'책을 선택하거나 입력하세요'**
  String get recordBookPlaceholder;

  /// No description provided for @recordRecentBookLabel.
  ///
  /// In ko, this message translates to:
  /// **'(최근 기록)'**
  String get recordRecentBookLabel;

  /// No description provided for @recordAuthorLabel.
  ///
  /// In ko, this message translates to:
  /// **'저자'**
  String get recordAuthorLabel;

  /// No description provided for @recordAuthorPlaceholder.
  ///
  /// In ko, this message translates to:
  /// **'저자 이름을 입력하세요'**
  String get recordAuthorPlaceholder;

  /// No description provided for @recordEditQuoteLabel.
  ///
  /// In ko, this message translates to:
  /// **'문장 편집'**
  String get recordEditQuoteLabel;

  /// No description provided for @recordQuotePlaceholder.
  ///
  /// In ko, this message translates to:
  /// **'기억하고 싶은 문장을 입력하세요...'**
  String get recordQuotePlaceholder;

  /// No description provided for @recordPageLabel.
  ///
  /// In ko, this message translates to:
  /// **'페이지'**
  String get recordPageLabel;

  /// No description provided for @recordEmotionLabel.
  ///
  /// In ko, this message translates to:
  /// **'감정 기록'**
  String get recordEmotionLabel;

  /// No description provided for @recordCustomEmotionPlaceholder.
  ///
  /// In ko, this message translates to:
  /// **'감정 라벨 추가'**
  String get recordCustomEmotionPlaceholder;

  /// No description provided for @recordCustomEmotionAddAction.
  ///
  /// In ko, this message translates to:
  /// **'감정 추가'**
  String get recordCustomEmotionAddAction;

  /// No description provided for @recordCustomEmotionDuplicate.
  ///
  /// In ko, this message translates to:
  /// **'이미 추가된 감정입니다.'**
  String get recordCustomEmotionDuplicate;

  /// No description provided for @recordMemoLabel.
  ///
  /// In ko, this message translates to:
  /// **'메모'**
  String get recordMemoLabel;

  /// No description provided for @recordMemoPlaceholder.
  ///
  /// In ko, this message translates to:
  /// **'이 문장에 멈춘 이유를 적어보세요.'**
  String get recordMemoPlaceholder;

  /// No description provided for @recordSaveAction.
  ///
  /// In ko, this message translates to:
  /// **'문장 보관하기'**
  String get recordSaveAction;

  /// No description provided for @recordSaveHelper.
  ///
  /// In ko, this message translates to:
  /// **'문장이 안전하게 서재에 보관됩니다.'**
  String get recordSaveHelper;

  /// No description provided for @recordSaveValidationEmptyQuote.
  ///
  /// In ko, this message translates to:
  /// **'보관할 문장을 먼저 입력해주세요.'**
  String get recordSaveValidationEmptyQuote;

  /// No description provided for @recordSaveInProgress.
  ///
  /// In ko, this message translates to:
  /// **'문장을 보관하는 중입니다.'**
  String get recordSaveInProgress;

  /// No description provided for @recordSaveLocalOnly.
  ///
  /// In ko, this message translates to:
  /// **'문장을 이 기기에 보관했습니다.'**
  String get recordSaveLocalOnly;

  /// No description provided for @recordSaveSyncDeferred.
  ///
  /// In ko, this message translates to:
  /// **'문장을 보관했습니다. 동기화는 연결되면 이어집니다.'**
  String get recordSaveSyncDeferred;

  /// No description provided for @recordSaveSynced.
  ///
  /// In ko, this message translates to:
  /// **'문장을 안전하게 보관했습니다.'**
  String get recordSaveSynced;

  /// No description provided for @recordSaveSnack.
  ///
  /// In ko, this message translates to:
  /// **'문장이 안전하게 보관되었습니다.'**
  String get recordSaveSnack;

  /// No description provided for @quoteSourceWithPage.
  ///
  /// In ko, this message translates to:
  /// **'{author}, 『{bookTitle}』 {page}'**
  String quoteSourceWithPage(String author, String bookTitle, String page);

  /// No description provided for @quoteSource.
  ///
  /// In ko, this message translates to:
  /// **'{author}, 『{bookTitle}』'**
  String quoteSource(String author, String bookTitle);

  /// No description provided for @quoteSourceBookOnly.
  ///
  /// In ko, this message translates to:
  /// **'『{bookTitle}』'**
  String quoteSourceBookOnly(String bookTitle);

  /// No description provided for @quoteSourceBookWithPage.
  ///
  /// In ko, this message translates to:
  /// **'『{bookTitle}』 {page}'**
  String quoteSourceBookWithPage(String bookTitle, String page);

  /// No description provided for @quoteSourceAuthorWithPage.
  ///
  /// In ko, this message translates to:
  /// **'{author} · {page}'**
  String quoteSourceAuthorWithPage(String author, String page);

  /// No description provided for @reminderStatusOn.
  ///
  /// In ko, this message translates to:
  /// **'{count, plural, =0{{time}에 예정된 {label} 문장이 없습니다} other{{time}, {label} 문장 {count}개가 찾아옵니다}}'**
  String reminderStatusOn(int count, String time, String label);

  /// No description provided for @reminderStatusOff.
  ///
  /// In ko, this message translates to:
  /// **'회상 알림이 꺼져 있어요'**
  String get reminderStatusOff;

  /// No description provided for @reminderOccurrenceToday.
  ///
  /// In ko, this message translates to:
  /// **'오늘 {time}'**
  String reminderOccurrenceToday(String time);

  /// No description provided for @reminderOccurrenceTomorrow.
  ///
  /// In ko, this message translates to:
  /// **'내일 {time}'**
  String reminderOccurrenceTomorrow(String time);

  /// No description provided for @reminderOccurrenceThisWeek.
  ///
  /// In ko, this message translates to:
  /// **'이번 주 {weekday} {time}'**
  String reminderOccurrenceThisWeek(String weekday, String time);

  /// No description provided for @reminderSettingsTitle.
  ///
  /// In ko, this message translates to:
  /// **'회상 알림 설정'**
  String get reminderSettingsTitle;

  /// No description provided for @reminderEnableSwitch.
  ///
  /// In ko, this message translates to:
  /// **'회상 알림'**
  String get reminderEnableSwitch;

  /// No description provided for @reminderTimeLabel.
  ///
  /// In ko, this message translates to:
  /// **'시간'**
  String get reminderTimeLabel;

  /// No description provided for @reminderWeekdaysLabel.
  ///
  /// In ko, this message translates to:
  /// **'요일'**
  String get reminderWeekdaysLabel;

  /// No description provided for @reminderRepeatLabel.
  ///
  /// In ko, this message translates to:
  /// **'반복'**
  String get reminderRepeatLabel;

  /// No description provided for @reminderLabelRuleLabel.
  ///
  /// In ko, this message translates to:
  /// **'라벨'**
  String get reminderLabelRuleLabel;

  /// No description provided for @reminderRepeatOnce.
  ///
  /// In ko, this message translates to:
  /// **'한 번만'**
  String get reminderRepeatOnce;

  /// No description provided for @reminderRepeatWeekly.
  ///
  /// In ko, this message translates to:
  /// **'매주 반복'**
  String get reminderRepeatWeekly;

  /// No description provided for @reminderRepeatOnceDescription.
  ///
  /// In ko, this message translates to:
  /// **'선택한 각 요일에 한 번씩 알림을 보냅니다.'**
  String get reminderRepeatOnceDescription;

  /// No description provided for @reminderLabelAll.
  ///
  /// In ko, this message translates to:
  /// **'전체'**
  String get reminderLabelAll;

  /// No description provided for @reminderSaveAction.
  ///
  /// In ko, this message translates to:
  /// **'저장'**
  String get reminderSaveAction;

  /// No description provided for @reminderPermissionDenied.
  ///
  /// In ko, this message translates to:
  /// **'알림 권한이 꺼져 있어요. 기기 설정에서 권한을 켠 뒤 다시 시도해주세요.'**
  String get reminderPermissionDenied;

  /// No description provided for @reminderEmptyWeekdays.
  ///
  /// In ko, this message translates to:
  /// **'알림을 받을 요일을 하나 이상 선택해주세요.'**
  String get reminderEmptyWeekdays;

  /// No description provided for @reminderScheduleFailed.
  ///
  /// In ko, this message translates to:
  /// **'알림을 저장하지 못했습니다. 잠시 뒤 다시 시도해주세요.'**
  String get reminderScheduleFailed;

  /// No description provided for @reminderSettingsSaved.
  ///
  /// In ko, this message translates to:
  /// **'회상 알림을 저장했습니다.'**
  String get reminderSettingsSaved;

  /// No description provided for @reminderNotificationTitle.
  ///
  /// In ko, this message translates to:
  /// **'저장한 문장이 기다려요'**
  String get reminderNotificationTitle;

  /// No description provided for @reminderNotificationBody.
  ///
  /// In ko, this message translates to:
  /// **'북캐치에서 오늘의 문장을 다시 떠올려보세요.'**
  String get reminderNotificationBody;

  /// No description provided for @quoteReminderSettingsTitle.
  ///
  /// In ko, this message translates to:
  /// **'문장 알림 설정'**
  String get quoteReminderSettingsTitle;

  /// No description provided for @quoteReminderEnableSwitch.
  ///
  /// In ko, this message translates to:
  /// **'문장 알림'**
  String get quoteReminderEnableSwitch;

  /// No description provided for @quoteReminderTimeLabel.
  ///
  /// In ko, this message translates to:
  /// **'시간'**
  String get quoteReminderTimeLabel;

  /// No description provided for @quoteReminderWeekdaysLabel.
  ///
  /// In ko, this message translates to:
  /// **'요일'**
  String get quoteReminderWeekdaysLabel;

  /// No description provided for @quoteReminderRepeatLabel.
  ///
  /// In ko, this message translates to:
  /// **'반복'**
  String get quoteReminderRepeatLabel;

  /// No description provided for @quoteReminderRepeatOnce.
  ///
  /// In ko, this message translates to:
  /// **'한 번만'**
  String get quoteReminderRepeatOnce;

  /// No description provided for @quoteReminderRepeatWeekly.
  ///
  /// In ko, this message translates to:
  /// **'매주 반복'**
  String get quoteReminderRepeatWeekly;

  /// No description provided for @quoteReminderRepeatOnceDescription.
  ///
  /// In ko, this message translates to:
  /// **'선택한 각 요일에 한 번씩 이 문장을 알려줍니다.'**
  String get quoteReminderRepeatOnceDescription;

  /// No description provided for @quoteReminderSaveAction.
  ///
  /// In ko, this message translates to:
  /// **'저장'**
  String get quoteReminderSaveAction;

  /// No description provided for @quoteReminderSettingsSaved.
  ///
  /// In ko, this message translates to:
  /// **'문장 알림을 저장했습니다.'**
  String get quoteReminderSettingsSaved;

  /// No description provided for @quoteReminderPermissionDenied.
  ///
  /// In ko, this message translates to:
  /// **'알림 권한이 꺼져 있어요. 기기 설정에서 권한을 켠 뒤 다시 시도해주세요.'**
  String get quoteReminderPermissionDenied;

  /// No description provided for @quoteReminderEmptyWeekdays.
  ///
  /// In ko, this message translates to:
  /// **'알림을 받을 요일을 하나 이상 선택해주세요.'**
  String get quoteReminderEmptyWeekdays;

  /// No description provided for @quoteReminderPendingLimitReached.
  ///
  /// In ko, this message translates to:
  /// **'예약 가능한 알림 수를 초과했습니다. 다른 문장 알림을 줄인 뒤 다시 시도해주세요.'**
  String get quoteReminderPendingLimitReached;

  /// No description provided for @quoteReminderScheduleFailed.
  ///
  /// In ko, this message translates to:
  /// **'문장 알림을 저장하지 못했습니다. 잠시 뒤 다시 시도해주세요.'**
  String get quoteReminderScheduleFailed;

  /// No description provided for @quoteReminderNotificationTitle.
  ///
  /// In ko, this message translates to:
  /// **'문장이 다시 찾아왔어요'**
  String get quoteReminderNotificationTitle;

  /// No description provided for @quoteReminderNotificationBody.
  ///
  /// In ko, this message translates to:
  /// **'{quote}'**
  String quoteReminderNotificationBody(String quote);

  /// No description provided for @recallTitle.
  ///
  /// In ko, this message translates to:
  /// **'회상'**
  String get recallTitle;

  /// No description provided for @recallTodayReflectionTitle.
  ///
  /// In ko, this message translates to:
  /// **'오늘의 사색'**
  String get recallTodayReflectionTitle;

  /// No description provided for @recallQuestionOneLabel.
  ///
  /// In ko, this message translates to:
  /// **'질문 1'**
  String get recallQuestionOneLabel;

  /// No description provided for @recallQuestionOnePrompt.
  ///
  /// In ko, this message translates to:
  /// **'이 문장이 여전히 당신의 마음속에 울림을 주나요?'**
  String get recallQuestionOnePrompt;

  /// No description provided for @recallQuestionOneHint.
  ///
  /// In ko, this message translates to:
  /// **'지금 떠오르는 생각을 적어보세요.'**
  String get recallQuestionOneHint;

  /// No description provided for @recallQuestionTwoLabel.
  ///
  /// In ko, this message translates to:
  /// **'질문 2'**
  String get recallQuestionTwoLabel;

  /// No description provided for @recallQuestionTwoPrompt.
  ///
  /// In ko, this message translates to:
  /// **'그때의 감정과 지금의 감정은 어떻게 다른가요?'**
  String get recallQuestionTwoPrompt;

  /// No description provided for @recallQuestionTwoHint.
  ///
  /// In ko, this message translates to:
  /// **'감정의 변화를 적어보세요.'**
  String get recallQuestionTwoHint;

  /// No description provided for @recallPreviousRecordsTitle.
  ///
  /// In ko, this message translates to:
  /// **'이 문장에 대한 이전 기록'**
  String get recallPreviousRecordsTitle;

  /// No description provided for @recallEmptyHistory.
  ///
  /// In ko, this message translates to:
  /// **'아직 이 문장에 대한 이전 기록이 없습니다.'**
  String get recallEmptyHistory;

  /// No description provided for @recallSavedMessage.
  ///
  /// In ko, this message translates to:
  /// **'이 문장에 대한 기록을 저장했습니다.'**
  String get recallSavedMessage;

  /// No description provided for @recallEmptyReflectionMessage.
  ///
  /// In ko, this message translates to:
  /// **'질문에 대한 생각을 하나 이상 입력해주세요.'**
  String get recallEmptyReflectionMessage;

  /// No description provided for @recallRecordedNow.
  ///
  /// In ko, this message translates to:
  /// **'방금 전'**
  String get recallRecordedNow;

  /// No description provided for @recallRecordedAt.
  ///
  /// In ko, this message translates to:
  /// **'{date} 기록'**
  String recallRecordedAt(String date);

  /// No description provided for @weekdayMonday.
  ///
  /// In ko, this message translates to:
  /// **'월'**
  String get weekdayMonday;

  /// No description provided for @weekdayTuesday.
  ///
  /// In ko, this message translates to:
  /// **'화'**
  String get weekdayTuesday;

  /// No description provided for @weekdayWednesday.
  ///
  /// In ko, this message translates to:
  /// **'수'**
  String get weekdayWednesday;

  /// No description provided for @weekdayThursday.
  ///
  /// In ko, this message translates to:
  /// **'목'**
  String get weekdayThursday;

  /// No description provided for @weekdayFriday.
  ///
  /// In ko, this message translates to:
  /// **'금'**
  String get weekdayFriday;

  /// No description provided for @weekdaySaturday.
  ///
  /// In ko, this message translates to:
  /// **'토'**
  String get weekdaySaturday;

  /// No description provided for @weekdaySunday.
  ///
  /// In ko, this message translates to:
  /// **'일'**
  String get weekdaySunday;

  /// No description provided for @weeklyReportSummary.
  ///
  /// In ko, this message translates to:
  /// **'{count, plural, =0{지난 {days}일간 수집한 문장이 없습니다} other{지난 {days}일간 {count}개의 문장을 수집했습니다.}}'**
  String weeklyReportSummary(int count, int days);

  /// No description provided for @relativeYesterdayWithTime.
  ///
  /// In ko, this message translates to:
  /// **'어제 {time}'**
  String relativeYesterdayWithTime(String time);

  /// No description provided for @relativeDaysAgo.
  ///
  /// In ko, this message translates to:
  /// **'{days}일 전'**
  String relativeDaysAgo(int days);

  /// No description provided for @labelEmotionComfort.
  ///
  /// In ko, this message translates to:
  /// **'위로'**
  String get labelEmotionComfort;

  /// No description provided for @labelEmotionRelief.
  ///
  /// In ko, this message translates to:
  /// **'안도'**
  String get labelEmotionRelief;

  /// No description provided for @labelEmotionCalm.
  ///
  /// In ko, this message translates to:
  /// **'고요함'**
  String get labelEmotionCalm;

  /// No description provided for @labelTopicInsight.
  ///
  /// In ko, this message translates to:
  /// **'통찰'**
  String get labelTopicInsight;

  /// No description provided for @labelEmotionMelancholy.
  ///
  /// In ko, this message translates to:
  /// **'서글픔'**
  String get labelEmotionMelancholy;

  /// No description provided for @labelEmotionJoy.
  ///
  /// In ko, this message translates to:
  /// **'환희'**
  String get labelEmotionJoy;

  /// No description provided for @labelTopicReflection.
  ///
  /// In ko, this message translates to:
  /// **'성찰'**
  String get labelTopicReflection;

  /// No description provided for @labelTopicTravel.
  ///
  /// In ko, this message translates to:
  /// **'여행'**
  String get labelTopicTravel;

  /// No description provided for @labelTopicPhilosophy.
  ///
  /// In ko, this message translates to:
  /// **'철학'**
  String get labelTopicPhilosophy;

  /// No description provided for @captureQuoteSnack.
  ///
  /// In ko, this message translates to:
  /// **'촬영 화면은 다음 단계에서 연결합니다.'**
  String get captureQuoteSnack;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
