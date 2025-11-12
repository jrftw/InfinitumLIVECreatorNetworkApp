import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_ain.dart';
import 'app_localizations_ak.dart';
import 'app_localizations_am.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_arc.dart';
import 'app_localizations_as.dart';
import 'app_localizations_ay.dart';
import 'app_localizations_az.dart';
import 'app_localizations_ban.dart';
import 'app_localizations_bcl.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bho.dart';
import 'app_localizations_bi.dart';
import 'app_localizations_bm.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bo.dart';
import 'app_localizations_brh.dart';
import 'app_localizations_bs.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_ceb.dart';
import 'app_localizations_ch.dart';
import 'app_localizations_chk.dart';
import 'app_localizations_cho.dart';
import 'app_localizations_chy.dart';
import 'app_localizations_cr.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_dz.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_ff.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fj.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_gd.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hak.dart';
import 'app_localizations_haw.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hmn.dart';
import 'app_localizations_ho.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_ht.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_hy.dart';
import 'app_localizations_iba.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ig.dart';
import 'app_localizations_ilo.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_iu.dart';
import 'app_localizations_ium.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_jv.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kar.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_km.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ks.dart';
import 'app_localizations_ku.dart';
import 'app_localizations_la.dart';
import 'app_localizations_lb.dart';
import 'app_localizations_lg.dart';
import 'app_localizations_lo.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_luo.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mh.dart';
import 'app_localizations_mi.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mn.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_mrw.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_mt.dart';
import 'app_localizations_my.dart';
import 'app_localizations_myn.dart';
import 'app_localizations_na.dart';
import 'app_localizations_nah.dart';
import 'app_localizations_nan.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_niu.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_no.dart';
import 'app_localizations_nv.dart';
import 'app_localizations_ny.dart';
import 'app_localizations_oj.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pag.dart';
import 'app_localizations_pam.dart';
import 'app_localizations_pap.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_prs.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_qu.dart';
import 'app_localizations_rap.dart';
import 'app_localizations_rn.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_rw.dart';
import 'app_localizations_sa.dart';
import 'app_localizations_sd.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sm.dart';
import 'app_localizations_sn.dart';
import 'app_localizations_so.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_tay.dart';
import 'app_localizations_te.dart';
import 'app_localizations_tet.dart';
import 'app_localizations_th.dart';
import 'app_localizations_ti.dart';
import 'app_localizations_tk.dart';
import 'app_localizations_tkl.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tn.dart';
import 'app_localizations_to.dart';
import 'app_localizations_tpi.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_tsg.dart';
import 'app_localizations_ty.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_uz.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_war.dart';
import 'app_localizations_wuu.dart';
import 'app_localizations_xh.dart';
import 'app_localizations_yap.dart';
import 'app_localizations_yi.dart';
import 'app_localizations_yo.dart';
import 'app_localizations_yue.dart';
import 'app_localizations_zap.dart';
import 'app_localizations_zh.dart';
import 'app_localizations_zu.dart';

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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('af'),
    Locale('ain'),
    Locale('ak'),
    Locale('am'),
    Locale('ar'),
    Locale('arc'),
    Locale('as'),
    Locale('ay'),
    Locale('az'),
    Locale('ban'),
    Locale('bcl'),
    Locale('bg'),
    Locale('bho'),
    Locale('bi'),
    Locale('bm'),
    Locale('bn'),
    Locale('bo'),
    Locale('brh'),
    Locale('bs'),
    Locale('ca'),
    Locale('ceb'),
    Locale('ch'),
    Locale('chk'),
    Locale('cho'),
    Locale('chy'),
    Locale('cr'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('dz'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('fa'),
    Locale('ff'),
    Locale('fi'),
    Locale('fil'),
    Locale('fj'),
    Locale('fr'),
    Locale('ga'),
    Locale('gd'),
    Locale('gl'),
    Locale('gu'),
    Locale('hak'),
    Locale('haw'),
    Locale('he'),
    Locale('hi'),
    Locale('hmn'),
    Locale('ho'),
    Locale('hr'),
    Locale('ht'),
    Locale('hu'),
    Locale('hy'),
    Locale('iba'),
    Locale('id'),
    Locale('ig'),
    Locale('ilo'),
    Locale('is'),
    Locale('it'),
    Locale('iu'),
    Locale('ium'),
    Locale('ja'),
    Locale('jv'),
    Locale('ka'),
    Locale('kar'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('ks'),
    Locale('ku'),
    Locale('la'),
    Locale('lb'),
    Locale('lg'),
    Locale('lo'),
    Locale('lt'),
    Locale('luo'),
    Locale('lv'),
    Locale('mh'),
    Locale('mi'),
    Locale('mk'),
    Locale('ml'),
    Locale('mn'),
    Locale('mr'),
    Locale('mrw'),
    Locale('ms'),
    Locale('mt'),
    Locale('my'),
    Locale('myn'),
    Locale('na'),
    Locale('nah'),
    Locale('nan'),
    Locale('ne'),
    Locale('niu'),
    Locale('nl'),
    Locale('no'),
    Locale('nv'),
    Locale('ny'),
    Locale('oj'),
    Locale('pa'),
    Locale('pag'),
    Locale('pam'),
    Locale('pap'),
    Locale('pl'),
    Locale('prs'),
    Locale('pt'),
    Locale('qu'),
    Locale('rap'),
    Locale('rn'),
    Locale('ro'),
    Locale('ru'),
    Locale('rw'),
    Locale('sa'),
    Locale('sd'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sm'),
    Locale('sn'),
    Locale('so'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('tay'),
    Locale('te'),
    Locale('tet'),
    Locale('th'),
    Locale('ti'),
    Locale('tk'),
    Locale('tkl'),
    Locale('tl'),
    Locale('tn'),
    Locale('to'),
    Locale('tpi'),
    Locale('tr'),
    Locale('tsg'),
    Locale('ty'),
    Locale('ug'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('war'),
    Locale('wuu'),
    Locale('xh'),
    Locale('yap'),
    Locale('yi'),
    Locale('yo'),
    Locale('yue'),
    Locale('zap'),
    Locale('zh'),
    Locale('zh', 'CN'),
    Locale('zu')
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE Creator Network'**
  String get appName;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @announcements.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announcements;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @toolsAndServices.
  ///
  /// In en, this message translates to:
  /// **'Tools & Services'**
  String get toolsAndServices;

  /// No description provided for @quickLinks.
  ///
  /// In en, this message translates to:
  /// **'Quick Links'**
  String get quickLinks;

  /// No description provided for @merch.
  ///
  /// In en, this message translates to:
  /// **'Merch'**
  String get merch;

  /// No description provided for @merchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shop Infinitum LIVE apparel'**
  String get merchSubtitle;

  /// No description provided for @estimateEarnings.
  ///
  /// In en, this message translates to:
  /// **'Estimate Earnings'**
  String get estimateEarnings;

  /// No description provided for @estimateEarningsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Calculate your potential earnings'**
  String get estimateEarningsSubtitle;

  /// No description provided for @shadowBanChecker.
  ///
  /// In en, this message translates to:
  /// **'Shadow Ban Checker'**
  String get shadowBanChecker;

  /// No description provided for @shadowBanCheckerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check if your account is shadow banned'**
  String get shadowBanCheckerSubtitle;

  /// No description provided for @viewDashboard.
  ///
  /// In en, this message translates to:
  /// **'View Dashboard (iView)'**
  String get viewDashboard;

  /// No description provided for @viewDashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access your InfiniView Creator Dashboard'**
  String get viewDashboardSubtitle;

  /// No description provided for @onboarding.
  ///
  /// In en, this message translates to:
  /// **'Onboarding'**
  String get onboarding;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start your onboarding process'**
  String get onboardingSubtitle;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @websiteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Visit infinitumlive.com'**
  String get websiteSubtitle;

  /// No description provided for @howToApply.
  ///
  /// In en, this message translates to:
  /// **'How to Apply'**
  String get howToApply;

  /// No description provided for @howToApplySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn how to join the network'**
  String get howToApplySubtitle;

  /// No description provided for @applyTikTokLive.
  ///
  /// In en, this message translates to:
  /// **'Apply for TikTok LIVE Creator Network'**
  String get applyTikTokLive;

  /// No description provided for @applyTikTokLiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join the TikTok LIVE Creator Network'**
  String get applyTikTokLiveSubtitle;

  /// No description provided for @applyTikTokShop.
  ///
  /// In en, this message translates to:
  /// **'Apply for TikTok Shop Agency'**
  String get applyTikTokShop;

  /// No description provided for @applyTikTokShopSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Apply for TikTok Shop partnership'**
  String get applyTikTokShopSubtitle;

  /// No description provided for @applyFavoritedLive.
  ///
  /// In en, this message translates to:
  /// **'Apply for Favorited LIVE Agency'**
  String get applyFavoritedLive;

  /// No description provided for @applyFavoritedLiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join the Favorited LIVE Creator Network'**
  String get applyFavoritedLiveSubtitle;

  /// No description provided for @couldNotOpen.
  ///
  /// In en, this message translates to:
  /// **'Could not open {title}'**
  String couldNotOpen(String title);

  /// No description provided for @cannotOpen.
  ///
  /// In en, this message translates to:
  /// **'Cannot open {title}'**
  String cannotOpen(String title);

  /// No description provided for @errorOpening.
  ///
  /// In en, this message translates to:
  /// **'Error opening {title}'**
  String errorOpening(String title);

  /// No description provided for @noAnnouncementsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No announcements available'**
  String get noAnnouncementsAvailable;

  /// No description provided for @important.
  ///
  /// In en, this message translates to:
  /// **'IMPORTANT'**
  String get important;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(int count);

  /// No description provided for @anErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get anErrorOccurred;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noStatisticsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No statistics available'**
  String get noStatisticsAvailable;

  /// No description provided for @creatorNetworkStatistics.
  ///
  /// In en, this message translates to:
  /// **'Creator Network Statistics'**
  String get creatorNetworkStatistics;

  /// No description provided for @realTimeDataFromNetwork.
  ///
  /// In en, this message translates to:
  /// **'Real-time data from our creator network'**
  String get realTimeDataFromNetwork;

  /// No description provided for @tiktokCreators.
  ///
  /// In en, this message translates to:
  /// **'TikTok Creators'**
  String get tiktokCreators;

  /// No description provided for @favoritedCreators.
  ///
  /// In en, this message translates to:
  /// **'Favorited Creators'**
  String get favoritedCreators;

  /// No description provided for @detailedStatistics.
  ///
  /// In en, this message translates to:
  /// **'Detailed Statistics'**
  String get detailedStatistics;

  /// No description provided for @totalTikTokCreators.
  ///
  /// In en, this message translates to:
  /// **'Total TikTok Creators'**
  String get totalTikTokCreators;

  /// No description provided for @favoritedLiveCreators.
  ///
  /// In en, this message translates to:
  /// **'Favorited LIVE Creators'**
  String get favoritedLiveCreators;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// No description provided for @joinDiscordCommunity.
  ///
  /// In en, this message translates to:
  /// **'Join the Discord Community'**
  String get joinDiscordCommunity;

  /// No description provided for @connectWithOtherCreators.
  ///
  /// In en, this message translates to:
  /// **'Connect with other creators'**
  String get connectWithOtherCreators;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @adTracking.
  ///
  /// In en, this message translates to:
  /// **'Ad Tracking'**
  String get adTracking;

  /// No description provided for @adTrackingDescription.
  ///
  /// In en, this message translates to:
  /// **'Allow personalized ads based on your activity'**
  String get adTrackingDescription;

  /// No description provided for @adTrackingEnabled.
  ///
  /// In en, this message translates to:
  /// **'Ad Tracking Enabled'**
  String get adTrackingEnabled;

  /// No description provided for @adTrackingDisabled.
  ///
  /// In en, this message translates to:
  /// **'Ad Tracking Disabled'**
  String get adTrackingDisabled;

  /// No description provided for @systemLanguage.
  ///
  /// In en, this message translates to:
  /// **'System Language'**
  String get systemLanguage;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Contact Email'**
  String get contactEmail;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address:'**
  String get emailAddress;

  /// No description provided for @pleaseUseEmailClient.
  ///
  /// In en, this message translates to:
  /// **'Please use your email client to contact us.'**
  String get pleaseUseEmailClient;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @aboutInfinitum.
  ///
  /// In en, this message translates to:
  /// **'About Infinitum'**
  String get aboutInfinitum;

  /// No description provided for @yourPremierDestination.
  ///
  /// In en, this message translates to:
  /// **'Your Premier Destination for LIVE Talent'**
  String get yourPremierDestination;

  /// No description provided for @aboutInfinitumDescription.
  ///
  /// In en, this message translates to:
  /// **'At Infinitum Imagery LLC we were officially founded on March 15, 2023 by {founderHandle}, inspired by our founder\'s sincere commitment to uplift creators after witnessing the limited support offered by a previous agency from May 2022 to March 2023.'**
  String aboutInfinitumDescription(String founderHandle);

  /// No description provided for @aboutInfinitumDescription2.
  ///
  /// In en, this message translates to:
  /// **'Since our earliest beginnings in 2023, we have proudly built a strong reputation for identifying and nurturing top-tier talent, forging meaningful connections with essential industry partners. Our mission is to empower every aspiring star by equipping them with robust tools, targeted resources, and caring, personalized guidance—ensuring that each individual is fully supported in reaching their highest potential.'**
  String get aboutInfinitumDescription2;

  /// No description provided for @aboutInfinitumDescription3.
  ///
  /// In en, this message translates to:
  /// **'We partner with leading platforms such as {platforms}, continually expanding our network to maximize opportunities for our creators.'**
  String aboutInfinitumDescription3(String platforms);

  /// No description provided for @aboutInfinitumDescription4.
  ///
  /// In en, this message translates to:
  /// **'Proudly founded, operated, and thriving in the heart of the United States! Based in {location}.'**
  String aboutInfinitumDescription4(String location);

  /// No description provided for @benefits.
  ///
  /// In en, this message translates to:
  /// **'Benefits'**
  String get benefits;

  /// No description provided for @whatWeDo.
  ///
  /// In en, this message translates to:
  /// **'What We Do'**
  String get whatWeDo;

  /// No description provided for @whatWeDoDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn about our services and benefits across all platforms'**
  String get whatWeDoDescription;

  /// No description provided for @whatIsYourRole.
  ///
  /// In en, this message translates to:
  /// **'What Is Your Role'**
  String get whatIsYourRole;

  /// No description provided for @whatIsYourRoleDescription.
  ///
  /// In en, this message translates to:
  /// **'Understand your responsibilities and expectations as a creator'**
  String get whatIsYourRoleDescription;

  /// No description provided for @whatWeDoNotDo.
  ///
  /// In en, this message translates to:
  /// **'What We DO NOT Do'**
  String get whatWeDoNotDo;

  /// No description provided for @whatWeDoNotDoDescription.
  ///
  /// In en, this message translates to:
  /// **'Clear transparency about what we don\'t provide'**
  String get whatWeDoNotDoDescription;

  /// No description provided for @talentAgreement.
  ///
  /// In en, this message translates to:
  /// **'Talent Agreement'**
  String get talentAgreement;

  /// No description provided for @talentAgreementDescription.
  ///
  /// In en, this message translates to:
  /// **'Review the terms and agreements for TikTok LIVE membership'**
  String get talentAgreementDescription;

  /// No description provided for @requirements.
  ///
  /// In en, this message translates to:
  /// **'Requirements'**
  String get requirements;

  /// No description provided for @requirementsDescription.
  ///
  /// In en, this message translates to:
  /// **'View requirements for joining different Infinitum programs'**
  String get requirementsDescription;

  /// No description provided for @payExplained.
  ///
  /// In en, this message translates to:
  /// **'Pay Explained'**
  String get payExplained;

  /// No description provided for @payExplainedDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn how TikTok LIVE Creator Network pay model works'**
  String get payExplainedDescription;

  /// No description provided for @serviceRegions.
  ///
  /// In en, this message translates to:
  /// **'Service Regions'**
  String get serviceRegions;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @supportEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Support Email'**
  String get supportEmailLabel;

  /// No description provided for @officialAccountLabel.
  ///
  /// In en, this message translates to:
  /// **'Official Account'**
  String get officialAccountLabel;

  /// No description provided for @businessHoursLabel.
  ///
  /// In en, this message translates to:
  /// **'Business Hours'**
  String get businessHoursLabel;

  /// No description provided for @legalPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Legal & Privacy'**
  String get legalPrivacy;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @cookiePolicy.
  ///
  /// In en, this message translates to:
  /// **'Cookie Policy'**
  String get cookiePolicy;

  /// No description provided for @thirdPartyAcknowledgments.
  ///
  /// In en, this message translates to:
  /// **'Third-Party Acknowledgments'**
  String get thirdPartyAcknowledgments;

  /// No description provided for @tiktokPartnership.
  ///
  /// In en, this message translates to:
  /// **'TikTok Partnership'**
  String get tiktokPartnership;

  /// No description provided for @tiktokPartnershipDescription.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE Creator Network is an official third-party partner with TikTok. Infinitum Imagery LLC has been granted permission by TikTok to use the TikTok name and branding in its applications and products. This partnership is established to better serve and train creators within the TikTok creator ecosystem.'**
  String get tiktokPartnershipDescription;

  /// No description provided for @tiktokTrademark.
  ///
  /// In en, this message translates to:
  /// **'TikTok is a trademark of TikTok Inc. and/or its affiliates. The use of the TikTok name and branding in this application is done with explicit permission as an official third-party partner.'**
  String get tiktokTrademark;

  /// No description provided for @appInformation.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInformation;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @themeModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeModeLabel;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @founded.
  ///
  /// In en, this message translates to:
  /// **'Founded'**
  String get founded;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply Now'**
  String get applyNow;

  /// No description provided for @tiktokTopAgencyChoice.
  ///
  /// In en, this message translates to:
  /// **'TikTok\'s #1 Top Agency Choice'**
  String get tiktokTopAgencyChoice;

  /// No description provided for @whyChooseInfinitum.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Infinitum?'**
  String get whyChooseInfinitum;

  /// No description provided for @whyChooseInfinitumDescription.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE Creator Network (Infinitum_US) stands out as one of, if not the best TikTok LIVE agencies in the United States, Canada, United Kingdom, Australia and New Zealand, combining official TikTok partnership status with a free, creator-first model. Infinitum has quickly grown into a leading TikTok LIVE Creator Network by offering:'**
  String get whyChooseInfinitumDescription;

  /// No description provided for @noFeesOrCommissions.
  ///
  /// In en, this message translates to:
  /// **'No Fees or Commissions'**
  String get noFeesOrCommissions;

  /// No description provided for @noFeesOrCommissionsDescription.
  ///
  /// In en, this message translates to:
  /// **'Creators keep 100% of their earnings.'**
  String get noFeesOrCommissionsDescription;

  /// No description provided for @comprehensiveSupport.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive Support'**
  String get comprehensiveSupport;

  /// No description provided for @comprehensiveSupportDescription.
  ///
  /// In en, this message translates to:
  /// **'Ban appeals, account recovery, and stream key access.'**
  String get comprehensiveSupportDescription;

  /// No description provided for @exclusiveAnalyticsTools.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Analytics & Tools'**
  String get exclusiveAnalyticsTools;

  /// No description provided for @exclusiveAnalyticsToolsDescription.
  ///
  /// In en, this message translates to:
  /// **'InfiniVIEW helps creators track diamonds, bonuses, and performance.'**
  String get exclusiveAnalyticsToolsDescription;

  /// No description provided for @personalCoachingTraining.
  ///
  /// In en, this message translates to:
  /// **'Personal Coaching & Training'**
  String get personalCoachingTraining;

  /// No description provided for @personalCoachingTrainingDescription.
  ///
  /// In en, this message translates to:
  /// **'Led by real creators who understand TikTok LIVE growth.'**
  String get personalCoachingTrainingDescription;

  /// No description provided for @communityEvents.
  ///
  /// In en, this message translates to:
  /// **'Community & Events'**
  String get communityEvents;

  /// No description provided for @communityEventsDescription.
  ///
  /// In en, this message translates to:
  /// **'Tournaments, incentive programs, and TikTok HQ opportunities.'**
  String get communityEventsDescription;

  /// No description provided for @infinitumEcosystem.
  ///
  /// In en, this message translates to:
  /// **'This makes Infinitum not just a TikTok agency, but a full ecosystem for creator success.'**
  String get infinitumEcosystem;

  /// No description provided for @howInfinitumCompares.
  ///
  /// In en, this message translates to:
  /// **'How Infinitum Compares'**
  String get howInfinitumCompares;

  /// No description provided for @howInfinitumComparesDescription.
  ///
  /// In en, this message translates to:
  /// **'While other agencies are also respected in the U.S., Infinitum consistently ranks high because of its transparent, free, and creator-led approach.'**
  String get howInfinitumComparesDescription;

  /// No description provided for @comparedToOthers.
  ///
  /// In en, this message translates to:
  /// **'Compared to others, Infinitum leads with:'**
  String get comparedToOthers;

  /// No description provided for @accessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility - any creator can apply and join free'**
  String get accessibility;

  /// No description provided for @directTikTokIntegration.
  ///
  /// In en, this message translates to:
  /// **'Direct TikTok integration'**
  String get directTikTokIntegration;

  /// No description provided for @communityMentorship.
  ///
  /// In en, this message translates to:
  /// **'Community built on mentorship and mental health advocacy'**
  String get communityMentorship;

  /// No description provided for @whyInfinitumDominates.
  ///
  /// In en, this message translates to:
  /// **'Why Infinitum Dominates'**
  String get whyInfinitumDominates;

  /// No description provided for @whyInfinitumDominatesDescription.
  ///
  /// In en, this message translates to:
  /// **'When searching for TikTok LIVE Agency USA or best TikTok creator network, Infinitum consistently appears because of:'**
  String get whyInfinitumDominatesDescription;

  /// No description provided for @rapidGrowth.
  ///
  /// In en, this message translates to:
  /// **'Rapid growth story (from 0 to nearly 2,000 creators within its first year)'**
  String get rapidGrowth;

  /// No description provided for @positiveTestimonials.
  ///
  /// In en, this message translates to:
  /// **'Positive creator testimonials on TikTok and Reddit'**
  String get positiveTestimonials;

  /// No description provided for @uniquePositioning.
  ///
  /// In en, this message translates to:
  /// **'Unique positioning as \"run by creators, for creators\"'**
  String get uniquePositioning;

  /// No description provided for @strongBrandIdentity.
  ///
  /// In en, this message translates to:
  /// **'Strong brand identity built around the Infinitum_US name, ♾️ infinity symbol, and focus on \"infinite potential\"'**
  String get strongBrandIdentity;

  /// No description provided for @readyToJoin.
  ///
  /// In en, this message translates to:
  /// **'Ready to join the #1 TikTok LIVE Creator Network?'**
  String get readyToJoin;

  /// No description provided for @clickApplyNow.
  ///
  /// In en, this message translates to:
  /// **'Click \"Apply Now\" to get started with your creator journey.'**
  String get clickApplyNow;

  /// No description provided for @couldNotOpenApplicationLink.
  ///
  /// In en, this message translates to:
  /// **'Could not open application link'**
  String get couldNotOpenApplicationLink;

  /// No description provided for @topperformingCreatorsOnly.
  ///
  /// In en, this message translates to:
  /// **'(Top-performing creators only)'**
  String get topperformingCreatorsOnly;

  /// No description provided for @str90dayCompletionRequirement.
  ///
  /// In en, this message translates to:
  /// **'90-Day Completion Requirement:'**
  String get str90dayCompletionRequirement;

  /// No description provided for @a60dayCooldownPeriodWillApplyBeforeTheCreatorIsEli.
  ///
  /// In en, this message translates to:
  /// **'A 60-day cooldown period will apply before the creator is eligible to join another agency network.'**
  String get a60dayCooldownPeriodWillApplyBeforeTheCreatorIsEli;

  /// No description provided for @aTiktokLiveCreatorNetworkAgencyIsAnOfficialPartner.
  ///
  /// In en, this message translates to:
  /// **'A TikTok LIVE Creator Network (agency) is an official partner program that helps creators grow, access exclusive TikTok campaigns, and get support with account issues, events, and bonuses.'**
  String get aTiktokLiveCreatorNetworkAgencyIsAnOfficialPartner;

  /// No description provided for @apiReturnedAListConvertingToMapFormat.
  ///
  /// In en, this message translates to:
  /// **'API returned a List, converting to Map format'**
  String get apiReturnedAListConvertingToMapFormat;

  /// No description provided for @abideByRulesAlwaysFollowBigoLive.
  ///
  /// In en, this message translates to:
  /// **'Abide by Rules: Always follow Bigo LIVE\\'**
  String get abideByRulesAlwaysFollowBigoLive;

  /// No description provided for @ableToGoLiveForAtLeast1DayAMonth.
  ///
  /// In en, this message translates to:
  /// **'Able to go LIVE for at least 1 day a month'**
  String get ableToGoLiveForAtLeast1DayAMonth;

  /// No description provided for @ableToGoLiveForAtLeast12ValidDaysAnd25HoursPerMont.
  ///
  /// In en, this message translates to:
  /// **'Able to go LIVE for at least 12 valid days and 25 hours per month'**
  String get ableToGoLiveForAtLeast12ValidDaysAnd25HoursPerMont;

  /// No description provided for @about1.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about1;

  /// No description provided for @aboutInfinitum1.
  ///
  /// In en, this message translates to:
  /// **'About Infinitum'**
  String get aboutInfinitum1;

  /// No description provided for @aboutscreen.
  ///
  /// In en, this message translates to:
  /// **'AboutScreen'**
  String get aboutscreen;

  /// No description provided for @accessibilityAnyCreatorCanApplyAndJoinFree.
  ///
  /// In en, this message translates to:
  /// **'Accessibility - any creator can apply and join free'**
  String get accessibilityAnyCreatorCanApplyAndJoinFree;

  /// No description provided for @accessibilityOpenToCreatorsAtAllLevelsFromRookiesT.
  ///
  /// In en, this message translates to:
  /// **'Accessibility – open to creators at all levels, from rookies to top performers.'**
  String get accessibilityOpenToCreatorsAtAllLevelsFromRookiesT;

  /// No description provided for @accountOwnershipManagement.
  ///
  /// In en, this message translates to:
  /// **'Account Ownership & Management'**
  String get accountOwnershipManagement;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings:'**
  String get accountSettings;

  /// No description provided for @accountSupport.
  ///
  /// In en, this message translates to:
  /// **'Account Support:'**
  String get accountSupport;

  /// No description provided for @accountabilityCommunication.
  ///
  /// In en, this message translates to:
  /// **'Accountability & Communication'**
  String get accountabilityCommunication;

  /// No description provided for @achieveMonthlySalesGoals.
  ///
  /// In en, this message translates to:
  /// **'Achieve Monthly Sales Goals'**
  String get achieveMonthlySalesGoals;

  /// No description provided for @admobInitializedSuccessfullyWithAppIdAppid.
  ///
  /// In en, this message translates to:
  /// **'AdMob initialized successfully with app ID: \$appId'**
  String get admobInitializedSuccessfullyWithAppIdAppid;

  /// No description provided for @adhereToPoliciesAlwaysComplyWithTiktokShopTermsToA.
  ///
  /// In en, this message translates to:
  /// **'Adhere to Policies: Always comply with TikTok Shop terms to avoid penalties or suspensions.'**
  String get adhereToPoliciesAlwaysComplyWithTiktokShopTermsToA;

  /// No description provided for @affiliation.
  ///
  /// In en, this message translates to:
  /// **'Affiliation:'**
  String get affiliation;

  /// No description provided for @after15Days.
  ///
  /// In en, this message translates to:
  /// **'After 15 Days:'**
  String get after15Days;

  /// No description provided for @afterTiktokPaysTheCreatorTheirPortionTheCreatorNet.
  ///
  /// In en, this message translates to:
  /// **'After TikTok pays the creator their portion, the creator network receives a separate payout from TikTok based on TikTok\\'**
  String get afterTiktokPaysTheCreatorTheirPortionTheCreatorNet;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age:'**
  String get age;

  /// No description provided for @agencyRemovalRights.
  ///
  /// In en, this message translates to:
  /// **'Agency Removal Rights:'**
  String get agencyRemovalRights;

  /// No description provided for @agencyonlyPromotionsExclusiveBonusCampaigns.
  ///
  /// In en, this message translates to:
  /// **'Agency-Only Promotions – Exclusive bonus campaigns.'**
  String get agencyonlyPromotionsExclusiveBonusCampaigns;

  /// No description provided for @allInfinitumprovidedInformationResourcesMaterialsA.
  ///
  /// In en, this message translates to:
  /// **'All Infinitum-provided information, resources, materials, and internal communications are confidential.'**
  String get allInfinitumprovidedInformationResourcesMaterialsA;

  /// No description provided for @allCreatorCompensationComesExclusivelyFromTiktokLi.
  ///
  /// In en, this message translates to:
  /// **'All creator compensation comes exclusively from TikTok LIVE gifts, governed by TikTok\\'**
  String get allCreatorCompensationComesExclusivelyFromTiktokLi;

  /// No description provided for @allEarningsAreReceivedDirectlyThroughTiktokLiveGif.
  ///
  /// In en, this message translates to:
  /// **'All earnings are received directly through TikTok LIVE gifts.'**
  String get allEarningsAreReceivedDirectlyThroughTiktokLiveGif;

  /// No description provided for @allServicesInitializedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'All services initialized successfully'**
  String get allServicesInitializedSuccessfully;

  /// No description provided for @alreadyHaveAccessToTiktokShopOrManager.
  ///
  /// In en, this message translates to:
  /// **'Already have access to TikTok Shop or manager'**
  String get alreadyHaveAccessToTiktokShopOrManager;

  /// No description provided for @anErrorOccurred1.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get anErrorOccurred1;

  /// No description provided for @anErrorOccurredWhileLoadingThePage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading the page.'**
  String get anErrorOccurredWhileLoadingThePage;

  /// No description provided for @announcedThroughOfficialInfinitumChannelsDiscordEm.
  ///
  /// In en, this message translates to:
  /// **'Announced through official Infinitum channels (Discord, Email).'**
  String get announcedThroughOfficialInfinitumChannelsDiscordEm;

  /// No description provided for @announcements1.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announcements1;

  /// No description provided for @announcementsPreloadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Announcements preloaded successfully'**
  String get announcementsPreloadedSuccessfully;

  /// No description provided for @announcementsscreen.
  ///
  /// In en, this message translates to:
  /// **'AnnouncementsScreen'**
  String get announcementsscreen;

  /// No description provided for @anyAgreementsRegardingExpensesOrDistributionOfProc.
  ///
  /// In en, this message translates to:
  /// **'Any agreements regarding expenses or distribution of proceeds between the creator and Infinitum must be handled outside of TikTok.'**
  String get anyAgreementsRegardingExpensesOrDistributionOfProc;

  /// No description provided for @anyUseOfThreatsDefamatoryStatementsOrHostileBehavi.
  ///
  /// In en, this message translates to:
  /// **'Any use of threats, defamatory statements, or hostile behavior to force early release is considered a violation of this agreement and will not accelerate removal.'**
  String get anyUseOfThreatsDefamatoryStatementsOrHostileBehavi;

  /// No description provided for @apiservice.
  ///
  /// In en, this message translates to:
  /// **'ApiService'**
  String get apiservice;

  /// No description provided for @appInformation1.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInformation1;

  /// No description provided for @applyNow1.
  ///
  /// In en, this message translates to:
  /// **'Apply Now'**
  String get applyNow1;

  /// No description provided for @applyscreen.
  ///
  /// In en, this message translates to:
  /// **'ApplyScreen'**
  String get applyscreen;

  /// No description provided for @approximateRange.
  ///
  /// In en, this message translates to:
  /// **'Approximate Range:'**
  String get approximateRange;

  /// No description provided for @askForSupportManagersAndTheInfinitumTeamAreAvailab.
  ///
  /// In en, this message translates to:
  /// **'Ask for Support: Managers and the Infinitum team are available to assist with technical issues, LIVE strategies, or platform-related challenges.'**
  String get askForSupportManagersAndTheInfinitumTeamAreAvailab;

  /// No description provided for @atInfinitumLiveCreatorsUnlock.
  ///
  /// In en, this message translates to:
  /// **'At Infinitum LIVE, creators unlock:'**
  String get atInfinitumLiveCreatorsUnlock;

  /// No description provided for @atInfinitumLiveWeBelieveInTransparencyAndHonestyTo.
  ///
  /// In en, this message translates to:
  /// **'At Infinitum LIVE, we believe in transparency and honesty. Too often, false claims and misinformation spread about what a Creator Network does. To set the record straight, here is exactly what we do not do across TikTok LIVE, TikTok Shop, Favorited, and Bigo.'**
  String get atInfinitumLiveWeBelieveInTransparencyAndHonestyTo;

  /// No description provided for @atInfinitumLiveYourSuccessIsOurSuccess.
  ///
  /// In en, this message translates to:
  /// **'At Infinitum LIVE, your success is our success. 🚀'**
  String get atInfinitumLiveYourSuccessIsOurSuccess;

  /// No description provided for @atInfinitumWhetherYou.
  ///
  /// In en, this message translates to:
  /// **'At Infinitum, whether you\\'**
  String get atInfinitumWhetherYou;

  /// No description provided for @attemptsByOtherAgenciesManagersOrThirdPartiesToRec.
  ///
  /// In en, this message translates to:
  /// **'Attempts by other agencies, managers, or third parties to recruit our creators during their agreement will not change the terms of withdrawal or cooldown.'**
  String get attemptsByOtherAgenciesManagersOrThirdPartiesToRec;

  /// No description provided for @australia.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get australia;

  /// No description provided for @auto1.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto1;

  /// No description provided for @banAppealsAccountRecoveryAndStreamKeyAccess.
  ///
  /// In en, this message translates to:
  /// **'Ban appeals, account recovery, and stream key access.'**
  String get banAppealsAccountRecoveryAndStreamKeyAccess;

  /// No description provided for @bannerAdClosed.
  ///
  /// In en, this message translates to:
  /// **'Banner ad closed'**
  String get bannerAdClosed;

  /// No description provided for @bannerAdFailedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Banner ad failed to load'**
  String get bannerAdFailedToLoad;

  /// No description provided for @bannerAdImpressionRecorded.
  ///
  /// In en, this message translates to:
  /// **'Banner ad impression recorded'**
  String get bannerAdImpressionRecorded;

  /// No description provided for @bannerAdLoadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Banner ad loaded successfully'**
  String get bannerAdLoadedSuccessfully;

  /// No description provided for @bannerAdOpened.
  ///
  /// In en, this message translates to:
  /// **'Banner ad opened'**
  String get bannerAdOpened;

  /// No description provided for @banneradwidget.
  ///
  /// In en, this message translates to:
  /// **'BannerAdWidget'**
  String get banneradwidget;

  /// No description provided for @bansViolationsReports.
  ///
  /// In en, this message translates to:
  /// **'Bans, Violations, & Reports'**
  String get bansViolationsReports;

  /// No description provided for @benefits1.
  ///
  /// In en, this message translates to:
  /// **'Benefits'**
  String get benefits1;

  /// No description provided for @beta.
  ///
  /// In en, this message translates to:
  /// **'Beta'**
  String get beta;

  /// No description provided for @bigo.
  ///
  /// In en, this message translates to:
  /// **'Bigo'**
  String get bigo;

  /// No description provided for @bigoAgencyRequirements.
  ///
  /// In en, this message translates to:
  /// **'Bigo Agency Requirements:'**
  String get bigoAgencyRequirements;

  /// No description provided for @bigoLive.
  ///
  /// In en, this message translates to:
  /// **'Bigo LIVE'**
  String get bigoLive;

  /// No description provided for @bigoLiveUsaOnly.
  ///
  /// In en, this message translates to:
  /// **'Bigo LIVE (USA Only)'**
  String get bigoLiveUsaOnly;

  /// No description provided for @bigoMerchandiseRewards.
  ///
  /// In en, this message translates to:
  /// **'Bigo Merchandise Rewards'**
  String get bigoMerchandiseRewards;

  /// No description provided for @blockedNavigationToUntrustedUrlNavigationurl.
  ///
  /// In en, this message translates to:
  /// **'Blocked navigation to untrusted URL: \$navigationUrl'**
  String get blockedNavigationToUntrustedUrlNavigationurl;

  /// No description provided for @brandPartnershipGuidancePrepForSponsorshipsAndPart.
  ///
  /// In en, this message translates to:
  /// **'Brand Partnership Guidance – Prep for sponsorships and partnerships.'**
  String get brandPartnershipGuidancePrepForSponsorshipsAndPart;

  /// No description provided for @brawlsCampaignsWeekly2v2BattleCampaigns.
  ///
  /// In en, this message translates to:
  /// **'Brawls Campaigns – Weekly 2v2 battle campaigns.'**
  String get brawlsCampaignsWeekly2v2BattleCampaigns;

  /// No description provided for @buildTheFamilyInviteOthersToJoinBigoLiveWithInfini.
  ///
  /// In en, this message translates to:
  /// **'Build the Family: Invite others to join Bigo LIVE with Infinitum and earn referral bonuses for successful recruits.'**
  String get buildTheFamilyInviteOthersToJoinBigoLiveWithInfini;

  /// No description provided for @businessHours.
  ///
  /// In en, this message translates to:
  /// **'Business Hours'**
  String get businessHours;

  /// No description provided for @byAcceptingThisInvitationCreatorsAgreeToTheNetwork.
  ///
  /// In en, this message translates to:
  /// **'By accepting this invitation, creators agree to the Network Relationship Rules, which may be updated periodically.'**
  String get byAcceptingThisInvitationCreatorsAgreeToTheNetwork;

  /// No description provided for @byAcceptingThisInvitationYouAcknowledgeAndAgreeToT.
  ///
  /// In en, this message translates to:
  /// **'By accepting this invitation, you acknowledge and agree to the terms above, which govern your participation in the Infinitum TikTok LIVE Creator Network. These terms are designed to ensure fairness, protect the stability of the network, and provide creators with a clear and consistent structure throughout their membership.'**
  String get byAcceptingThisInvitationYouAcknowledgeAndAgreeToT;

  /// No description provided for @cacheCleared.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared'**
  String get cacheCleared;

  /// No description provided for @cachedAnnouncementsExpired.
  ///
  /// In en, this message translates to:
  /// **'Cached announcements expired'**
  String get cachedAnnouncementsExpired;

  /// No description provided for @cachedStatsExpired.
  ///
  /// In en, this message translates to:
  /// **'Cached stats expired'**
  String get cachedStatsExpired;

  /// No description provided for @canNotAlreadyBeLinkedToATiktokSellerAccountOrAnoth.
  ///
  /// In en, this message translates to:
  /// **'Can not already be linked to a TikTok seller account or another TikTok Shop Agency'**
  String get canNotAlreadyBeLinkedToATiktokSellerAccountOrAnoth;

  /// No description provided for @canada.
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get canada;

  /// No description provided for @cannotLaunchUrlUrl.
  ///
  /// In en, this message translates to:
  /// **'Cannot launch URL: \$url'**
  String get cannotLaunchUrlUrl;

  /// No description provided for @cannotLaunchEmailEmail.
  ///
  /// In en, this message translates to:
  /// **'Cannot launch email: \$email'**
  String get cannotLaunchEmailEmail;

  /// No description provided for @cannotLaunchPhonePhonenumber.
  ///
  /// In en, this message translates to:
  /// **'Cannot launch phone: \$phoneNumber'**
  String get cannotLaunchPhonePhonenumber;

  /// No description provided for @cannotOpenThisUrl.
  ///
  /// In en, this message translates to:
  /// **'Cannot open this URL'**
  String get cannotOpenThisUrl;

  /// No description provided for @cannotReachServerPleaseCheckYourInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Cannot reach server. Please check your internet connection.'**
  String get cannotReachServerPleaseCheckYourInternetConnection;

  /// No description provided for @clapper.
  ///
  /// In en, this message translates to:
  /// **'Clapper'**
  String get clapper;

  /// No description provided for @clearTransparencyAboutWhatWeDon.
  ///
  /// In en, this message translates to:
  /// **'Clear transparency about what we don\\'**
  String get clearTransparencyAboutWhatWeDon;

  /// No description provided for @click.
  ///
  /// In en, this message translates to:
  /// **'Click'**
  String get click;

  /// No description provided for @close1.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close1;

  /// No description provided for @coachingGrowthStrategies.
  ///
  /// In en, this message translates to:
  /// **'Coaching & growth strategies'**
  String get coachingGrowthStrategies;

  /// No description provided for @commissionWithdrawalAssistance.
  ///
  /// In en, this message translates to:
  /// **'Commission Withdrawal Assistance'**
  String get commissionWithdrawalAssistance;

  /// No description provided for @commissionWithdrawalIssuesSupportForPayoutAndCommi.
  ///
  /// In en, this message translates to:
  /// **'Commission Withdrawal Issues – Support for payout and commission delays.'**
  String get commissionWithdrawalIssuesSupportForPayoutAndCommi;

  /// No description provided for @commitmentToGoingLiveRegularly.
  ///
  /// In en, this message translates to:
  /// **'Commitment to Going LIVE Regularly'**
  String get commitmentToGoingLiveRegularly;

  /// No description provided for @communicationSupport.
  ///
  /// In en, this message translates to:
  /// **'Communication & Support'**
  String get communicationSupport;

  /// No description provided for @communityEvents1.
  ///
  /// In en, this message translates to:
  /// **'Community & Events'**
  String get communityEvents1;

  /// No description provided for @communityEventsWeeklyTournamentsIncentiveProgramsE.
  ///
  /// In en, this message translates to:
  /// **'Community & events – weekly tournaments, incentive programs, exclusive competitions, and TikTok HQ opportunities.'**
  String get communityEventsWeeklyTournamentsIncentiveProgramsE;

  /// No description provided for @communityGrowthStrategies.
  ///
  /// In en, this message translates to:
  /// **'Community Growth Strategies'**
  String get communityGrowthStrategies;

  /// No description provided for @communityGrowthStrategiesBuildALoyalFanbase.
  ///
  /// In en, this message translates to:
  /// **'Community Growth Strategies: Build a loyal fanbase.'**
  String get communityGrowthStrategiesBuildALoyalFanbase;

  /// No description provided for @communityGrowthSupportForAudienceBuilding.
  ///
  /// In en, this message translates to:
  /// **'Community Growth Support for audience building.'**
  String get communityGrowthSupportForAudienceBuilding;

  /// No description provided for @communityBuiltOnMentorshipAndMentalHealthAdvocacy.
  ///
  /// In en, this message translates to:
  /// **'Community built on mentorship and mental health advocacy'**
  String get communityBuiltOnMentorshipAndMentalHealthAdvocacy;

  /// No description provided for @company1.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company1;

  /// No description provided for @comparedToOthersInfinitumLeadsWith.
  ///
  /// In en, this message translates to:
  /// **'Compared to others, Infinitum leads with:'**
  String get comparedToOthersInfinitumLeadsWith;

  /// No description provided for @compensation.
  ///
  /// In en, this message translates to:
  /// **'Compensation:'**
  String get compensation;

  /// No description provided for @completeEarningsFlowCompensationStructure.
  ///
  /// In en, this message translates to:
  /// **'Complete Earnings Flow & Compensation Structure'**
  String get completeEarningsFlowCompensationStructure;

  /// No description provided for @complianceEducation.
  ///
  /// In en, this message translates to:
  /// **'Compliance Education'**
  String get complianceEducation;

  /// No description provided for @complianceWithBigoStandards.
  ///
  /// In en, this message translates to:
  /// **'Compliance with Bigo Standards'**
  String get complianceWithBigoStandards;

  /// No description provided for @complianceWithTiktokShopRules.
  ///
  /// In en, this message translates to:
  /// **'Compliance with TikTok Shop Rules'**
  String get complianceWithTiktokShopRules;

  /// No description provided for @complianceWithTiktok.
  ///
  /// In en, this message translates to:
  /// **'Compliance with TikTok\\'**
  String get complianceWithTiktok;

  /// No description provided for @comprehensiveSupport1.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive Support'**
  String get comprehensiveSupport1;

  /// No description provided for @confidentialityObligation.
  ///
  /// In en, this message translates to:
  /// **'Confidentiality Obligation:'**
  String get confidentialityObligation;

  /// No description provided for @connectWithOtherCreators1.
  ///
  /// In en, this message translates to:
  /// **'Connect with other creators'**
  String get connectWithOtherCreators1;

  /// No description provided for @consistencyMattersMaintainRegularParticipationInTi.
  ///
  /// In en, this message translates to:
  /// **'Consistency Matters: Maintain regular participation in TikTok Shop activities such as product promotion, sales streams, and content uploads.'**
  String get consistencyMattersMaintainRegularParticipationInTi;

  /// No description provided for @contactEmail1.
  ///
  /// In en, this message translates to:
  /// **'Contact Email'**
  String get contactEmail1;

  /// No description provided for @contactInformation1.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation1;

  /// No description provided for @contentCalendarTemplatesPrebuiltSchedulesToStayOrg.
  ///
  /// In en, this message translates to:
  /// **'Content Calendar Templates – Pre-built schedules to stay organized and consistent.'**
  String get contentCalendarTemplatesPrebuiltSchedulesToStayOrg;

  /// No description provided for @contentRequirements.
  ///
  /// In en, this message translates to:
  /// **'Content Requirements:'**
  String get contentRequirements;

  /// No description provided for @contextIsRequiredForInappWebviewOnMobilePlatforms.
  ///
  /// In en, this message translates to:
  /// **'Context is required for in-app webview on mobile platforms'**
  String get contextIsRequiredForInappWebviewOnMobilePlatforms;

  /// No description provided for @cookiePolicy1.
  ///
  /// In en, this message translates to:
  /// **'Cookie Policy'**
  String get cookiePolicy1;

  /// No description provided for @copyrightStrikeGuidanceProtectContentAvoidMutedStr.
  ///
  /// In en, this message translates to:
  /// **'Copyright & Strike Guidance – Protect content, avoid muted streams, and file takedowns.'**
  String get copyrightStrikeGuidanceProtectContentAvoidMutedStr;

  /// No description provided for @costpricing.
  ///
  /// In en, this message translates to:
  /// **'Cost/Pricing'**
  String get costpricing;

  /// No description provided for @couldNotLaunchUrlUrl.
  ///
  /// In en, this message translates to:
  /// **'Could not launch URL: \$url'**
  String get couldNotLaunchUrlUrl;

  /// No description provided for @couldNotOpenApplicationLink1.
  ///
  /// In en, this message translates to:
  /// **'Could not open application link'**
  String get couldNotOpenApplicationLink1;

  /// No description provided for @couldNotOpenInExternalBrowser.
  ///
  /// In en, this message translates to:
  /// **'Could not open in external browser'**
  String get couldNotOpenInExternalBrowser;

  /// No description provided for @couponSetupAssistance.
  ///
  /// In en, this message translates to:
  /// **'Coupon Setup Assistance'**
  String get couponSetupAssistance;

  /// No description provided for @couponAndViewerIssues.
  ///
  /// In en, this message translates to:
  /// **'Coupon and Viewer Issues:'**
  String get couponAndViewerIssues;

  /// No description provided for @creator.
  ///
  /// In en, this message translates to:
  /// **'Creator'**
  String get creator;

  /// No description provided for @creatorBonusCampaignMonths.
  ///
  /// In en, this message translates to:
  /// **'Creator Bonus Campaign Months:'**
  String get creatorBonusCampaignMonths;

  /// No description provided for @creatorDashboard.
  ///
  /// In en, this message translates to:
  /// **'Creator Dashboard'**
  String get creatorDashboard;

  /// No description provided for @creatorEarningsFlow.
  ///
  /// In en, this message translates to:
  /// **'Creator Earnings Flow'**
  String get creatorEarningsFlow;

  /// No description provided for @creatorGoesLive.
  ///
  /// In en, this message translates to:
  /// **'Creator Goes LIVE'**
  String get creatorGoesLive;

  /// No description provided for @creatorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Creator Network'**
  String get creatorNetwork;

  /// No description provided for @creatorNetworkDoesNotTakeACut.
  ///
  /// In en, this message translates to:
  /// **'Creator Network Does NOT Take a Cut'**
  String get creatorNetworkDoesNotTakeACut;

  /// No description provided for @creatorNetworkDoesNotTakeACutOrAnywhereCreatorAlwa.
  ///
  /// In en, this message translates to:
  /// **'Creator Network Does not take a cut or % anywhere. Creator always keeps their up to 53% from TikTok, payouts are all handled by TikTok'**
  String get creatorNetworkDoesNotTakeACutOrAnywhereCreatorAlwa;

  /// No description provided for @creatorNetworkStatistics1.
  ///
  /// In en, this message translates to:
  /// **'Creator Network Statistics'**
  String get creatorNetworkStatistics1;

  /// No description provided for @creatorPayout.
  ///
  /// In en, this message translates to:
  /// **'Creator Payout'**
  String get creatorPayout;

  /// No description provided for @creatorPrecheck.
  ///
  /// In en, this message translates to:
  /// **'Creator Pre-Check'**
  String get creatorPrecheck;

  /// No description provided for @creatorPerformanceMetricsValidActivity.
  ///
  /// In en, this message translates to:
  /// **'Creator performance, metrics, valid activity'**
  String get creatorPerformanceMetricsValidActivity;

  /// No description provided for @creatorsAgreeNotToEngageInOrProvideCompetitiveServ.
  ///
  /// In en, this message translates to:
  /// **'Creators agree not to engage in or provide competitive services similar to Infinitum for a period of five (5) years following termination of this agreement.'**
  String get creatorsAgreeNotToEngageInOrProvideCompetitiveServ;

  /// No description provided for @creatorsAgreeNotToPublishOrCommunicateNegativeOrDe.
  ///
  /// In en, this message translates to:
  /// **'Creators agree not to publish or communicate negative or defamatory statements about Infinitum, its creators, or affiliates.'**
  String get creatorsAgreeNotToPublishOrCommunicateNegativeOrDe;

  /// No description provided for @creatorsAreExpectedToWaitOutTheFullWithdrawalPerio.
  ///
  /// In en, this message translates to:
  /// **'Creators are expected to wait out the full withdrawal period and cooldown as agreed.'**
  String get creatorsAreExpectedToWaitOutTheFullWithdrawalPerio;

  /// No description provided for @creatorsAreResponsibleForReportingAndPayingAnyAppl.
  ///
  /// In en, this message translates to:
  /// **'Creators are responsible for reporting and paying any applicable taxes.'**
  String get creatorsAreResponsibleForReportingAndPayingAnyAppl;

  /// No description provided for @creatorsEnrolledInTheDiamondIncentiveProgramDipAre.
  ///
  /// In en, this message translates to:
  /// **'Creators enrolled in the Diamond Incentive Program (D.I.P.) are subject to all program rules and performance standards.'**
  String get creatorsEnrolledInTheDiamondIncentiveProgramDipAre;

  /// No description provided for @creatorsKeep100OfTheirEarnings.
  ///
  /// In en, this message translates to:
  /// **'Creators keep 100% of their earnings.'**
  String get creatorsKeep100OfTheirEarnings;

  /// No description provided for @creatorsMayRequestRemovalAtAnyTimeDuringTheFirst15.
  ///
  /// In en, this message translates to:
  /// **'Creators may request removal at any time during the first 15 days of joining.'**
  String get creatorsMayRequestRemovalAtAnyTimeDuringTheFirst15;

  /// No description provided for @creatorsMustCompleteRequiredValidStreamingDaysAndH.
  ///
  /// In en, this message translates to:
  /// **'Creators must complete required valid streaming days and hours (e.g., 12 valid days, 25+ hours per month) and meet diamond thresholds.'**
  String get creatorsMustCompleteRequiredValidStreamingDaysAndH;

  /// No description provided for @creatorsMustMaintainQualityBroadcastsAvoidingStati.
  ///
  /// In en, this message translates to:
  /// **'Creators must maintain quality broadcasts, avoiding static camera images or non-interactive displays.'**
  String get creatorsMustMaintainQualityBroadcastsAvoidingStati;

  /// No description provided for @creatorsMustProvideScreenshotsOrRankingProofWhereR.
  ///
  /// In en, this message translates to:
  /// **'Creators must provide screenshots or ranking proof where required.'**
  String get creatorsMustProvideScreenshotsOrRankingProofWhereR;

  /// No description provided for @creatorsWhoHaveEarned200000DiamondsWithinThePastSi.
  ///
  /// In en, this message translates to:
  /// **'Creators who have earned 200,000+ Diamonds within the past six months are ineligible to transfer to another network under TikTok\\'**
  String get creatorsWhoHaveEarned200000DiamondsWithinThePastSi;

  /// No description provided for @crossplatformGrowthExpandAudiencesAcrossTiktokYout.
  ///
  /// In en, this message translates to:
  /// **'Cross-Platform Growth – Expand audiences across TikTok, YouTube, and Instagram.'**
  String get crossplatformGrowthExpandAudiencesAcrossTiktokYout;

  /// No description provided for @customReportsBenchmarkYourResultsAgainstRegionalAn.
  ///
  /// In en, this message translates to:
  /// **'Custom Reports – Benchmark your results against regional and national averages.'**
  String get customReportsBenchmarkYourResultsAgainstRegionalAn;

  /// No description provided for @debug.
  ///
  /// In en, this message translates to:
  /// **'DEBUG'**
  String get debug;

  /// No description provided for @dark1.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark1;

  /// No description provided for @detailedEarningsBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Detailed Earnings Breakdown'**
  String get detailedEarningsBreakdown;

  /// No description provided for @detailedStatistics1.
  ///
  /// In en, this message translates to:
  /// **'Detailed Statistics'**
  String get detailedStatistics1;

  /// No description provided for @deviceSetupRecommendationsAffordableGearLightsAndM.
  ///
  /// In en, this message translates to:
  /// **'Device & Setup Recommendations – Affordable gear, lights, and mics.'**
  String get deviceSetupRecommendationsAffordableGearLightsAndM;

  /// No description provided for @diamondDriveChallengesLargescaleCompetitionsWithTo.
  ///
  /// In en, this message translates to:
  /// **'Diamond Drive Challenges – Large-scale competitions with top-tier rewards.'**
  String get diamondDriveChallengesLargescaleCompetitionsWithTo;

  /// No description provided for @diamondIncentiveProgramDipEarnPayoutsForValidDaysD.
  ///
  /// In en, this message translates to:
  /// **'Diamond Incentive Program (D.I.P.) – Earn payouts for valid days, diamonds, and LIVE hours.'**
  String get diamondIncentiveProgramDipEarnPayoutsForValidDaysD;

  /// No description provided for @diamondThresholdRestriction.
  ///
  /// In en, this message translates to:
  /// **'Diamond Threshold Restriction:'**
  String get diamondThresholdRestriction;

  /// No description provided for @directHelpReachOutToInfinitumSupportForAssistanceW.
  ///
  /// In en, this message translates to:
  /// **'Direct Help: Reach out to Infinitum support for assistance with violations, login problems, or account concerns.'**
  String get directHelpReachOutToInfinitumSupportForAssistanceW;

  /// No description provided for @directTiktokIntegration.
  ///
  /// In en, this message translates to:
  /// **'Direct TikTok integration'**
  String get directTiktokIntegration;

  /// No description provided for @directTiktokIntegrationForFasterSupportAndOfficial.
  ///
  /// In en, this message translates to:
  /// **'Direct TikTok integration for faster support and official resources.'**
  String get directTiktokIntegrationForFasterSupportAndOfficial;

  /// No description provided for @discordCommunity.
  ///
  /// In en, this message translates to:
  /// **'Discord Community'**
  String get discordCommunity;

  /// No description provided for @discordConnectionUseDiscordToStayInContactWithYour.
  ///
  /// In en, this message translates to:
  /// **'Discord Connection: Use Discord to stay in contact with your assigned manager.'**
  String get discordConnectionUseDiscordToStayInContactWithYour;

  /// No description provided for @doesInfinitumTakeACutOfMyTiktokDiamonds.
  ///
  /// In en, this message translates to:
  /// **'Does Infinitum take a cut of my TikTok diamonds?'**
  String get doesInfinitumTakeACutOfMyTiktokDiamonds;

  /// No description provided for @doxxingProtectionSupportIfPersonalInformationIsLea.
  ///
  /// In en, this message translates to:
  /// **'Doxxing Protection – Support if personal information is leaked.'**
  String get doxxingProtectionSupportIfPersonalInformationIsLea;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration:'**
  String get duration;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'ERROR'**
  String get error;

  /// No description provided for @eachSectionBelowOutlinesYourExpectationsResponsibi.
  ///
  /// In en, this message translates to:
  /// **'Each section below outlines your expectations, responsibilities, and opportunities as a member of Infinitum LIVE. These standards ensure professionalism, compliance, and growth while also protecting your long-term success.'**
  String get eachSectionBelowOutlinesYourExpectationsResponsibi;

  /// No description provided for @earlyAccessSpecialBenefits.
  ///
  /// In en, this message translates to:
  /// **'Early Access & Special Benefits'**
  String get earlyAccessSpecialBenefits;

  /// No description provided for @earlyLiveAccessGoLiveEvenWithFewerThan1000Follower.
  ///
  /// In en, this message translates to:
  /// **'Early LIVE Access – Go LIVE even with fewer than 1,000 followers.'**
  String get earlyLiveAccessGoLiveEvenWithFewerThan1000Follower;

  /// No description provided for @earlyTiktokFeatureAccessTestNewPlatformFeaturesFir.
  ///
  /// In en, this message translates to:
  /// **'Early TikTok Feature Access – Test new platform features first.'**
  String get earlyTiktokFeatureAccessTestNewPlatformFeaturesFir;

  /// No description provided for @earnRewardsInviteNewCreatorsToInfinitumLiveAndRece.
  ///
  /// In en, this message translates to:
  /// **'Earn Rewards: Invite new creators to Infinitum LIVE and receive referral bonuses once they successfully join and meet requirements.'**
  String get earnRewardsInviteNewCreatorsToInfinitumLiveAndRece;

  /// No description provided for @earningsFromGiftsSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Earnings from Gifts & Subscriptions'**
  String get earningsFromGiftsSubscriptions;

  /// No description provided for @eligibilityRestrictionsHostsCannotJoinIfBannedUnde.
  ///
  /// In en, this message translates to:
  /// **'Eligibility Restrictions: Hosts cannot join if banned, underage, or already affiliated with another network.'**
  String get eligibilityRestrictionsHostsCannotJoinIfBannedUnde;

  /// No description provided for @eligibility.
  ///
  /// In en, this message translates to:
  /// **'Eligibility:'**
  String get eligibility;

  /// No description provided for @eliteHighFollowerCreatorEventInvitations.
  ///
  /// In en, this message translates to:
  /// **'Elite & High follower creator event invitations'**
  String get eliteHighFollowerCreatorEventInvitations;

  /// No description provided for @emailAddress1.
  ///
  /// In en, this message translates to:
  /// **'Email address:'**
  String get emailAddress1;

  /// No description provided for @encouragedConsistencyWhileBigoHasFlexibleActivityR.
  ///
  /// In en, this message translates to:
  /// **'Encouraged Consistency: While Bigo has flexible activity rules, consistent streaming significantly improves visibility and rewards.'**
  String get encouragedConsistencyWhileBigoHasFlexibleActivityR;

  /// No description provided for @endingARelationshipA30dayNoticePeriodAppliesAfterT.
  ///
  /// In en, this message translates to:
  /// **'Ending a Relationship: A 30-day notice period applies after the first 15 days of joining. Cooldown restrictions also apply.'**
  String get endingARelationshipA30dayNoticePeriodAppliesAfterT;

  /// No description provided for @engagementFocusTheMoreFrequentlyAndConsistentlyYou.
  ///
  /// In en, this message translates to:
  /// **'Engagement Focus: The more frequently and consistently you stream, the better your growth potential on the platform.'**
  String get engagementFocusTheMoreFrequentlyAndConsistentlyYou;

  /// No description provided for @errorComparingVersionsVersionVsOtherversion.
  ///
  /// In en, this message translates to:
  /// **'Error comparing versions: \$version vs \$otherVersion'**
  String get errorComparingVersionsVersionVsOtherversion;

  /// No description provided for @errorDisplayingBannerAd.
  ///
  /// In en, this message translates to:
  /// **'Error displaying banner ad'**
  String get errorDisplayingBannerAd;

  /// No description provided for @errorFetchingCreatorStatistics.
  ///
  /// In en, this message translates to:
  /// **'Error fetching creator statistics'**
  String get errorFetchingCreatorStatistics;

  /// No description provided for @errorLaunchingUrlUrl.
  ///
  /// In en, this message translates to:
  /// **'Error launching URL: \$url'**
  String get errorLaunchingUrlUrl;

  /// No description provided for @errorLaunchingEmailEmail.
  ///
  /// In en, this message translates to:
  /// **'Error launching email: \$email'**
  String get errorLaunchingEmailEmail;

  /// No description provided for @errorLaunchingPhonePhonenumber.
  ///
  /// In en, this message translates to:
  /// **'Error launching phone: \$phoneNumber'**
  String get errorLaunchingPhonePhonenumber;

  /// No description provided for @errorLoadingBannerAd.
  ///
  /// In en, this message translates to:
  /// **'Error loading banner ad'**
  String get errorLoadingBannerAd;

  /// No description provided for @errorOpeningUrlInExternalBrowserUrl.
  ///
  /// In en, this message translates to:
  /// **'Error opening URL in external browser: \$url'**
  String get errorOpeningUrlInExternalBrowserUrl;

  /// No description provided for @errorOpeningApplicationLink.
  ///
  /// In en, this message translates to:
  /// **'Error opening application link'**
  String get errorOpeningApplicationLink;

  /// No description provided for @errorOpeningInExternalBrowser.
  ///
  /// In en, this message translates to:
  /// **'Error opening in external browser'**
  String get errorOpeningInExternalBrowser;

  /// No description provided for @errorOpeningLink.
  ///
  /// In en, this message translates to:
  /// **'Error opening link'**
  String get errorOpeningLink;

  /// No description provided for @errorValidatingUrlUrl.
  ///
  /// In en, this message translates to:
  /// **'Error validating URL: \$url'**
  String get errorValidatingUrlUrl;

  /// No description provided for @established3152022.
  ///
  /// In en, this message translates to:
  /// **'Established: 3/15/2022'**
  String get established3152022;

  /// No description provided for @eventsReminders.
  ///
  /// In en, this message translates to:
  /// **'Events & Reminders'**
  String get eventsReminders;

  /// No description provided for @exceptionRequestsIfPersonalObligationsOrEmergencie.
  ///
  /// In en, this message translates to:
  /// **'Exception Requests: If personal obligations or emergencies affect your ability to participate, notify us for review.'**
  String get exceptionRequestsIfPersonalObligationsOrEmergencie;

  /// No description provided for @exceptionRequestsIfSeriousObligationsEgMilitaryDut.
  ///
  /// In en, this message translates to:
  /// **'Exception Requests: If serious obligations (e.g., military duty, work schedules, illness, family emergencies, natural disasters) prevent you from meeting requirements, submit a documented exception request. Each case will be reviewed individually.'**
  String get exceptionRequestsIfSeriousObligationsEgMilitaryDut;

  /// No description provided for @exceptions.
  ///
  /// In en, this message translates to:
  /// **'Exceptions:'**
  String get exceptions;

  /// No description provided for @exclusiveAnalyticsTools1.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Analytics & Tools'**
  String get exclusiveAnalyticsTools1;

  /// No description provided for @exclusiveEventInvitations.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Event Invitations'**
  String get exclusiveEventInvitations;

  /// No description provided for @exclusiveInfinitumAgencyTools.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Infinitum Agency Tools'**
  String get exclusiveInfinitumAgencyTools;

  /// No description provided for @exclusiveResourcesAndUpdates.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Resources and Updates'**
  String get exclusiveResourcesAndUpdates;

  /// No description provided for @exclusiveSupport.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Support'**
  String get exclusiveSupport;

  /// No description provided for @exclusiveSupportOnlineChatSupport8Am8PmEstMonfriPh.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Support – Online Chat Support (8 AM–8 PM EST, Mon–Fri: Phone, Text, Discord DMs, Email, WhatsApp).'**
  String get exclusiveSupportOnlineChatSupport8Am8PmEstMonfriPh;

  /// No description provided for @exclusiveSwagTiktokInfinitumMerchandiseRewards.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Swag – TikTok & Infinitum merchandise rewards.'**
  String get exclusiveSwagTiktokInfinitumMerchandiseRewards;

  /// No description provided for @exclusiveAnalyticsToolsInfiniviewDashboardToTrackD.
  ///
  /// In en, this message translates to:
  /// **'Exclusive analytics & tools – InfiniVIEW dashboard to track diamonds, bonuses, and LIVE performance in real time.'**
  String get exclusiveAnalyticsToolsInfiniviewDashboardToTrackD;

  /// No description provided for @exclusiveBonusesCampaignsAndRewards.
  ///
  /// In en, this message translates to:
  /// **'Exclusive bonuses, campaigns, and rewards'**
  String get exclusiveBonusesCampaignsAndRewards;

  /// No description provided for @exclusiveToolsAndTrackingApps.
  ///
  /// In en, this message translates to:
  /// **'Exclusive tools and tracking apps.'**
  String get exclusiveToolsAndTrackingApps;

  /// No description provided for @expandTheShopRecruitOtherSellersAndEarnReferralRew.
  ///
  /// In en, this message translates to:
  /// **'Expand the Shop: Recruit other sellers and earn referral rewards when they successfully join under Infinitum.'**
  String get expandTheShopRecruitOtherSellersAndEarnReferralRew;

  /// No description provided for @expectationsResponsibilitiesForFavoritedAgencyMemb.
  ///
  /// In en, this message translates to:
  /// **'Expectations & Responsibilities for Favorited Agency Members'**
  String get expectationsResponsibilitiesForFavoritedAgencyMemb;

  /// No description provided for @expectationsResponsibilitiesForInfinitumBigoLiveMe.
  ///
  /// In en, this message translates to:
  /// **'Expectations & Responsibilities for Infinitum Bigo LIVE Members'**
  String get expectationsResponsibilitiesForInfinitumBigoLiveMe;

  /// No description provided for @expectationsResponsibilitiesForInfinitumLiveCreato.
  ///
  /// In en, this message translates to:
  /// **'Expectations & Responsibilities for Infinitum LIVE Creator Network Members'**
  String get expectationsResponsibilitiesForInfinitumLiveCreato;

  /// No description provided for @expectationsResponsibilitiesForInfinitumTiktokShop.
  ///
  /// In en, this message translates to:
  /// **'Expectations & Responsibilities for Infinitum TikTok Shop Members'**
  String get expectationsResponsibilitiesForInfinitumTiktokShop;

  /// No description provided for @extractedUrlFromArrayExtractedurl.
  ///
  /// In en, this message translates to:
  /// **'Extracted URL from array: \$extractedUrl'**
  String get extractedUrlFromArrayExtractedurl;

  /// No description provided for @failedHostLookup.
  ///
  /// In en, this message translates to:
  /// **'Failed host lookup'**
  String get failedHostLookup;

  /// No description provided for @familiarWithAndCommittedToFollowingTiktokCommunity.
  ///
  /// In en, this message translates to:
  /// **'Familiar with and committed to following TikTok Community Guidelines'**
  String get familiarWithAndCommittedToFollowingTiktokCommunity;

  /// No description provided for @fastManagerSupport.
  ///
  /// In en, this message translates to:
  /// **'Fast Manager Support'**
  String get fastManagerSupport;

  /// No description provided for @fastAccountSafetySupport.
  ///
  /// In en, this message translates to:
  /// **'Fast account & safety support'**
  String get fastAccountSafetySupport;

  /// No description provided for @fastProblemResolution.
  ///
  /// In en, this message translates to:
  /// **'Fast problem resolution.'**
  String get fastProblemResolution;

  /// No description provided for @favorited.
  ///
  /// In en, this message translates to:
  /// **'Favorited'**
  String get favorited;

  /// No description provided for @favoritedUsaOnly.
  ///
  /// In en, this message translates to:
  /// **'Favorited (USA Only)'**
  String get favoritedUsaOnly;

  /// No description provided for @favoritedAgencyRequirements.
  ///
  /// In en, this message translates to:
  /// **'Favorited Agency Requirements:'**
  String get favoritedAgencyRequirements;

  /// No description provided for @favoritedCreators1.
  ///
  /// In en, this message translates to:
  /// **'Favorited Creators'**
  String get favoritedCreators1;

  /// No description provided for @favoritedLive.
  ///
  /// In en, this message translates to:
  /// **'Favorited LIVE'**
  String get favoritedLive;

  /// No description provided for @favoritedLiveUsaOnly.
  ///
  /// In en, this message translates to:
  /// **'Favorited LIVE (USA Only)'**
  String get favoritedLiveUsaOnly;

  /// No description provided for @favoritedLiveCreators1.
  ///
  /// In en, this message translates to:
  /// **'Favorited LIVE Creators'**
  String get favoritedLiveCreators1;

  /// No description provided for @favoritedMerchandiseRewards.
  ///
  /// In en, this message translates to:
  /// **'Favorited Merchandise Rewards'**
  String get favoritedMerchandiseRewards;

  /// No description provided for @featurePreviews.
  ///
  /// In en, this message translates to:
  /// **'Feature Previews'**
  String get featurePreviews;

  /// No description provided for @featurePreviewsBeFirstToTestFavoritedUpdates.
  ///
  /// In en, this message translates to:
  /// **'Feature Previews: Be first to test Favorited updates.'**
  String get featurePreviewsBeFirstToTestFavoritedUpdates;

  /// No description provided for @fetchingCreatorStatisticsFromApi.
  ///
  /// In en, this message translates to:
  /// **'Fetching creator statistics from API'**
  String get fetchingCreatorStatisticsFromApi;

  /// No description provided for @finalAcceptance.
  ///
  /// In en, this message translates to:
  /// **'Final Acceptance'**
  String get finalAcceptance;

  /// No description provided for @finalNote.
  ///
  /// In en, this message translates to:
  /// **'Final Note'**
  String get finalNote;

  /// No description provided for @first15Days.
  ///
  /// In en, this message translates to:
  /// **'First 15 Days:'**
  String get first15Days;

  /// No description provided for @flexibleFeeStructureChoose250OfEarningsBasedOnYour.
  ///
  /// In en, this message translates to:
  /// **'Flexible Fee Structure: Choose 2%–50% of earnings based on your preference.'**
  String get flexibleFeeStructureChoose250OfEarningsBasedOnYour;

  /// No description provided for @flexibleStreamingNoStrictRequirementsButConsistenc.
  ///
  /// In en, this message translates to:
  /// **'Flexible Streaming: No strict requirements, but consistency will increase your reach and income.'**
  String get flexibleStreamingNoStrictRequirementsButConsistenc;

  /// No description provided for @followTiktokCommunityGuidelines.
  ///
  /// In en, this message translates to:
  /// **'Follow TikTok Community Guidelines'**
  String get followTiktokCommunityGuidelines;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers:'**
  String get followers;

  /// No description provided for @followingTheInitial15DaysCreatorsMayRequestRemoval.
  ///
  /// In en, this message translates to:
  /// **'Following the initial 15 days, creators may request removal by providing a 30-day notice period.'**
  String get followingTheInitial15DaysCreatorsMayRequestRemoval;

  /// No description provided for @founded1.
  ///
  /// In en, this message translates to:
  /// **'Founded'**
  String get founded1;

  /// No description provided for @freeGiftsExclusiveCreatorRewardsThroughInfinitum.
  ///
  /// In en, this message translates to:
  /// **'Free Gifts – Exclusive creator rewards through Infinitum\\'**
  String get freeGiftsExclusiveCreatorRewardsThroughInfinitum;

  /// No description provided for @freeScheduledTournamentsCompeteForRecognitionAndBo.
  ///
  /// In en, this message translates to:
  /// **'Free Scheduled Tournaments – Compete for recognition and bonuses.'**
  String get freeScheduledTournamentsCompeteForRecognitionAndBo;

  /// No description provided for @fullCoachingAndStrategicSupport.
  ///
  /// In en, this message translates to:
  /// **'Full coaching and strategic support.'**
  String get fullCoachingAndStrategicSupport;

  /// No description provided for @fullSupportSystemBanAppealsAccountRecoveryAndOffic.
  ///
  /// In en, this message translates to:
  /// **'Full support system – ban appeals, account recovery, and official stream key access.'**
  String get fullSupportSystemBanAppealsAccountRecoveryAndOffic;

  /// No description provided for @gamePlanCreationPersonalizedContentRoadmapsWithFol.
  ///
  /// In en, this message translates to:
  /// **'Game Plan Creation – Personalized content roadmaps with follow-up check-ins.'**
  String get gamePlanCreationPersonalizedContentRoadmapsWithFol;

  /// No description provided for @getHelpManagersAreAvailableToProvideStrategiesForB.
  ///
  /// In en, this message translates to:
  /// **'Get Help: Managers are available to provide strategies for boosting sales when needed.'**
  String get getHelpManagersAreAvailableToProvideStrategiesForB;

  /// No description provided for @giftsProductsEngagement.
  ///
  /// In en, this message translates to:
  /// **'Gifts, Products, & Engagement'**
  String get giftsProductsEngagement;

  /// No description provided for @giftsProductsFollowers.
  ///
  /// In en, this message translates to:
  /// **'Gifts, Products, & Followers'**
  String get giftsProductsFollowers;

  /// No description provided for @giftsSubsDiamonds.
  ///
  /// In en, this message translates to:
  /// **'Gifts, subs, diamonds'**
  String get giftsSubsDiamonds;

  /// No description provided for @globalMatchesCompeteWorldwide.
  ///
  /// In en, this message translates to:
  /// **'Global Matches – Compete worldwide.'**
  String get globalMatchesCompeteWorldwide;

  /// No description provided for @goalTrackingPersonalizedMilestoneSettingWithProgre.
  ///
  /// In en, this message translates to:
  /// **'Goal Tracking – Personalized milestone setting with progress checkpoints.'**
  String get goalTrackingPersonalizedMilestoneSettingWithProgre;

  /// No description provided for @groupMeetingsRegularStrategySessionsWithManagersAn.
  ///
  /// In en, this message translates to:
  /// **'Group Meetings – Regular strategy sessions with managers and peers.'**
  String get groupMeetingsRegularStrategySessionsWithManagersAn;

  /// No description provided for @growTheTeamInviteFriendsOrNewCreatorsToFavoritedLi.
  ///
  /// In en, this message translates to:
  /// **'Grow the Team: Invite friends or new creators to Favorited LIVE and earn referral bonuses.'**
  String get growTheTeamInviteFriendsOrNewCreatorsToFavoritedLi;

  /// No description provided for @guidelineAdherence.
  ///
  /// In en, this message translates to:
  /// **'Guideline Adherence:'**
  String get guidelineAdherence;

  /// No description provided for @hackedAccountRecovery.
  ///
  /// In en, this message translates to:
  /// **'Hacked Account Recovery'**
  String get hackedAccountRecovery;

  /// No description provided for @hackedAccountRecoveryEscalationAndAssistanceIfYour.
  ///
  /// In en, this message translates to:
  /// **'Hacked Account Recovery – Escalation and assistance if your account is compromised.'**
  String get hackedAccountRecoveryEscalationAndAssistanceIfYour;

  /// No description provided for @hashtagSeoStrategyTrendingKeywordsCaptionsAndTikto.
  ///
  /// In en, this message translates to:
  /// **'Hashtag & SEO Strategy – Trending keywords, captions, and TikTok search optimization.'**
  String get hashtagSeoStrategyTrendingKeywordsCaptionsAndTikto;

  /// No description provided for @homescreen.
  ///
  /// In en, this message translates to:
  /// **'HomeScreen'**
  String get homescreen;

  /// No description provided for @howInfinitumCompares1.
  ///
  /// In en, this message translates to:
  /// **'How Infinitum Compares'**
  String get howInfinitumCompares1;

  /// No description provided for @howDoIJoinInfinitumLive.
  ///
  /// In en, this message translates to:
  /// **'How do I join Infinitum LIVE?'**
  String get howDoIJoinInfinitumLive;

  /// No description provided for @important1.
  ///
  /// In en, this message translates to:
  /// **'IMPORTANT'**
  String get important1;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'INFO'**
  String get info;

  /// No description provided for @importantClarifications.
  ///
  /// In en, this message translates to:
  /// **'Important Clarifications'**
  String get importantClarifications;

  /// No description provided for @infiniviewAndroidAppFullMobileSupportForAndroidDev.
  ///
  /// In en, this message translates to:
  /// **'InfiniVIEW Android App – Full mobile support for Android devices.'**
  String get infiniviewAndroidAppFullMobileSupportForAndroidDev;

  /// No description provided for @infiniviewAndroidAppDownloadForAndroid.
  ///
  /// In en, this message translates to:
  /// **'InfiniVIEW Android App: Download for Android'**
  String get infiniviewAndroidAppDownloadForAndroid;

  /// No description provided for @infiniviewHelpsCreatorsTrackDiamondsBonusesAndPerf.
  ///
  /// In en, this message translates to:
  /// **'InfiniVIEW helps creators track diamonds, bonuses, and performance.'**
  String get infiniviewHelpsCreatorsTrackDiamondsBonusesAndPerf;

  /// No description provided for @infiniviewIosAppManagePerformanceOnIphoneipad.
  ///
  /// In en, this message translates to:
  /// **'InfiniVIEW iOS App – Manage performance on iPhone/iPad.'**
  String get infiniviewIosAppManagePerformanceOnIphoneipad;

  /// No description provided for @infiniviewIosAppDownloadForIos.
  ///
  /// In en, this message translates to:
  /// **'InfiniVIEW iOS App: Download for iOS'**
  String get infiniviewIosAppDownloadForIos;

  /// No description provided for @infinitumImageryLlc.
  ///
  /// In en, this message translates to:
  /// **'Infinitum Imagery LLC'**
  String get infinitumImageryLlc;

  /// No description provided for @infinitumLive.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE'**
  String get infinitumLive;

  /// No description provided for @infinitumLiveCreatorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE Creator Network'**
  String get infinitumLiveCreatorNetwork;

  /// No description provided for @infinitumLiveCreatorNetworkInfinitumusIsRecognized.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE Creator Network (Infinitum_US) is recognized as one of, if not the best TikTok LIVE agencies worldwide, serving creators across the United States, Canada, United Kingdom, Australia, and New Zealand. As an official TikTok Creator Network partner, Infinitum combines authenticity, innovation, and a creator-first model that is 100% free to join.'**
  String get infinitumLiveCreatorNetworkInfinitumusIsRecognized;

  /// No description provided for @infinitumLiveCreatorNetworkInfinitumusStandsOutAsO.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE Creator Network (Infinitum_US) stands out as one of, if not the best TikTok LIVE agencies in the United States, Canada, United Kingdom, Australia and New Zealand, combining official TikTok partnership status with a free, creator-first model. Infinitum has quickly grown into a leading TikTok LIVE Creator Network by offering:'**
  String get infinitumLiveCreatorNetworkInfinitumusStandsOutAsO;

  /// No description provided for @infinitumLiveCreatorNetworkIsAnOfficialThirdpartyP.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE Creator Network is an official third-party partner with TikTok. Infinitum Imagery LLC has been granted permission by TikTok to use the TikTok name and branding in its applications and products. This partnership is established to better serve and train creators within the TikTok creator ecosystem.'**
  String get infinitumLiveCreatorNetworkIsAnOfficialThirdpartyP;

  /// No description provided for @infinitumLiveCreatorNetworkThe1TiktokLiveAgency.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE Creator Network – The #1 TikTok LIVE Agency'**
  String get infinitumLiveCreatorNetworkThe1TiktokLiveAgency;

  /// No description provided for @infinitumLiveIsATopTiktokLiveCreatorNetworkAndTikt.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE is a top TikTok LIVE Creator Network and TikTok agency helping creators across the USA, Canada, United Kingdom, Australia, and New Zealand.'**
  String get infinitumLiveIsATopTiktokLiveCreatorNetworkAndTikt;

  /// No description provided for @infinitumLiveNeverTakesACutOfYourTiktokLiveDiamond.
  ///
  /// In en, this message translates to:
  /// **'Infinitum LIVE never takes a cut of your TikTok LIVE diamonds. 100% of your TikTok earnings stay with you.'**
  String get infinitumLiveNeverTakesACutOfYourTiktokLiveDiamond;

  /// No description provided for @infinitumTalentAgreementForTiktokLive.
  ///
  /// In en, this message translates to:
  /// **'Infinitum Talent Agreement – For TikTok LIVE'**
  String get infinitumTalentAgreementForTiktokLive;

  /// No description provided for @infinitumDoesNotIssueDirectPaymentsTiktokIsTheSole.
  ///
  /// In en, this message translates to:
  /// **'Infinitum does not issue direct payments; TikTok is the sole distributor of funds.'**
  String get infinitumDoesNotIssueDirectPaymentsTiktokIsTheSole;

  /// No description provided for @infinitumDoesNotProvideDirectPayments.
  ///
  /// In en, this message translates to:
  /// **'Infinitum does not provide direct payments.'**
  String get infinitumDoesNotProvideDirectPayments;

  /// No description provided for @infinitumDoesNotReleaseCreatorsEarlyUnderPressureO.
  ///
  /// In en, this message translates to:
  /// **'Infinitum does not release creators early under pressure or solicitation from outside parties.'**
  String get infinitumDoesNotReleaseCreatorsEarlyUnderPressureO;

  /// No description provided for @infinitumEncouragesRespectfulCommunicationAndRemai.
  ///
  /// In en, this message translates to:
  /// **'Infinitum encourages respectful communication and remains available to provide support during the transition process, but all removals must follow the agreed timeline.'**
  String get infinitumEncouragesRespectfulCommunicationAndRemai;

  /// No description provided for @infinitumHasQuicklyBecomeALeadingTiktokLiveCreator.
  ///
  /// In en, this message translates to:
  /// **'Infinitum has quickly become a leading TikTok LIVE Creator Network by offering unmatched benefits, including:'**
  String get infinitumHasQuicklyBecomeALeadingTiktokLiveCreator;

  /// No description provided for @infinitumIsNotObligatedToApproveAnEarlyReleaseBeyo.
  ///
  /// In en, this message translates to:
  /// **'Infinitum is not obligated to approve an early release beyond these agreed terms.'**
  String get infinitumIsNotObligatedToApproveAnEarlyReleaseBeyo;

  /// No description provided for @infinitumOffersMoreThanJustOnboardingWeProvideCoac.
  ///
  /// In en, this message translates to:
  /// **'Infinitum offers more than just onboarding — we provide coaching, analytics, wellness support, exclusive campaigns, and real community recognition to help creators grow long-term.'**
  String get infinitumOffersMoreThanJustOnboardingWeProvideCoac;

  /// No description provided for @infinitumReservesTheRightToRemoveACreatorAtAnyTime.
  ///
  /// In en, this message translates to:
  /// **'Infinitum reserves the right to remove a creator at any time, at its sole discretion. This may include blocking access to participation where necessary.'**
  String get infinitumReservesTheRightToRemoveACreatorAtAnyTime;

  /// No description provided for @infinitumConfidentialityNondisclosure.
  ///
  /// In en, this message translates to:
  /// **'Infinitum – Confidentiality & Non-Disclosure'**
  String get infinitumConfidentialityNondisclosure;

  /// No description provided for @infinitumInvitationTermsAndAgreements.
  ///
  /// In en, this message translates to:
  /// **'Infinitum – Invitation Terms and Agreements'**
  String get infinitumInvitationTermsAndAgreements;

  /// No description provided for @infinitumNoncompeteAgreement.
  ///
  /// In en, this message translates to:
  /// **'Infinitum – Non-Compete Agreement'**
  String get infinitumNoncompeteAgreement;

  /// No description provided for @infinitumTalentAgreementDipBonus.
  ///
  /// In en, this message translates to:
  /// **'Infinitum – Talent Agreement & D.I.P. Bonus'**
  String get infinitumTalentAgreementDipBonus;

  /// No description provided for @infinitum.
  ///
  /// In en, this message translates to:
  /// **'Infinitum\\'**
  String get infinitum;

  /// No description provided for @infinitumusInfinitumukInfinitumauUnitedStatesCanad.
  ///
  /// In en, this message translates to:
  /// **'Infinitum_US, Infinitum_UK, Infinitum_AU – United States, Canada, United Kingdom, Australia, New Zealand, LATAM, Philippines'**
  String get infinitumusInfinitumukInfinitumauUnitedStatesCanad;

  /// No description provided for @informationSharing.
  ///
  /// In en, this message translates to:
  /// **'Information Sharing:'**
  String get informationSharing;

  /// No description provided for @instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// No description provided for @integrityLoyalty.
  ///
  /// In en, this message translates to:
  /// **'Integrity & Loyalty'**
  String get integrityLoyalty;

  /// No description provided for @integrityProtection.
  ///
  /// In en, this message translates to:
  /// **'Integrity & Protection'**
  String get integrityProtection;

  /// No description provided for @interest.
  ///
  /// In en, this message translates to:
  /// **'Interest:'**
  String get interest;

  /// No description provided for @invalidUrlFormatArrayUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL format (array): \$url'**
  String get invalidUrlFormatArrayUrl;

  /// No description provided for @invalidUrlSchemeUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL scheme: \$url'**
  String get invalidUrlSchemeUrl;

  /// No description provided for @invitationTerm.
  ///
  /// In en, this message translates to:
  /// **'Invitation Term'**
  String get invitationTerm;

  /// No description provided for @invitationsToEliteEventsAndHqVisits.
  ///
  /// In en, this message translates to:
  /// **'Invitations to elite events and HQ visits.'**
  String get invitationsToEliteEventsAndHqVisits;

  /// No description provided for @jsonFormatErrorWhileFetchingAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'JSON format error while fetching announcements'**
  String get jsonFormatErrorWhileFetchingAnnouncements;

  /// No description provided for @joinTheDiscordCommunity.
  ///
  /// In en, this message translates to:
  /// **'Join the Discord Community'**
  String get joinTheDiscordCommunity;

  /// No description provided for @keyInformationFirstPriorityUpdatesOnTiktokNewsAndI.
  ///
  /// In en, this message translates to:
  /// **'Key Information First – Priority updates on TikTok news and Infinitum campaigns.'**
  String get keyInformationFirstPriorityUpdatesOnTiktokNewsAndI;

  /// No description provided for @keyPoint.
  ///
  /// In en, this message translates to:
  /// **'Key Point'**
  String get keyPoint;

  /// No description provided for @latam.
  ///
  /// In en, this message translates to:
  /// **'LATAM'**
  String get latam;

  /// No description provided for @liveAccessFlexibility.
  ///
  /// In en, this message translates to:
  /// **'LIVE Access Flexibility'**
  String get liveAccessFlexibility;

  /// No description provided for @liveActivity.
  ///
  /// In en, this message translates to:
  /// **'LIVE Activity'**
  String get liveActivity;

  /// No description provided for @liveMonitoringFeedbackWithRealtimeInsights.
  ///
  /// In en, this message translates to:
  /// **'LIVE Monitoring & Feedback with real-time insights.'**
  String get liveMonitoringFeedbackWithRealtimeInsights;

  /// No description provided for @liveStreamingCommitment.
  ///
  /// In en, this message translates to:
  /// **'LIVE Streaming Commitment:'**
  String get liveStreamingCommitment;

  /// No description provided for @liveAndVideoViolationHelp.
  ///
  /// In en, this message translates to:
  /// **'LIVE and Video Violation Help'**
  String get liveAndVideoViolationHelp;

  /// No description provided for @lastUpdated1.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated1;

  /// No description provided for @learnAboutOurServicesAndBenefitsAcrossAllPlatforms.
  ///
  /// In en, this message translates to:
  /// **'Learn about our services and benefits across all platforms'**
  String get learnAboutOurServicesAndBenefitsAcrossAllPlatforms;

  /// No description provided for @learnHowTiktokLiveCreatorNetworkPayModelWorks.
  ///
  /// In en, this message translates to:
  /// **'Learn how TikTok LIVE Creator Network pay model works'**
  String get learnHowTiktokLiveCreatorNetworkPayModelWorks;

  /// No description provided for @ledByRealCreatorsWhoUnderstandTiktokLiveGrowth.
  ///
  /// In en, this message translates to:
  /// **'Led by real creators who understand TikTok LIVE growth.'**
  String get ledByRealCreatorsWhoUnderstandTiktokLiveGrowth;

  /// No description provided for @legalPrivacy1.
  ///
  /// In en, this message translates to:
  /// **'Legal & Privacy'**
  String get legalPrivacy1;

  /// No description provided for @light1.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light1;

  /// No description provided for @loadingloadingprogress.
  ///
  /// In en, this message translates to:
  /// **'Loading... \$_loadingProgress%'**
  String get loadingloadingprogress;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location:'**
  String get location;

  /// No description provided for @loginAccessIssuesFastHelpWithTiktokAccountAccessPr.
  ///
  /// In en, this message translates to:
  /// **'Login & Access Issues – Fast help with TikTok account access problems.'**
  String get loginAccessIssuesFastHelpWithTiktokAccountAccessPr;

  /// No description provided for @loginHelp.
  ///
  /// In en, this message translates to:
  /// **'Login Help'**
  String get loginHelp;

  /// No description provided for @lowViewertrafficSupportStrategiesToGrowEngagementA.
  ///
  /// In en, this message translates to:
  /// **'Low Viewer/Traffic Support – Strategies to grow engagement and build consistent viewership.'**
  String get lowViewertrafficSupportStrategiesToGrowEngagementA;

  /// No description provided for @loyaltyIntegrity.
  ///
  /// In en, this message translates to:
  /// **'Loyalty & Integrity'**
  String get loyaltyIntegrity;

  /// No description provided for @loyaltyProtection.
  ///
  /// In en, this message translates to:
  /// **'Loyalty & Protection'**
  String get loyaltyProtection;

  /// No description provided for @mmmDYyyy.
  ///
  /// In en, this message translates to:
  /// **'MMM d, yyyy'**
  String get mmmDYyyy;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// No description provided for @managerDirectorCompensation.
  ///
  /// In en, this message translates to:
  /// **'Manager & Director Compensation'**
  String get managerDirectorCompensation;

  /// No description provided for @managerContactUseDiscordToConnectWithYourAssignedM.
  ///
  /// In en, this message translates to:
  /// **'Manager Contact: Use Discord to connect with your assigned manager quickly.'**
  String get managerContactUseDiscordToConnectWithYourAssignedM;

  /// No description provided for @managerGuidanceInfinitumManagersAreAvailableToSupp.
  ///
  /// In en, this message translates to:
  /// **'Manager Guidance: Infinitum managers are available to support you with Bigo-related issues, including violations, performance tips, or account concerns.'**
  String get managerGuidanceInfinitumManagersAreAvailableToSupp;

  /// No description provided for @managersDirectors.
  ///
  /// In en, this message translates to:
  /// **'Managers & Directors'**
  String get managersDirectors;

  /// No description provided for @managersDirectors1.
  ///
  /// In en, this message translates to:
  /// **'Managers / Directors'**
  String get managersDirectors1;

  /// No description provided for @managersAndDirectorsArePaidFromTheNetwork.
  ///
  /// In en, this message translates to:
  /// **'Managers and directors are paid from the network\\'**
  String get managersAndDirectorsArePaidFromTheNetwork;

  /// No description provided for @march152023.
  ///
  /// In en, this message translates to:
  /// **'March 15, 2023'**
  String get march152023;

  /// No description provided for @membershipIsValidForThree3YearsFromTheDateOfAccept.
  ///
  /// In en, this message translates to:
  /// **'Membership is valid for three (3) years from the date of acceptance.'**
  String get membershipIsValidForThree3YearsFromTheDateOfAccept;

  /// No description provided for @mentalHealthResourcesBurnoutPreventionAndWellnessG.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Resources – Burnout prevention and wellness guidance.'**
  String get mentalHealthResourcesBurnoutPreventionAndWellnessG;

  /// No description provided for @mentalHealthAdvocacyMentorshipASupportiveCommunity.
  ///
  /// In en, this message translates to:
  /// **'Mental health advocacy & mentorship – a supportive community that values creators beyond just numbers.'**
  String get mentalHealthAdvocacyMentorshipASupportiveCommunity;

  /// No description provided for @minimum12ValidDaysPerMonthYouMustStreamAtLeast12Se.
  ///
  /// In en, this message translates to:
  /// **'Minimum 12 Valid Days Per Month: You must stream at least 12 separate days each month.'**
  String get minimum12ValidDaysPerMonthYouMustStreamAtLeast12Se;

  /// No description provided for @minimum25HoursPerMonthYouMustCompleteAtLeast25Cumu.
  ///
  /// In en, this message translates to:
  /// **'Minimum 25 Hours Per Month: You must complete at least 25 cumulative streaming hours.'**
  String get minimum25HoursPerMonthYouMustCompleteAtLeast25Cumu;

  /// No description provided for @miscellaneous.
  ///
  /// In en, this message translates to:
  /// **'Miscellaneous'**
  String get miscellaneous;

  /// No description provided for @monthlyBonusesExtraMilestonebasedPayoutsRestrictio.
  ///
  /// In en, this message translates to:
  /// **'Monthly Bonuses – Extra milestone-based payouts (restrictions apply).'**
  String get monthlyBonusesExtraMilestonebasedPayoutsRestrictio;

  /// No description provided for @monthlyPerformanceReviewsAnalyzeDiamondsHoursAndEn.
  ///
  /// In en, this message translates to:
  /// **'Monthly Performance Reviews – Analyze diamonds, hours, and engagement growth.'**
  String get monthlyPerformanceReviewsAnalyzeDiamondsHoursAndEn;

  /// No description provided for @mustBeBasedInTheUsOrCanada.
  ///
  /// In en, this message translates to:
  /// **'Must be based in the US or Canada'**
  String get mustBeBasedInTheUsOrCanada;

  /// No description provided for @mustBeBasedInTheUnitedStatesOfAmericaCanadaUnitedK.
  ///
  /// In en, this message translates to:
  /// **'Must be based in the United States Of America, Canada, United Kingdom or Australia'**
  String get mustBeBasedInTheUnitedStatesOfAmericaCanadaUnitedK;

  /// No description provided for @mustHaveAHighqualityProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Must have a high-quality profile picture'**
  String get mustHaveAHighqualityProfilePicture;

  /// No description provided for @mustHaveAMinimumOf0Followers.
  ///
  /// In en, this message translates to:
  /// **'Must have a minimum of 0 followers'**
  String get mustHaveAMinimumOf0Followers;

  /// No description provided for @mustHaveAMinimumOf10Followers.
  ///
  /// In en, this message translates to:
  /// **'Must have a minimum of 10 followers'**
  String get mustHaveAMinimumOf10Followers;

  /// No description provided for @mustHaveAPublicAccountCannotBePrivate.
  ///
  /// In en, this message translates to:
  /// **'Must have a public account (cannot be private)'**
  String get mustHaveAPublicAccountCannotBePrivate;

  /// No description provided for @mustHaveAtLeast4VideosPosted.
  ///
  /// In en, this message translates to:
  /// **'Must have at least 4 videos posted'**
  String get mustHaveAtLeast4VideosPosted;

  /// No description provided for @mustHaveAtLeast5000Followers.
  ///
  /// In en, this message translates to:
  /// **'Must have at least 5,000 followers'**
  String get mustHaveAtLeast5000Followers;

  /// No description provided for @navigatedToPayExplainedScreen.
  ///
  /// In en, this message translates to:
  /// **'Navigated to Pay Explained screen'**
  String get navigatedToPayExplainedScreen;

  /// No description provided for @navigatedToRequirementsScreen.
  ///
  /// In en, this message translates to:
  /// **'Navigated to Requirements screen'**
  String get navigatedToRequirementsScreen;

  /// No description provided for @navigatedToTalentAgreementScreen.
  ///
  /// In en, this message translates to:
  /// **'Navigated to Talent Agreement screen'**
  String get navigatedToTalentAgreementScreen;

  /// No description provided for @navigatedToWhatIsYourRoleScreen.
  ///
  /// In en, this message translates to:
  /// **'Navigated to What Is Your Role screen'**
  String get navigatedToWhatIsYourRoleScreen;

  /// No description provided for @navigatedToWhatWeDoNotDoScreen.
  ///
  /// In en, this message translates to:
  /// **'Navigated to What We Do Not Do screen'**
  String get navigatedToWhatWeDoNotDoScreen;

  /// No description provided for @navigatedToWhatWeDoScreen.
  ///
  /// In en, this message translates to:
  /// **'Navigated to What We Do screen'**
  String get navigatedToWhatWeDoScreen;

  /// No description provided for @navigatedToHomeScreen.
  ///
  /// In en, this message translates to:
  /// **'Navigated to home screen'**
  String get navigatedToHomeScreen;

  /// No description provided for @navigatedToIndexIndex.
  ///
  /// In en, this message translates to:
  /// **'Navigated to index: \$index'**
  String get navigatedToIndexIndex;

  /// No description provided for @neptune.
  ///
  /// In en, this message translates to:
  /// **'Neptune'**
  String get neptune;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// No description provided for @networkAcceptance.
  ///
  /// In en, this message translates to:
  /// **'Network Acceptance:'**
  String get networkAcceptance;

  /// No description provided for @networkEarningsSource.
  ///
  /// In en, this message translates to:
  /// **'Network Earnings Source'**
  String get networkEarningsSource;

  /// No description provided for @networkEventsCampaigns.
  ///
  /// In en, this message translates to:
  /// **'Network Events & Campaigns'**
  String get networkEventsCampaigns;

  /// No description provided for @networkPayoutFactors.
  ///
  /// In en, this message translates to:
  /// **'Network Payout Factors'**
  String get networkPayoutFactors;

  /// No description provided for @networkwideEngagementMetrics.
  ///
  /// In en, this message translates to:
  /// **'Network-wide engagement metrics'**
  String get networkwideEngagementMetrics;

  /// No description provided for @network1.
  ///
  /// In en, this message translates to:
  /// **'Network\\'**
  String get network1;

  /// No description provided for @newZealand.
  ///
  /// In en, this message translates to:
  /// **'New Zealand'**
  String get newZealand;

  /// No description provided for @no247AvailabilityManagersProvideGuidanceNotPersona.
  ///
  /// In en, this message translates to:
  /// **'No 24/7 Availability: Managers provide guidance, not personal assistant services.'**
  String get no247AvailabilityManagersProvideGuidanceNotPersona;

  /// No description provided for @noAccessToReportDataWeCannotSeeWhoReportedOrFlagge.
  ///
  /// In en, this message translates to:
  /// **'No Access to Report Data: We cannot see who reported or flagged your content.'**
  String get noAccessToReportDataWeCannotSeeWhoReportedOrFlagge;

  /// No description provided for @noAccountControlYourFavoritedAccountRemainsYours.
  ///
  /// In en, this message translates to:
  /// **'No Account Control: Your Favorited account remains yours.'**
  String get noAccountControlYourFavoritedAccountRemainsYours;

  /// No description provided for @noAccountOwnershipWeNeverTakeControlOfYourTiktokAc.
  ///
  /// In en, this message translates to:
  /// **'No Account Ownership: We never take control of your TikTok account. You remain the sole owner.'**
  String get noAccountOwnershipWeNeverTakeControlOfYourTiktokAc;

  /// No description provided for @noAccountTakeoverYouRetainFullControlOfYourTiktokS.
  ///
  /// In en, this message translates to:
  /// **'No Account Takeover: You retain full control of your TikTok Shop.'**
  String get noAccountTakeoverYouRetainFullControlOfYourTiktokS;

  /// No description provided for @noArtificialGrowthWeDoNotSellFollowersLikesBotsVie.
  ///
  /// In en, this message translates to:
  /// **'No Artificial Growth: We do not sell followers, likes, bots, viewers, or any form of fake engagement.'**
  String get noArtificialGrowthWeDoNotSellFollowersLikesBotsVie;

  /// No description provided for @noArtificialGrowthWeDoNotSellFollowersLikesOrViewe.
  ///
  /// In en, this message translates to:
  /// **'No Artificial Growth: We do not sell followers, likes, or viewers.'**
  String get noArtificialGrowthWeDoNotSellFollowersLikesOrViewe;

  /// No description provided for @noAuthorityOverBansTiktokShopEnforcesAccountAction.
  ///
  /// In en, this message translates to:
  /// **'No Authority Over Bans: TikTok Shop enforces account actions.'**
  String get noAuthorityOverBansTiktokShopEnforcesAccountAction;

  /// No description provided for @noAuthorityOverBansTiktokEnforcesBansAndSuspension.
  ///
  /// In en, this message translates to:
  /// **'No Authority Over Bans: TikTok enforces bans and suspensions—not us.'**
  String get noAuthorityOverBansTiktokEnforcesBansAndSuspension;

  /// No description provided for @noBanControlFavoritedEnforcesBansIndependently.
  ///
  /// In en, this message translates to:
  /// **'No Ban Control: Favorited enforces bans independently.'**
  String get noBanControlFavoritedEnforcesBansIndependently;

  /// No description provided for @noBrandingServicesMerchandiseLogosAndDealsAreNotPr.
  ///
  /// In en, this message translates to:
  /// **'No Branding Services: Merchandise, logos, and deals are not provided.'**
  String get noBrandingServicesMerchandiseLogosAndDealsAreNotPr;

  /// No description provided for @noBrandingOrCrossplatformSupportLogosMerchandiseOr.
  ///
  /// In en, this message translates to:
  /// **'No Branding or Cross-Platform Support: Logos, merchandise, or Instagram/YouTube accounts are not covered.'**
  String get noBrandingOrCrossplatformSupportLogosMerchandiseOr;

  /// No description provided for @noContentCreationWeDoNotMakeOrPostTiktokShopVideos.
  ///
  /// In en, this message translates to:
  /// **'No Content Creation: We do not make or post TikTok Shop videos.'**
  String get noContentCreationWeDoNotMakeOrPostTiktokShopVideos;

  /// No description provided for @noContentPostingWeDoNotCreateOrManageFavoritedCont.
  ///
  /// In en, this message translates to:
  /// **'No Content Posting: We do not create or manage Favorited content.'**
  String get noContentPostingWeDoNotCreateOrManageFavoritedCont;

  /// No description provided for @noCrossplatformControlYoutubeInstagramAndOtherAcco.
  ///
  /// In en, this message translates to:
  /// **'No Cross-Platform Control: YouTube, Instagram, and other accounts remain outside our scope.'**
  String get noCrossplatformControlYoutubeInstagramAndOtherAcco;

  /// No description provided for @noCrossplatformOversightOtherPlatformsYoutubeInsta.
  ///
  /// In en, this message translates to:
  /// **'No Cross-Platform Oversight: Other platforms (YouTube, Instagram, etc.) are not managed.'**
  String get noCrossplatformOversightOtherPlatformsYoutubeInsta;

  /// No description provided for @noDedicatedManagerForEveryLiveManagersProvideGuida.
  ///
  /// In en, this message translates to:
  /// **'No Dedicated Manager for Every LIVE: Managers provide guidance but cannot attend all streams.'**
  String get noDedicatedManagerForEveryLiveManagersProvideGuida;

  /// No description provided for @noDedicatedManagerForEveryLiveManagersSupportManyC.
  ///
  /// In en, this message translates to:
  /// **'No Dedicated Manager for Every LIVE: Managers support many creators and cannot join each stream.'**
  String get noDedicatedManagerForEveryLiveManagersSupportManyC;

  /// No description provided for @noDeviceControlWeDoNotMonitorOrManageYourPhoneComp.
  ///
  /// In en, this message translates to:
  /// **'No Device Control: We do not monitor or manage your phone, computer, or personal devices.'**
  String get noDeviceControlWeDoNotMonitorOrManageYourPhoneComp;

  /// No description provided for @noDirectContentManagementWeDoNotCreatePostOrEditTi.
  ///
  /// In en, this message translates to:
  /// **'No Direct Content Management: We do not create, post, or edit TikTok videos for you.'**
  String get noDirectContentManagementWeDoNotCreatePostOrEditTi;

  /// No description provided for @noDirectPaymentsAllPayoutsComeFromTiktokShop.
  ///
  /// In en, this message translates to:
  /// **'No Direct Payments: All payouts come from TikTok Shop.'**
  String get noDirectPaymentsAllPayoutsComeFromTiktokShop;

  /// No description provided for @noDirectPlatformAccessWeDoNotProvideA.
  ///
  /// In en, this message translates to:
  /// **'No Direct Platform Access: We do not provide a'**
  String get noDirectPlatformAccessWeDoNotProvideA;

  /// No description provided for @noDualMembershipWorkingWithOtherAgenciesWhileUnder.
  ///
  /// In en, this message translates to:
  /// **'No Dual Membership: Working with other agencies while under Infinitum violates your contract and will result in consequences.'**
  String get noDualMembershipWorkingWithOtherAgenciesWhileUnder;

  /// No description provided for @noEquipmentFundingWeDoNotPurchaseOrReimburseEquipm.
  ///
  /// In en, this message translates to:
  /// **'No Equipment Funding: We do not purchase or reimburse equipment.'**
  String get noEquipmentFundingWeDoNotPurchaseOrReimburseEquipm;

  /// No description provided for @noEquipmentReimbursementYouFundYourOwnTools.
  ///
  /// In en, this message translates to:
  /// **'No Equipment Reimbursement: You fund your own tools.'**
  String get noEquipmentReimbursementYouFundYourOwnTools;

  /// No description provided for @noEventRemindersYouMustTrackAndManageYourSchedule.
  ///
  /// In en, this message translates to:
  /// **'No Event Reminders: You must track and manage your schedule.'**
  String get noEventRemindersYouMustTrackAndManageYourSchedule;

  /// No description provided for @noEventsaleRemindersYouAreResponsibleForScheduling.
  ///
  /// In en, this message translates to:
  /// **'No Event/Sale Reminders: You are responsible for scheduling and tracking sales.'**
  String get noEventsaleRemindersYouAreResponsibleForScheduling;

  /// No description provided for @noFakeSalesviewsWeDoNotProvideArtificialViewerOrSa.
  ///
  /// In en, this message translates to:
  /// **'No Fake Sales/Views: We do not provide artificial viewer or sales boosting.'**
  String get noFakeSalesviewsWeDoNotProvideArtificialViewerOrSa;

  /// No description provided for @noFeesOrCommissions1.
  ///
  /// In en, this message translates to:
  /// **'No Fees or Commissions'**
  String get noFeesOrCommissions1;

  /// No description provided for @noFeesOurServicesAreFree.
  ///
  /// In en, this message translates to:
  /// **'No Fees: Our services are free.'**
  String get noFeesOurServicesAreFree;

  /// No description provided for @noFinancialAdviceWeDoNotOfferFinancialPlanningOrTa.
  ///
  /// In en, this message translates to:
  /// **'No Financial Advice: We do not offer financial planning or tax prep.'**
  String get noFinancialAdviceWeDoNotOfferFinancialPlanningOrTa;

  /// No description provided for @noFinancialOrTaxAdviceWeDoNotManageFileOrPrepareTa.
  ///
  /// In en, this message translates to:
  /// **'No Financial or Tax Advice: We do not manage, file, or prepare taxes for you. (Creators are independent contractors, not employees.)'**
  String get noFinancialOrTaxAdviceWeDoNotManageFileOrPrepareTa;

  /// No description provided for @noForcedExclusivityWithoutConsentYouAreNeverLocked.
  ///
  /// In en, this message translates to:
  /// **'No Forced Exclusivity Without Consent: You are never locked in unless you choose to sign with us.'**
  String get noForcedExclusivityWithoutConsentYouAreNeverLocked;

  /// No description provided for @noFraudulentServicesWeDoNotSellFakeGrowthBotsOrEmp.
  ///
  /// In en, this message translates to:
  /// **'No Fraudulent Services: We do not sell fake growth, bots, or empty promises.'**
  String get noFraudulentServicesWeDoNotSellFakeGrowthBotsOrEmp;

  /// No description provided for @noFreeGiftsForBattlesrankingsRewardsAreOnlyOffered.
  ///
  /// In en, this message translates to:
  /// **'No Free Gifts for Battles/Rankings: Rewards are only offered through official network campaigns.'**
  String get noFreeGiftsForBattlesrankingsRewardsAreOnlyOffered;

  /// No description provided for @noFreeInventoryProductsMustBeSourcedByYou.
  ///
  /// In en, this message translates to:
  /// **'No Free Inventory: Products must be sourced by you.'**
  String get noFreeInventoryProductsMustBeSourcedByYou;

  /// No description provided for @noFreeProductsWeDoNotProvideEquipmentOrMerchandise.
  ///
  /// In en, this message translates to:
  /// **'No Free Products: We do not provide equipment or merchandise.'**
  String get noFreeProductsWeDoNotProvideEquipmentOrMerchandise;

  /// No description provided for @noFreeProductsWeDoNotSupplyItemsForGoingLive.
  ///
  /// In en, this message translates to:
  /// **'No Free Products: We do not supply items for going LIVE.'**
  String get noFreeProductsWeDoNotSupplyItemsForGoingLive;

  /// No description provided for @noGuaranteeOfFameOrEarningsGrowthDependsOnYourEffo.
  ///
  /// In en, this message translates to:
  /// **'No Guarantee of Fame or Earnings: Growth depends on your effort, consistency, and content.'**
  String get noGuaranteeOfFameOrEarningsGrowthDependsOnYourEffo;

  /// No description provided for @noGuaranteedSalesGrowthResultsDependOnYourContentA.
  ///
  /// In en, this message translates to:
  /// **'No Guaranteed Sales Growth: Results depend on your content and effort.'**
  String get noGuaranteedSalesGrowthResultsDependOnYourContentA;

  /// No description provided for @noHealthmentalHealthServicesWeDoNotProvideTherapyC.
  ///
  /// In en, this message translates to:
  /// **'No Health/Mental Health Services: We do not provide therapy, counseling, or emergency support.'**
  String get noHealthmentalHealthServicesWeDoNotProvideTherapyC;

  /// No description provided for @noHiddenClausesOrFeesAllTermsAreTransparentAndProv.
  ///
  /// In en, this message translates to:
  /// **'No Hidden Clauses or Fees: All terms are transparent and provided in writing.'**
  String get noHiddenClausesOrFeesAllTermsAreTransparentAndProv;

  /// No description provided for @noHiddenFeesOurTiktokLiveServicesAreFreeForCreator.
  ///
  /// In en, this message translates to:
  /// **'No Hidden Fees: Our TikTok LIVE services are free for creators.'**
  String get noHiddenFeesOurTiktokLiveServicesAreFreeForCreator;

  /// No description provided for @noLiveModerationYouMustAppointAndManageYourOwnMode.
  ///
  /// In en, this message translates to:
  /// **'No LIVE Moderation: You must appoint and manage your own moderators.'**
  String get noLiveModerationYouMustAppointAndManageYourOwnMode;

  /// No description provided for @noLegalAdviceSeekProfessionalsForContractsOrDisput.
  ///
  /// In en, this message translates to:
  /// **'No Legal Advice: Seek professionals for contracts or disputes.'**
  String get noLegalAdviceSeekProfessionalsForContractsOrDisput;

  /// No description provided for @noLegalAdviceWeDoNotProvideLegalOrContractualCouns.
  ///
  /// In en, this message translates to:
  /// **'No Legal Advice: We do not provide legal or contractual counsel.'**
  String get noLegalAdviceWeDoNotProvideLegalOrContractualCouns;

  /// No description provided for @noLegalOrContractAdvicePleaseConsultALegalProfessi.
  ///
  /// In en, this message translates to:
  /// **'No Legal or Contract Advice: Please consult a legal professional.'**
  String get noLegalOrContractAdvicePleaseConsultALegalProfessi;

  /// No description provided for @noManagerForEverySaleManagersProvideGeneralSupport.
  ///
  /// In en, this message translates to:
  /// **'No Manager for Every Sale: Managers provide general support, not live oversight.'**
  String get noManagerForEverySaleManagersProvideGeneralSupport;

  /// No description provided for @noMisrepresentationWeAreACreatorNetworkPartnernotT.
  ///
  /// In en, this message translates to:
  /// **'No Misrepresentation: We are a Creator Network partner—not TikTok, not Favorited, not Bigo.'**
  String get noMisrepresentationWeAreACreatorNetworkPartnernotT;

  /// No description provided for @noModerationServicesYouAreResponsibleForSelectingM.
  ///
  /// In en, this message translates to:
  /// **'No Moderation Services: You are responsible for selecting moderators.'**
  String get noModerationServicesYouAreResponsibleForSelectingM;

  /// No description provided for @noPaymentsForGoingLivePayoutsComeDirectlyFromTikto.
  ///
  /// In en, this message translates to:
  /// **'No Payments for Going LIVE: Payouts come directly from TikTok, not from us.'**
  String get noPaymentsForGoingLivePayoutsComeDirectlyFromTikto;

  /// No description provided for @noPaymentsForStreamingEarningsComeDirectlyFromFavo.
  ///
  /// In en, this message translates to:
  /// **'No Payments for Streaming: Earnings come directly from Favorited.'**
  String get noPaymentsForStreamingEarningsComeDirectlyFromFavo;

  /// No description provided for @noPersonalBrandingServicesWeDoNotHandleLogosMercha.
  ///
  /// In en, this message translates to:
  /// **'No Personal Branding Services: We do not handle logos, merchandise, or sponsorship deals.'**
  String get noPersonalBrandingServicesWeDoNotHandleLogosMercha;

  /// No description provided for @noPersonalEventRemindersYouAreResponsibleForTracki.
  ///
  /// In en, this message translates to:
  /// **'No Personal Event Reminders: You are responsible for tracking events and LIVE schedules.'**
  String get noPersonalEventRemindersYouAreResponsibleForTracki;

  /// No description provided for @noPlatformAuthorityWeDoNotCreateOrChangeTiktokFavo.
  ///
  /// In en, this message translates to:
  /// **'No Platform Authority: We do not create or change TikTok, Favorited, Bigo, or Shop policies.'**
  String get noPlatformAuthorityWeDoNotCreateOrChangeTiktokFavo;

  /// No description provided for @noPromiseOfInstantGrowthSuccessTakesTimeAndEffort.
  ///
  /// In en, this message translates to:
  /// **'No Promise of Instant Growth: Success takes time and effort.'**
  String get noPromiseOfInstantGrowthSuccessTakesTimeAndEffort;

  /// No description provided for @noRecruitmentPromisesWeDoNotPromiseIncomeJustForJo.
  ///
  /// In en, this message translates to:
  /// **'No Recruitment Promises: We do not promise income just for joining.'**
  String get noRecruitmentPromisesWeDoNotPromiseIncomeJustForJo;

  /// No description provided for @noReimbursementWeDoNotCoverOrRefundEquipmentOrMate.
  ///
  /// In en, this message translates to:
  /// **'No Reimbursement: We do not cover or refund equipment or material costs.'**
  String get noReimbursementWeDoNotCoverOrRefundEquipmentOrMate;

  /// No description provided for @noReportDataAccessWeCannotSeeWhoReportsYou.
  ///
  /// In en, this message translates to:
  /// **'No Report Data Access: We cannot see who reports you.'**
  String get noReportDataAccessWeCannotSeeWhoReportsYou;

  /// No description provided for @noReportDataAccessWeDoNotSeeWhoFlaggedYourContent.
  ///
  /// In en, this message translates to:
  /// **'No Report Data Access: We do not see who flagged your content.'**
  String get noReportDataAccessWeDoNotSeeWhoFlaggedYourContent;

  /// No description provided for @noResponsibilityForHarassmentOrSafetyRisksWePromot.
  ///
  /// In en, this message translates to:
  /// **'No Responsibility for Harassment or Safety Risks: We promote safe streaming but cannot prevent or control external harassment.'**
  String get noResponsibilityForHarassmentOrSafetyRisksWePromot;

  /// No description provided for @noRetroactiveContractChangesWeCannotAlterAgreement.
  ///
  /// In en, this message translates to:
  /// **'No Retroactive Contract Changes: We cannot alter agreements without your consent.'**
  String get noRetroactiveContractChangesWeCannotAlterAgreement;

  /// No description provided for @noRetroactiveContractChangesYourTermsCannotChangeW.
  ///
  /// In en, this message translates to:
  /// **'No Retroactive Contract Changes: Your terms cannot change without your written agreement.'**
  String get noRetroactiveContractChangesYourTermsCannotChangeW;

  /// No description provided for @noRomanceGuaranteesStillCan.
  ///
  /// In en, this message translates to:
  /// **'No Romance Guarantees: Still can\\'**
  String get noRomanceGuaranteesStillCan;

  /// No description provided for @noRomanceGuaranteesWeCannotMakeAnyoneFallInLoveWit.
  ///
  /// In en, this message translates to:
  /// **'No Romance Guarantees: We cannot make anyone fall in love with you… yet.'**
  String get noRomanceGuaranteesWeCannotMakeAnyoneFallInLoveWit;

  /// No description provided for @noShopModerationYouMustManageYourOwnModerators.
  ///
  /// In en, this message translates to:
  /// **'No Shop Moderation: You must manage your own moderators.'**
  String get noShopModerationYouMustManageYourOwnModerators;

  /// No description provided for @noSpecialAppealAccessWeDoNotBypassTiktok.
  ///
  /// In en, this message translates to:
  /// **'No Special Appeal Access: We do not bypass TikTok\\'**
  String get noSpecialAppealAccessWeDoNotBypassTiktok;

  /// No description provided for @noTaxfinancialAdviceRevenueManagementAndFilingAreY.
  ///
  /// In en, this message translates to:
  /// **'No Tax/Financial Advice: Revenue management and filing are your responsibility.'**
  String get noTaxfinancialAdviceRevenueManagementAndFilingAreY;

  /// No description provided for @noViolationRemovalFavoritedHandlesItsOwnGuidelineE.
  ///
  /// In en, this message translates to:
  /// **'No Violation Removal: Favorited handles its own guideline enforcement.'**
  String get noViolationRemovalFavoritedHandlesItsOwnGuidelineE;

  /// No description provided for @noViolationRemovalWeCannotAppealOrEraseViolations.
  ///
  /// In en, this message translates to:
  /// **'No Violation Removal: We cannot appeal or erase violations.'**
  String get noViolationRemovalWeCannotAppealOrEraseViolations;

  /// No description provided for @noViolationRemovalWeCannotEraseTiktokissuedContent.
  ///
  /// In en, this message translates to:
  /// **'No Violation Removal: We cannot erase TikTok-issued content strikes.'**
  String get noViolationRemovalWeCannotEraseTiktokissuedContent;

  /// No description provided for @noAnnouncementsAvailable1.
  ///
  /// In en, this message translates to:
  /// **'No announcements available'**
  String get noAnnouncementsAvailable1;

  /// No description provided for @noFeesOrCommissionsCreatorsAlwaysKeep100OfTheirTik.
  ///
  /// In en, this message translates to:
  /// **'No fees or commissions – creators always keep 100% of their TikTok LIVE earnings.'**
  String get noFeesOrCommissionsCreatorsAlwaysKeep100OfTheirTik;

  /// No description provided for @noStatisticsAvailable1.
  ///
  /// In en, this message translates to:
  /// **'No statistics available'**
  String get noStatisticsAvailable1;

  /// No description provided for @noInfinitumLiveNeverTakesAPercentageOfYourLiveDiam.
  ///
  /// In en, this message translates to:
  /// **'No. Infinitum LIVE never takes a percentage of your LIVE diamonds — you keep 100% of your TikTok LIVE earnings.'**
  String get noInfinitumLiveNeverTakesAPercentageOfYourLiveDiam;

  /// No description provided for @nondisparagement.
  ///
  /// In en, this message translates to:
  /// **'Non-Disparagement:'**
  String get nondisparagement;

  /// No description provided for @notCurrentlyAffiliatedWithAnotherLiveAgencyOrManag.
  ///
  /// In en, this message translates to:
  /// **'Not currently affiliated with another LIVE agency or manager'**
  String get notCurrentlyAffiliatedWithAnotherLiveAgencyOrManag;

  /// No description provided for @notCurrentlyAffiliatedWithAnotherTiktokLiveAgencyO.
  ///
  /// In en, this message translates to:
  /// **'Not currently affiliated with another TikTok LIVE agency or manager'**
  String get notCurrentlyAffiliatedWithAnotherTiktokLiveAgencyO;

  /// No description provided for @officialAccount.
  ///
  /// In en, this message translates to:
  /// **'Official Account'**
  String get officialAccount;

  /// No description provided for @onboarding1.
  ///
  /// In en, this message translates to:
  /// **'Onboarding'**
  String get onboarding1;

  /// No description provided for @oneononeCoachingPersonalizedTrainingFromRealCreato.
  ///
  /// In en, this message translates to:
  /// **'One-on-one coaching – personalized training from real creators who know how to succeed on TikTok LIVE.'**
  String get oneononeCoachingPersonalizedTrainingFromRealCreato;

  /// No description provided for @openInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in Browser'**
  String get openInBrowser;

  /// No description provided for @openedApplicationLinkUrl.
  ///
  /// In en, this message translates to:
  /// **'Opened application link: \$url'**
  String get openedApplicationLinkUrl;

  /// No description provided for @openingDiscordCommunityLink.
  ///
  /// In en, this message translates to:
  /// **'Opening Discord community link'**
  String get openingDiscordCommunityLink;

  /// No description provided for @openingUrlInInappWebviewUrl.
  ///
  /// In en, this message translates to:
  /// **'Opening URL in in-app webview: \$url'**
  String get openingUrlInInappWebviewUrl;

  /// No description provided for @openingUrlUrl.
  ///
  /// In en, this message translates to:
  /// **'Opening URL: \$url'**
  String get openingUrlUrl;

  /// No description provided for @openingAnnouncementLinkUrl.
  ///
  /// In en, this message translates to:
  /// **'Opening announcement link: \$url'**
  String get openingAnnouncementLinkUrl;

  /// No description provided for @openingLinkUrl.
  ///
  /// In en, this message translates to:
  /// **'Opening link: \$url'**
  String get openingLinkUrl;

  /// No description provided for @ourNetworkOperatesUnderAStructuredWithdrawalProces.
  ///
  /// In en, this message translates to:
  /// **'Our network operates under a structured withdrawal process designed to protect both creators and the community. This includes a 30-day notice period followed by a 60-day cooldown period, totaling 90 days.'**
  String get ourNetworkOperatesUnderAStructuredWithdrawalProces;

  /// No description provided for @overallPerformanceOfManagedCreators.
  ///
  /// In en, this message translates to:
  /// **'Overall performance of managed creators'**
  String get overallPerformanceOfManagedCreators;

  /// No description provided for @pageFinishedLoadingUrl.
  ///
  /// In en, this message translates to:
  /// **'Page finished loading: \$url'**
  String get pageFinishedLoadingUrl;

  /// No description provided for @pageStartedLoadingUrl.
  ///
  /// In en, this message translates to:
  /// **'Page started loading: \$url'**
  String get pageStartedLoadingUrl;

  /// No description provided for @paidFromNetwork.
  ///
  /// In en, this message translates to:
  /// **'Paid from network\\'**
  String get paidFromNetwork;

  /// No description provided for @payExplained1.
  ///
  /// In en, this message translates to:
  /// **'Pay Explained'**
  String get payExplained1;

  /// No description provided for @paymentsFinancials.
  ///
  /// In en, this message translates to:
  /// **'Payments & Financials'**
  String get paymentsFinancials;

  /// No description provided for @payoutBasis.
  ///
  /// In en, this message translates to:
  /// **'Payout Basis:'**
  String get payoutBasis;

  /// No description provided for @peerCollaborationGroupsSmallerTeamsForSharingStrat.
  ///
  /// In en, this message translates to:
  /// **'Peer Collaboration Groups – Smaller teams for sharing strategies and support.'**
  String get peerCollaborationGroupsSmallerTeamsForSharingStrat;

  /// No description provided for @performanceMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Performance Monitoring'**
  String get performanceMonitoring;

  /// No description provided for @performanceMonitoringRegularLiveFeedbackAndEvaluat.
  ///
  /// In en, this message translates to:
  /// **'Performance Monitoring: Regular LIVE feedback and evaluations.'**
  String get performanceMonitoringRegularLiveFeedbackAndEvaluat;

  /// No description provided for @performanceStandards.
  ///
  /// In en, this message translates to:
  /// **'Performance Standards:'**
  String get performanceStandards;

  /// No description provided for @performanceStandardsStriveToMeetOrExceedMonthlySal.
  ///
  /// In en, this message translates to:
  /// **'Performance Standards: Strive to meet or exceed monthly sales targets.'**
  String get performanceStandardsStriveToMeetOrExceedMonthlySal;

  /// No description provided for @personalCoachingTraining1.
  ///
  /// In en, this message translates to:
  /// **'Personal Coaching & Training'**
  String get personalCoachingTraining1;

  /// No description provided for @philippines.
  ///
  /// In en, this message translates to:
  /// **'Philippines'**
  String get philippines;

  /// No description provided for @pittsburghPennsylvaniaUsa.
  ///
  /// In en, this message translates to:
  /// **'Pittsburgh, Pennsylvania, USA 🎉'**
  String get pittsburghPennsylvaniaUsa;

  /// No description provided for @pittsburghPennsylvaniaUnitedStates.
  ///
  /// In en, this message translates to:
  /// **'Pittsburgh, Pennsylvania, United States'**
  String get pittsburghPennsylvaniaUnitedStates;

  /// No description provided for @platformBehaviorStandards.
  ///
  /// In en, this message translates to:
  /// **'Platform & Behavior Standards'**
  String get platformBehaviorStandards;

  /// No description provided for @platformOperations.
  ///
  /// In en, this message translates to:
  /// **'Platform operations'**
  String get platformOperations;

  /// No description provided for @pleaseUseYourEmailClientToContactUs.
  ///
  /// In en, this message translates to:
  /// **'Please use your email client to contact us.'**
  String get pleaseUseYourEmailClientToContactUs;

  /// No description provided for @poachingOutsideInfluence.
  ///
  /// In en, this message translates to:
  /// **'Poaching & Outside Influence'**
  String get poachingOutsideInfluence;

  /// No description provided for @poachingAwarenessImmediatelyReportOutsideAgenciesA.
  ///
  /// In en, this message translates to:
  /// **'Poaching Awareness: Immediately report outside agencies attempting to recruit you.'**
  String get poachingAwarenessImmediatelyReportOutsideAgenciesA;

  /// No description provided for @portionOfTiktok.
  ///
  /// In en, this message translates to:
  /// **'Portion of TikTok\\'**
  String get portionOfTiktok;

  /// No description provided for @positiveCreatorTestimonialsOnTiktokAndReddit.
  ///
  /// In en, this message translates to:
  /// **'Positive creator testimonials on TikTok and Reddit'**
  String get positiveCreatorTestimonialsOnTiktokAndReddit;

  /// No description provided for @positiveTestimonialsCreatorsAcrossTiktokAndRedditC.
  ///
  /// In en, this message translates to:
  /// **'Positive testimonials – creators across TikTok and Reddit call Infinitum one of the most supportive agencies.'**
  String get positiveTestimonialsCreatorsAcrossTiktokAndRedditC;

  /// No description provided for @preloadservice.
  ///
  /// In en, this message translates to:
  /// **'PreloadService'**
  String get preloadservice;

  /// No description provided for @preloadserviceInitialized.
  ///
  /// In en, this message translates to:
  /// **'PreloadService initialized'**
  String get preloadserviceInitialized;

  /// No description provided for @preloadingAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Preloading announcements...'**
  String get preloadingAnnouncements;

  /// No description provided for @preloadingStatistics.
  ///
  /// In en, this message translates to:
  /// **'Preloading statistics...'**
  String get preloadingStatistics;

  /// No description provided for @prioritySupport8Am8PmEstMondayfriday.
  ///
  /// In en, this message translates to:
  /// **'Priority Support: 8 AM–8 PM EST, Monday–Friday.'**
  String get prioritySupport8Am8PmEstMondayfriday;

  /// No description provided for @privacyPolicy1.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy1;

  /// No description provided for @professionalConductTreatAllCustomersAndSalesIntera.
  ///
  /// In en, this message translates to:
  /// **'Professional Conduct: Treat all customers and sales interactions with respect and professionalism.'**
  String get professionalConductTreatAllCustomersAndSalesIntera;

  /// No description provided for @professionalismOnCameraAvoidExcessiveProfanitySmok.
  ///
  /// In en, this message translates to:
  /// **'Professionalism on Camera: Avoid excessive profanity, smoking/vaping, drinking, or other unprofessional conduct. Violations may result in removal.'**
  String get professionalismOnCameraAvoidExcessiveProfanitySmok;

  /// No description provided for @professionalismOnCameraRefrainFromInappropriateCon.
  ///
  /// In en, this message translates to:
  /// **'Professionalism on Camera: Refrain from inappropriate conduct such as excessive profanity, smoking, alcohol consumption, or offensive content.'**
  String get professionalismOnCameraRefrainFromInappropriateCon;

  /// No description provided for @professionalismOnLiveAvoidBehaviorThatMayHarmYourI.
  ///
  /// In en, this message translates to:
  /// **'Professionalism on LIVE: Avoid behavior that may harm your image or Infinitum\\'**
  String get professionalismOnLiveAvoidBehaviorThatMayHarmYourI;

  /// No description provided for @profileOptimizationReviewsToBoostVisibilityRetenti.
  ///
  /// In en, this message translates to:
  /// **'Profile Optimization – Reviews to boost visibility, retention, and TikTok growth.'**
  String get profileOptimizationReviewsToBoostVisibilityRetenti;

  /// No description provided for @profileQuality.
  ///
  /// In en, this message translates to:
  /// **'Profile Quality:'**
  String get profileQuality;

  /// No description provided for @proofOfPerformance.
  ///
  /// In en, this message translates to:
  /// **'Proof of Performance:'**
  String get proofOfPerformance;

  /// No description provided for @proudlyFoundedAndThrivingInTheUsa.
  ///
  /// In en, this message translates to:
  /// **'Proudly Founded and Thriving in the USA!'**
  String get proudlyFoundedAndThrivingInTheUsa;

  /// No description provided for @proudlyFoundedThrivingInTheUsa.
  ///
  /// In en, this message translates to:
  /// **'Proudly founded & thriving in the USA! 🇺🇸📍'**
  String get proudlyFoundedThrivingInTheUsa;

  /// No description provided for @provenSuccessStoriesMembersAchievingMilestonesGrow.
  ///
  /// In en, this message translates to:
  /// **'Proven success stories – members achieving milestones, growing audiences, and maximizing diamond earnings.'**
  String get provenSuccessStoriesMembersAchievingMilestonesGrow;

  /// No description provided for @publiclyAvailableInformationPreviouslyKnownKnowled.
  ///
  /// In en, this message translates to:
  /// **'Publicly available information, previously known knowledge, or independently developed resources are not considered confidential.'**
  String get publiclyAvailableInformationPreviouslyKnownKnowled;

  /// No description provided for @quickLinks1.
  ///
  /// In en, this message translates to:
  /// **'Quick Links'**
  String get quickLinks1;

  /// No description provided for @rapidGrowthStoryFrom0ToNearly2000CreatorsWithinIts.
  ///
  /// In en, this message translates to:
  /// **'Rapid growth story (from 0 to nearly 2,000 creators within its first year)'**
  String get rapidGrowthStoryFrom0ToNearly2000CreatorsWithinIts;

  /// No description provided for @rapidGrowthFrom0ToNearly2000CreatorsInItsFirstYear.
  ///
  /// In en, this message translates to:
  /// **'Rapid growth – from 0 to nearly 2,000 creators in its first year.'**
  String get rapidGrowthFrom0ToNearly2000CreatorsInItsFirstYear;

  /// No description provided for @readyToJoinThe1TiktokLiveCreatorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Ready to join the #1 TikTok LIVE Creator Network?'**
  String get readyToJoinThe1TiktokLiveCreatorNetwork;

  /// No description provided for @realtimeDataFromOurCreatorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Real-time data from our creator network'**
  String get realtimeDataFromOurCreatorNetwork;

  /// No description provided for @receivesPortionOfTiktok.
  ///
  /// In en, this message translates to:
  /// **'Receives portion of TikTok\\'**
  String get receivesPortionOfTiktok;

  /// No description provided for @receivesUpTo53OfTotalEarnings.
  ///
  /// In en, this message translates to:
  /// **'Receives up to 53% of total earnings'**
  String get receivesUpTo53OfTotalEarnings;

  /// No description provided for @recognitionAwardsMonthlyAndQuarterlyCreatorSpotlig.
  ///
  /// In en, this message translates to:
  /// **'Recognition Awards – Monthly and quarterly creator spotlights.'**
  String get recognitionAwardsMonthlyAndQuarterlyCreatorSpotlig;

  /// No description provided for @recruitingBonusesEarnWhenReferredCreatorsHitMilest.
  ///
  /// In en, this message translates to:
  /// **'Recruiting Bonuses – Earn when referred creators hit milestones.'**
  String get recruitingBonusesEarnWhenReferredCreatorsHitMilest;

  /// No description provided for @rednote.
  ///
  /// In en, this message translates to:
  /// **'RedNote'**
  String get rednote;

  /// No description provided for @referralOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Referral Opportunities'**
  String get referralOpportunities;

  /// No description provided for @referralProgram.
  ///
  /// In en, this message translates to:
  /// **'Referral Program'**
  String get referralProgram;

  /// No description provided for @referralRewards.
  ///
  /// In en, this message translates to:
  /// **'Referral Rewards'**
  String get referralRewards;

  /// No description provided for @relationshipTerms.
  ///
  /// In en, this message translates to:
  /// **'Relationship Terms'**
  String get relationshipTerms;

  /// No description provided for @reload.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get reload;

  /// No description provided for @reloadingWebview.
  ///
  /// In en, this message translates to:
  /// **'Reloading WebView'**
  String get reloadingWebview;

  /// No description provided for @remainder47.
  ///
  /// In en, this message translates to:
  /// **'Remainder (~47%)'**
  String get remainder47;

  /// No description provided for @reportPoachingAttemptsProvideEvidenceIfAnotherAgen.
  ///
  /// In en, this message translates to:
  /// **'Report Poaching Attempts: Provide evidence if another agency attempts to recruit you.'**
  String get reportPoachingAttemptsProvideEvidenceIfAnotherAgen;

  /// No description provided for @reportPoachingAttemptsShareScreenshotsIfOtherAgenc.
  ///
  /// In en, this message translates to:
  /// **'Report Poaching Attempts: Share screenshots if other agencies contact you.'**
  String get reportPoachingAttemptsShareScreenshotsIfOtherAgenc;

  /// No description provided for @reportPoachingIfAnotherNetworkApproachesYouImmedia.
  ///
  /// In en, this message translates to:
  /// **'Report Poaching: If another network approaches you, immediately notify us with screenshots or chat logs.'**
  String get reportPoachingIfAnotherNetworkApproachesYouImmedia;

  /// No description provided for @requestTimedOutPleaseCheckYourInternetConnectionAn.
  ///
  /// In en, this message translates to:
  /// **'Request timed out. Please check your internet connection and try again.'**
  String get requestTimedOutPleaseCheckYourInternetConnectionAn;

  /// No description provided for @requestTimeoutWhileFetchingAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Request timeout while fetching announcements'**
  String get requestTimeoutWhileFetchingAnnouncements;

  /// No description provided for @requestsSubmittedWithinThisPeriodWillBeProcessedPr.
  ///
  /// In en, this message translates to:
  /// **'Requests submitted within this period will be processed promptly with no restrictions.'**
  String get requestsSubmittedWithinThisPeriodWillBeProcessedPr;

  /// No description provided for @requirements1.
  ///
  /// In en, this message translates to:
  /// **'Requirements'**
  String get requirements1;

  /// No description provided for @respectTheRulesFollowAllFavoritedPlatformPoliciesA.
  ///
  /// In en, this message translates to:
  /// **'Respect the Rules: Follow all Favorited platform policies and community guidelines.'**
  String get respectTheRulesFollowAllFavoritedPlatformPoliciesA;

  /// No description provided for @retainedShareOfCreatorRevenue.
  ///
  /// In en, this message translates to:
  /// **'Retained share of creator revenue'**
  String get retainedShareOfCreatorRevenue;

  /// No description provided for @retains47AsPlatformFee.
  ///
  /// In en, this message translates to:
  /// **'Retains ~47% as platform fee'**
  String get retains47AsPlatformFee;

  /// No description provided for @retentionAndComplianceWithTiktokPolicies.
  ///
  /// In en, this message translates to:
  /// **'Retention and compliance with TikTok policies'**
  String get retentionAndComplianceWithTiktokPolicies;

  /// No description provided for @retry1.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry1;

  /// No description provided for @revenueGrowthAssistance.
  ///
  /// In en, this message translates to:
  /// **'Revenue Growth Assistance:'**
  String get revenueGrowthAssistance;

  /// No description provided for @reviewTheTermsAndAgreementsForTiktokLiveMembership.
  ///
  /// In en, this message translates to:
  /// **'Review the terms and agreements for TikTok LIVE membership'**
  String get reviewTheTermsAndAgreementsForTiktokLiveMembership;

  /// No description provided for @rulesForNetworkRelationships.
  ///
  /// In en, this message translates to:
  /// **'Rules for Network Relationships'**
  String get rulesForNetworkRelationships;

  /// No description provided for @safetyTrainingEducationOnHandlingTrollsStalkersAnd.
  ///
  /// In en, this message translates to:
  /// **'Safety Training – Education on handling trolls, stalkers, and harassment.'**
  String get safetyTrainingEducationOnHandlingTrollsStalkersAnd;

  /// No description provided for @seasonalCampaignsHolidaytrendingCampaignsWithExtra.
  ///
  /// In en, this message translates to:
  /// **'Seasonal Campaigns – Holiday/trending campaigns with extra rewards.'**
  String get seasonalCampaignsHolidaytrendingCampaignsWithExtra;

  /// No description provided for @sendGiftsSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Send Gifts & Subscriptions'**
  String get sendGiftsSubscriptions;

  /// No description provided for @serviceRegions1.
  ///
  /// In en, this message translates to:
  /// **'Service Regions'**
  String get serviceRegions1;

  /// No description provided for @settlementOfExpensesAndProceeds.
  ///
  /// In en, this message translates to:
  /// **'Settlement of Expenses and Proceeds'**
  String get settlementOfExpensesAndProceeds;

  /// No description provided for @shopActivityEngagement.
  ///
  /// In en, this message translates to:
  /// **'Shop Activity & Engagement'**
  String get shopActivityEngagement;

  /// No description provided for @shoutoutsPromotionsFeaturedOnInfinitumTiktokInstag.
  ///
  /// In en, this message translates to:
  /// **'Shoutouts & Promotions – Featured on Infinitum TikTok, Instagram, and Facebook.'**
  String get shoutoutsPromotionsFeaturedOnInfinitumTiktokInstag;

  /// No description provided for @showedEmailInfoEmail.
  ///
  /// In en, this message translates to:
  /// **'Showed email info: \$email'**
  String get showedEmailInfoEmail;

  /// No description provided for @sinceOurEarliestBeginningsIn2023WeHaveProudlyBuilt.
  ///
  /// In en, this message translates to:
  /// **'Since our earliest beginnings in 2023, we have proudly built a strong reputation for identifying and nurturing top-tier talent, forging meaningful connections with essential industry partners. Our mission is to empower every aspiring star by equipping them with robust tools, targeted resources, and caring, personalized guidance—ensuring that each individual is fully supported in reaching their highest potential.'**
  String get sinceOurEarliestBeginningsIn2023WeHaveProudlyBuilt;

  /// No description provided for @socketexception.
  ///
  /// In en, this message translates to:
  /// **'SocketException'**
  String get socketexception;

  /// No description provided for @sourceOfEarnings.
  ///
  /// In en, this message translates to:
  /// **'Source of Earnings:'**
  String get sourceOfEarnings;

  /// No description provided for @specialAccessRedCarpetBeautyconFashionWeekAndOther.
  ///
  /// In en, this message translates to:
  /// **'Special Access – Red Carpet, BeautyCon, Fashion Week, and other TikTok events.'**
  String get specialAccessRedCarpetBeautyconFashionWeekAndOther;

  /// No description provided for @specialEventAccessEliteBigoLiveCreatorEvents.
  ///
  /// In en, this message translates to:
  /// **'Special Event Access: Elite Bigo LIVE creator events.'**
  String get specialEventAccessEliteBigoLiveCreatorEvents;

  /// No description provided for @specialEventAccessFavoritedLiveCreatorEvents.
  ///
  /// In en, this message translates to:
  /// **'Special Event Access: Favorited LIVE creator events.'**
  String get specialEventAccessFavoritedLiveCreatorEvents;

  /// No description provided for @speedNetworkingCollaborateWithInfinitumCreatorsAcr.
  ///
  /// In en, this message translates to:
  /// **'Speed Networking – Collaborate with Infinitum creators across regions.'**
  String get speedNetworkingCollaborateWithInfinitumCreatorsAcr;

  /// No description provided for @splashscreen.
  ///
  /// In en, this message translates to:
  /// **'SplashScreen'**
  String get splashscreen;

  /// No description provided for @statistics1.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics1;

  /// No description provided for @statisticsPreloadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Statistics preloaded successfully'**
  String get statisticsPreloadedSuccessfully;

  /// No description provided for @statisticsscreen.
  ///
  /// In en, this message translates to:
  /// **'StatisticsScreen'**
  String get statisticsscreen;

  /// No description provided for @stayCommittedJoiningOrEntertainingOffersFromOutsid.
  ///
  /// In en, this message translates to:
  /// **'Stay Committed: Joining or entertaining offers from outside agencies while under Infinitum LIVE violates your agreement and will jeopardize your future opportunities.'**
  String get stayCommittedJoiningOrEntertainingOffersFromOutsid;

  /// No description provided for @stayCommittedWorkingWithOtherAgenciesWhileUnderInf.
  ///
  /// In en, this message translates to:
  /// **'Stay Committed: Working with other agencies while under Infinitum is a violation of your agreement.'**
  String get stayCommittedWorkingWithOtherAgenciesWhileUnderInf;

  /// No description provided for @stayConnectedUseDiscordToCommunicateDirectlyWithYo.
  ///
  /// In en, this message translates to:
  /// **'Stay Connected: Use Discord to communicate directly with your assigned manager.'**
  String get stayConnectedUseDiscordToCommunicateDirectlyWithYo;

  /// No description provided for @stayConnectedUseYourIviewinfiniviewCardToIdentifyA.
  ///
  /// In en, this message translates to:
  /// **'Stay Connected: Use your iVIEW/InfiniVIEW card to identify and contact your assigned manager.'**
  String get stayConnectedUseYourIviewinfiniviewCardToIdentifyA;

  /// No description provided for @stayLoyalAcceptingOutsideOffersWhileContractedWith.
  ///
  /// In en, this message translates to:
  /// **'Stay Loyal: Accepting outside offers while contracted with Infinitum is prohibited and can affect future opportunities.'**
  String get stayLoyalAcceptingOutsideOffersWhileContractedWith;

  /// No description provided for @streamKeyAccessAvailableForQualifiedTiktokCreators.
  ///
  /// In en, this message translates to:
  /// **'Stream Key Access – Available for qualified TikTok creators.'**
  String get streamKeyAccessAvailableForQualifiedTiktokCreators;

  /// No description provided for @strictComplianceYouMustAdhereToTiktok.
  ///
  /// In en, this message translates to:
  /// **'Strict Compliance: You must adhere to TikTok\\'**
  String get strictComplianceYouMustAdhereToTiktok;

  /// No description provided for @strongBrandIdentityBuiltAroundTheInfinitumusNameIn.
  ///
  /// In en, this message translates to:
  /// **'Strong brand identity built around the Infinitum_US name, ♾️ infinity symbol, and focus on'**
  String get strongBrandIdentityBuiltAroundTheInfinitumusNameIn;

  /// No description provided for @strongBrandIdentityInfinitumusNameInfinitySymbolAn.
  ///
  /// In en, this message translates to:
  /// **'Strong brand identity – Infinitum_US name, ♾️ infinity symbol, and the'**
  String get strongBrandIdentityInfinitumusNameInfinitySymbolAn;

  /// No description provided for @successGuarantees.
  ///
  /// In en, this message translates to:
  /// **'Success & Guarantees'**
  String get successGuarantees;

  /// No description provided for @successfullyLaunchedUrlUrl.
  ///
  /// In en, this message translates to:
  /// **'Successfully launched URL: \$url'**
  String get successfullyLaunchedUrlUrl;

  /// No description provided for @successfullyLaunchedEmailEmail.
  ///
  /// In en, this message translates to:
  /// **'Successfully launched email: \$email'**
  String get successfullyLaunchedEmailEmail;

  /// No description provided for @successfullyLaunchedPhonePhonenumber.
  ///
  /// In en, this message translates to:
  /// **'Successfully launched phone: \$phoneNumber'**
  String get successfullyLaunchedPhonePhonenumber;

  /// No description provided for @supportCommunication.
  ///
  /// In en, this message translates to:
  /// **'Support & Communication'**
  String get supportCommunication;

  /// No description provided for @supportModeration.
  ///
  /// In en, this message translates to:
  /// **'Support & Moderation'**
  String get supportModeration;

  /// No description provided for @supportEmail.
  ///
  /// In en, this message translates to:
  /// **'Support Email'**
  String get supportEmail;

  /// No description provided for @talentAgreement1.
  ///
  /// In en, this message translates to:
  /// **'Talent Agreement'**
  String get talentAgreement1;

  /// No description provided for @talentAgreement2.
  ///
  /// In en, this message translates to:
  /// **'Talent Agreement:'**
  String get talentAgreement2;

  /// No description provided for @termsOfService1.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService1;

  /// No description provided for @theCreatorNetworkDoesNotTakeACutOrPercentageAnywhe.
  ///
  /// In en, this message translates to:
  /// **'The Creator Network does not take a cut or percentage anywhere. Creators always keep their full up to 53% from TikTok. All payouts are handled directly by TikTok.'**
  String get theCreatorNetworkDoesNotTakeACutOrPercentageAnywhe;

  /// No description provided for @theCreatorBroadcastsLiveOnTiktokAndInteractsWithTh.
  ///
  /// In en, this message translates to:
  /// **'The creator broadcasts live on TikTok and interacts with their audience in real-time.'**
  String get theCreatorBroadcastsLiveOnTiktokAndInteractsWithTh;

  /// No description provided for @theCreatorNetworkHostsEventsAndCampaignsWhereCreat.
  ///
  /// In en, this message translates to:
  /// **'The creator network hosts events and campaigns where creators can earn diamonds paid out by the Creator network. The creator network will never charge creators.'**
  String get theCreatorNetworkHostsEventsAndCampaignsWhereCreat;

  /// No description provided for @theCreatorReceivesUpTo53OfTheirTotalTiktokLiveEarn.
  ///
  /// In en, this message translates to:
  /// **'The creator receives up to 53% of their total TikTok LIVE earnings (diamonds, gifts, subs, etc.). TikTok retains the remaining percentage as their platform fee.'**
  String get theCreatorReceivesUpTo53OfTheirTotalTiktokLiveEarn;

  /// No description provided for @theNetwork.
  ///
  /// In en, this message translates to:
  /// **'The network\\'**
  String get theNetwork;

  /// No description provided for @themeMode1.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode1;

  /// No description provided for @themeLoadErrorE.
  ///
  /// In en, this message translates to:
  /// **'Theme load error: \$e'**
  String get themeLoadErrorE;

  /// No description provided for @themePreferencesInitializedWithSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'Theme preferences initialized with system default'**
  String get themePreferencesInitializedWithSystemDefault;

  /// No description provided for @themePreferencesNotInitializedReturningSystemDefau.
  ///
  /// In en, this message translates to:
  /// **'Theme preferences not initialized, returning system default'**
  String get themePreferencesNotInitializedReturningSystemDefau;

  /// No description provided for @themepreferencesservice.
  ///
  /// In en, this message translates to:
  /// **'ThemePreferencesService'**
  String get themepreferencesservice;

  /// No description provided for @theseResponsibilitiesAndOpportunitiesAreDesignedTo.
  ///
  /// In en, this message translates to:
  /// **'These responsibilities and opportunities are designed to empower you as a creator while ensuring the Infinitum LIVE Network remains professional, compliant, and high-performing. By meeting these standards, you protect your career, maximize your growth, and contribute to a thriving community of like-minded creators.'**
  String get theseResponsibilitiesAndOpportunitiesAreDesignedTo;

  /// No description provided for @thirdpartyAcknowledgments.
  ///
  /// In en, this message translates to:
  /// **'Third-Party Acknowledgments'**
  String get thirdpartyAcknowledgments;

  /// No description provided for @thisMakesInfinitumMoreThanJustATiktokAgencyitIsACo.
  ///
  /// In en, this message translates to:
  /// **'This makes Infinitum more than just a TikTok agency—it is a complete ecosystem built for creator success.'**
  String get thisMakesInfinitumMoreThanJustATiktokAgencyitIsACo;

  /// No description provided for @thisMakesInfinitumNotJustATiktokAgencyButAFullEcos.
  ///
  /// In en, this message translates to:
  /// **'This makes Infinitum not just a TikTok agency, but a full ecosystem for creator success.'**
  String get thisMakesInfinitumNotJustATiktokAgencyButAFullEcos;

  /// No description provided for @thisProcessCannotBeShortenedOrWaivedEvenInCasesOfS.
  ///
  /// In en, this message translates to:
  /// **'This process cannot be shortened or waived, even in cases of solicitation from another party. Creators are expected to complete the full 90-day requirement as outlined.'**
  String get thisProcessCannotBeShortenedOrWaivedEvenInCasesOfS;

  /// No description provided for @thumbnailTitleGuidanceImproveLiveClickthroughWithO.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail & Title Guidance – Improve LIVE click-through with optimized covers.'**
  String get thumbnailTitleGuidanceImproveLiveClickthroughWithO;

  /// No description provided for @tiktok.
  ///
  /// In en, this message translates to:
  /// **'TikTok'**
  String get tiktok;

  /// No description provided for @tiktokCreators1.
  ///
  /// In en, this message translates to:
  /// **'TikTok Creators'**
  String get tiktokCreators1;

  /// No description provided for @tiktokDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'TikTok Disclaimer:'**
  String get tiktokDisclaimer;

  /// No description provided for @tiktokHqVisitsInvitesToLosAngelesOrNewYorkHqForEli.
  ///
  /// In en, this message translates to:
  /// **'TikTok HQ Visits – Invites to Los Angeles or New York HQ for elite creators.'**
  String get tiktokHqVisitsInvitesToLosAngelesOrNewYorkHqForEli;

  /// No description provided for @tiktokLive.
  ///
  /// In en, this message translates to:
  /// **'TikTok LIVE'**
  String get tiktokLive;

  /// No description provided for @tiktokLiveUsaCanadaUnitedKingdomAustralia.
  ///
  /// In en, this message translates to:
  /// **'TikTok LIVE (USA, Canada, United Kingdom, Australia)'**
  String get tiktokLiveUsaCanadaUnitedKingdomAustralia;

  /// No description provided for @tiktokLiveUnitedStatesCanadaUnitedKingdomAustralia.
  ///
  /// In en, this message translates to:
  /// **'TikTok LIVE (United States, Canada, United Kingdom, Australia ONLY)'**
  String get tiktokLiveUnitedStatesCanadaUnitedKingdomAustralia;

  /// No description provided for @tiktokLiveCreatorNetworkPayModel.
  ///
  /// In en, this message translates to:
  /// **'TikTok LIVE Creator Network Pay Model'**
  String get tiktokLiveCreatorNetworkPayModel;

  /// No description provided for @tiktokLiveCreatorNetworkRequirements.
  ///
  /// In en, this message translates to:
  /// **'TikTok LIVE Creator Network Requirements:'**
  String get tiktokLiveCreatorNetworkRequirements;

  /// No description provided for @tiktokLiveStudioObsSupportStreamingSoftwareSetupAn.
  ///
  /// In en, this message translates to:
  /// **'TikTok LIVE Studio / OBS Support – Streaming software setup and troubleshooting.'**
  String get tiktokLiveStudioObsSupportStreamingSoftwareSetupAn;

  /// No description provided for @tiktokPartnership1.
  ///
  /// In en, this message translates to:
  /// **'TikTok Partnership'**
  String get tiktokPartnership1;

  /// No description provided for @tiktokShop.
  ///
  /// In en, this message translates to:
  /// **'TikTok Shop'**
  String get tiktokShop;

  /// No description provided for @tiktokShopUsaOnly.
  ///
  /// In en, this message translates to:
  /// **'TikTok Shop (USA Only)'**
  String get tiktokShopUsaOnly;

  /// No description provided for @tiktokShopAccess.
  ///
  /// In en, this message translates to:
  /// **'TikTok Shop Access:'**
  String get tiktokShopAccess;

  /// No description provided for @tiktokShopAgencyRequirements.
  ///
  /// In en, this message translates to:
  /// **'TikTok Shop Agency Requirements:'**
  String get tiktokShopAgencyRequirements;

  /// No description provided for @tiktokShopNotLinked.
  ///
  /// In en, this message translates to:
  /// **'TikTok Shop Not Linked:'**
  String get tiktokShopNotLinked;

  /// No description provided for @tiktokShopPartnerBenefits.
  ///
  /// In en, this message translates to:
  /// **'TikTok Shop Partner Benefits'**
  String get tiktokShopPartnerBenefits;

  /// No description provided for @tiktokTierGraduationSwagAndPromotionForMilestoneAc.
  ///
  /// In en, this message translates to:
  /// **'TikTok Tier Graduation – Swag and promotion for milestone achievements.'**
  String get tiktokTierGraduationSwagAndPromotionForMilestoneAc;

  /// No description provided for @tiktokCalculatesTheCreator.
  ///
  /// In en, this message translates to:
  /// **'TikTok calculates the creator\\'**
  String get tiktokCalculatesTheCreator;

  /// No description provided for @tiktokContentAnalyticsTools.
  ///
  /// In en, this message translates to:
  /// **'TikTok content & analytics tools'**
  String get tiktokContentAnalyticsTools;

  /// No description provided for @tiktokIsATrademarkOfTiktokIncAndorItsAffiliatesThe.
  ///
  /// In en, this message translates to:
  /// **'TikTok is a trademark of TikTok Inc. and/or its affiliates. The use of the TikTok name and branding in this application is done with explicit permission as an official third-party partner.'**
  String get tiktokIsATrademarkOfTiktokIncAndorItsAffiliatesThe;

  /// No description provided for @tiktokIsNotAPartyToTheseArrangementsAndWillNotMedi.
  ///
  /// In en, this message translates to:
  /// **'TikTok is not a party to these arrangements and will not mediate related disputes.'**
  String get tiktokIsNotAPartyToTheseArrangementsAndWillNotMedi;

  /// No description provided for @tiktokIsNotResponsibleForDisputesBetweenCreatorsAn.
  ///
  /// In en, this message translates to:
  /// **'TikTok is not responsible for disputes between creators and agencies and will not intervene.'**
  String get tiktokIsNotResponsibleForDisputesBetweenCreatorsAn;

  /// No description provided for @tiktokMaySharePerformanceMetricsAccountProfileDeta.
  ///
  /// In en, this message translates to:
  /// **'TikTok may share performance metrics, account profile details, LIVE data, and other relevant information with Infinitum for the purpose of network management.'**
  String get tiktokMaySharePerformanceMetricsAccountProfileDeta;

  /// No description provided for @tiktokScalableRewards.
  ///
  /// In en, this message translates to:
  /// **'TikTok scalable rewards'**
  String get tiktokScalableRewards;

  /// No description provided for @tiktok1.
  ///
  /// In en, this message translates to:
  /// **'TikTok\\'**
  String get tiktok1;

  /// No description provided for @timeManagementSupportBalanceTiktokContentWithPerso.
  ///
  /// In en, this message translates to:
  /// **'Time Management Support – Balance TikTok content with personal life.'**
  String get timeManagementSupportBalanceTiktokContentWithPerso;

  /// No description provided for @timeoffSubmissionsProtectedLeaveViaIviewToAvoidPen.
  ///
  /// In en, this message translates to:
  /// **'Time-Off Submissions – Protected leave via iView to avoid penalties.'**
  String get timeoffSubmissionsProtectedLeaveViaIviewToAvoidPen;

  /// No description provided for @today1.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today1;

  /// No description provided for @topEarningPotential100OfYourEarnings.
  ///
  /// In en, this message translates to:
  /// **'Top earning potential (100% of your earnings).'**
  String get topEarningPotential100OfYourEarnings;

  /// No description provided for @totalTiktokCreators.
  ///
  /// In en, this message translates to:
  /// **'Total TikTok Creators'**
  String get totalTiktokCreators;

  /// No description provided for @tournamentsIncentiveProgramsAndTiktokHqOpportuniti.
  ///
  /// In en, this message translates to:
  /// **'Tournaments, incentive programs, and TikTok HQ opportunities.'**
  String get tournamentsIncentiveProgramsAndTiktokHqOpportuniti;

  /// No description provided for @trackYourGrowthUseInfinitumToolsToReviewSalesProgr.
  ///
  /// In en, this message translates to:
  /// **'Track Your Growth: Use Infinitum tools to review sales progress and identify improvement areas.'**
  String get trackYourGrowthUseInfinitumToolsToReviewSalesProgr;

  /// No description provided for @transferOfRelationshipsTransfersBetweenContractors.
  ///
  /// In en, this message translates to:
  /// **'Transfer of Relationships: Transfers between contractors are subject to TikTok\\'**
  String get transferOfRelationshipsTransfersBetweenContractors;

  /// No description provided for @usbasedCreator.
  ///
  /// In en, this message translates to:
  /// **'US-based creator'**
  String get usbasedCreator;

  /// No description provided for @unauthorizedDistributionScreenshotsRecordingsOrSha.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized distribution, screenshots, recordings, or sharing of this information is prohibited.'**
  String get unauthorizedDistributionScreenshotsRecordingsOrSha;

  /// No description provided for @understandYourResponsibilitiesAndExpectationsAsACr.
  ///
  /// In en, this message translates to:
  /// **'Understand your responsibilities and expectations as a creator'**
  String get understandYourResponsibilitiesAndExpectationsAsACr;

  /// No description provided for @uniquePositioningAs.
  ///
  /// In en, this message translates to:
  /// **'Unique positioning as'**
  String get uniquePositioningAs;

  /// No description provided for @unitedKingdom.
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get unitedKingdom;

  /// No description provided for @unitedStatesOfAmerica.
  ///
  /// In en, this message translates to:
  /// **'United States of America'**
  String get unitedStatesOfAmerica;

  /// No description provided for @universalAcrossAllPlatforms.
  ///
  /// In en, this message translates to:
  /// **'Universal Across All Platforms'**
  String get universalAcrossAllPlatforms;

  /// No description provided for @unknownPlatformSkippingAdmobInitialization.
  ///
  /// In en, this message translates to:
  /// **'Unknown platform, skipping AdMob initialization'**
  String get unknownPlatformSkippingAdmobInitialization;

  /// No description provided for @unlikeOtherAgenciesInfinitumStandsOutBecauseOfItsT.
  ///
  /// In en, this message translates to:
  /// **'Unlike other agencies, Infinitum stands out because of its transparent, free, and creator-led approach. Any qualified TikTok LIVE creator can apply, join for free, and instantly unlock:'**
  String get unlikeOtherAgenciesInfinitumStandsOutBecauseOfItsT;

  /// No description provided for @untitled.
  ///
  /// In en, this message translates to:
  /// **'Untitled'**
  String get untitled;

  /// No description provided for @upTo53OfTotalLiveValue.
  ///
  /// In en, this message translates to:
  /// **'Up to 53% of total LIVE value'**
  String get upTo53OfTotalLiveValue;

  /// No description provided for @urllauncherutil.
  ///
  /// In en, this message translates to:
  /// **'UrlLauncherUtil'**
  String get urllauncherutil;

  /// No description provided for @validLiveHoursAndStreamingDays.
  ///
  /// In en, this message translates to:
  /// **'Valid LIVE hours and streaming days'**
  String get validLiveHoursAndStreamingDays;

  /// No description provided for @validSessionsEachLiveMustLastAMinimumOf1Continuous.
  ///
  /// In en, this message translates to:
  /// **'Valid Sessions: Each LIVE must last a minimum of 1 continuous hour. Resetting or cutting sessions short before the 1-hour mark does not count.'**
  String get validSessionsEachLiveMustLastAMinimumOf1Continuous;

  /// No description provided for @validHoursCreatorVolumeEngagement.
  ///
  /// In en, this message translates to:
  /// **'Valid hours, creator volume, engagement'**
  String get validHoursCreatorVolumeEngagement;

  /// No description provided for @variesByNetworkAgreement.
  ///
  /// In en, this message translates to:
  /// **'Varies by network agreement'**
  String get variesByNetworkAgreement;

  /// No description provided for @version1.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version1;

  /// No description provided for @versionmanager.
  ///
  /// In en, this message translates to:
  /// **'VersionManager'**
  String get versionmanager;

  /// No description provided for @videoCallsTrainingSchedulePrivateCoachingSessionsW.
  ///
  /// In en, this message translates to:
  /// **'Video Calls & Training – Schedule private coaching sessions with your TikTok LIVE manager.'**
  String get videoCallsTrainingSchedulePrivateCoachingSessionsW;

  /// No description provided for @viewRequirementsForJoiningDifferentInfinitumProgra.
  ///
  /// In en, this message translates to:
  /// **'View requirements for joining different Infinitum programs'**
  String get viewRequirementsForJoiningDifferentInfinitumProgra;

  /// No description provided for @viewerEngagementStrategies.
  ///
  /// In en, this message translates to:
  /// **'Viewer Engagement Strategies'**
  String get viewerEngagementStrategies;

  /// No description provided for @viewerRetentionTechniques.
  ///
  /// In en, this message translates to:
  /// **'Viewer Retention Techniques'**
  String get viewerRetentionTechniques;

  /// No description provided for @viewers.
  ///
  /// In en, this message translates to:
  /// **'Viewers'**
  String get viewers;

  /// No description provided for @viewersSendVirtualGiftsAndSubscriptionsWhichConver.
  ///
  /// In en, this message translates to:
  /// **'Viewers send virtual gifts and subscriptions, which convert into TikTok Diamonds (the in-app currency).'**
  String get viewersSendVirtualGiftsAndSubscriptionsWhichConver;

  /// No description provided for @violationBanAppealsGuidanceAndSupportWithFalseFlag.
  ///
  /// In en, this message translates to:
  /// **'Violation & Ban Appeals – Guidance and support with false flags or LIVE bans.'**
  String get violationBanAppealsGuidanceAndSupportWithFalseFlag;

  /// No description provided for @violationAppeals.
  ///
  /// In en, this message translates to:
  /// **'Violation Appeals:'**
  String get violationAppeals;

  /// No description provided for @visitBigoHqStrategySessionsForTopCreators.
  ///
  /// In en, this message translates to:
  /// **'Visit Bigo HQ: Strategy sessions for top creators.'**
  String get visitBigoHqStrategySessionsForTopCreators;

  /// No description provided for @visitFavoritedHqEliteStrategySessionsAndWorkshops.
  ///
  /// In en, this message translates to:
  /// **'Visit Favorited HQ: Elite strategy sessions and workshops.'**
  String get visitFavoritedHqEliteStrategySessionsAndWorkshops;

  /// No description provided for @visualEarningsFlow.
  ///
  /// In en, this message translates to:
  /// **'Visual Earnings Flow'**
  String get visualEarningsFlow;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'WARNING'**
  String get warning;

  /// No description provided for @weOfferServicesToTheFollowingWhichYouCanViewBySect.
  ///
  /// In en, this message translates to:
  /// **'We offer services to the following which you can view by section:'**
  String get weOfferServicesToTheFollowingWhichYouCanViewBySect;

  /// No description provided for @weProudlySupportCreatorsAcrossMultiplePlatforms.
  ///
  /// In en, this message translates to:
  /// **'We proudly support creators across multiple platforms:'**
  String get weProudlySupportCreatorsAcrossMultiplePlatforms;

  /// No description provided for @weProvideCoachingStrategicGuidanceAccountSupportAn.
  ///
  /// In en, this message translates to:
  /// **'We provide coaching, strategic guidance, account support, and exclusive campaigns to help creators grow faster, earn more, and unlock opportunities like TikTok HQ visits, red carpet events, and agency-only bonuses.'**
  String get weProvideCoachingStrategicGuidanceAccountSupportAn;

  /// No description provided for @webPage.
  ///
  /// In en, this message translates to:
  /// **'Web Page'**
  String get webPage;

  /// No description provided for @webPreviewAccessLimitedAccessForNonmembers.
  ///
  /// In en, this message translates to:
  /// **'Web Preview Access – Limited access for non-members.'**
  String get webPreviewAccessLimitedAccessForNonmembers;

  /// No description provided for @webviewscreen.
  ///
  /// In en, this message translates to:
  /// **'WebViewScreen'**
  String get webviewscreen;

  /// No description provided for @website1.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website1;

  /// No description provided for @weeklyRewardsCnRankingsLiveMatchesAndBattleOpportu.
  ///
  /// In en, this message translates to:
  /// **'Weekly Rewards – CN rankings, LIVE matches, and battle opportunities.'**
  String get weeklyRewardsCnRankingsLiveMatchesAndBattleOpportu;

  /// No description provided for @welcomeToInfinitumLiveCreatorNetworkAProfessionalS.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Infinitum LIVE Creator Network — a professional, supportive, and high-performing community built for ambitious creators.'**
  String get welcomeToInfinitumLiveCreatorNetworkAProfessionalS;

  /// No description provided for @welcomeToInfinitum.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Infinitum'**
  String get welcomeToInfinitum;

  /// No description provided for @termsAcceptanceDescription.
  ///
  /// In en, this message translates to:
  /// **'Please review and accept our Terms of Service and Privacy Policy to continue using the app.'**
  String get termsAcceptanceDescription;

  /// No description provided for @acceptAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Accept and Continue'**
  String get acceptAndContinue;

  /// No description provided for @iAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get iAgreeTo;

  /// No description provided for @viewTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'View Terms'**
  String get viewTermsOfService;

  /// No description provided for @viewPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'View Privacy Policy'**
  String get viewPrivacyPolicy;

  /// No description provided for @couldNotOpenUrl.
  ///
  /// In en, this message translates to:
  /// **'Could not open URL'**
  String get couldNotOpenUrl;

  /// No description provided for @whatIsYourRole1.
  ///
  /// In en, this message translates to:
  /// **'What Is Your Role'**
  String get whatIsYourRole1;

  /// No description provided for @whatWeDoNotDo1.
  ///
  /// In en, this message translates to:
  /// **'What We DO NOT Do'**
  String get whatWeDoNotDo1;

  /// No description provided for @whatWeDo1.
  ///
  /// In en, this message translates to:
  /// **'What We Do'**
  String get whatWeDo1;

  /// No description provided for @whatWeDoNotDo2.
  ///
  /// In en, this message translates to:
  /// **'What We Do NOT Do'**
  String get whatWeDoNotDo2;

  /// No description provided for @whatWeDoNotDoInBlackAndWhite.
  ///
  /// In en, this message translates to:
  /// **'What We Do NOT Do – In Black and White.'**
  String get whatWeDoNotDoInBlackAndWhite;

  /// No description provided for @whatIsATiktokLiveCreatorNetwork.
  ///
  /// In en, this message translates to:
  /// **'What is a TikTok LIVE Creator Network?'**
  String get whatIsATiktokLiveCreatorNetwork;

  /// No description provided for @whatMakesInfinitumDifferentFromOtherTiktokAgencies.
  ///
  /// In en, this message translates to:
  /// **'What makes Infinitum different from other TikTok agencies?'**
  String get whatMakesInfinitumDifferentFromOtherTiktokAgencies;

  /// No description provided for @whenSearchingForTiktokLiveAgencyUsaOrBestTiktokCre.
  ///
  /// In en, this message translates to:
  /// **'When searching for TikTok LIVE Agency USA or best TikTok creator network, Infinitum consistently appears because of:'**
  String get whenSearchingForTiktokLiveAgencyUsaOrBestTiktokCre;

  /// No description provided for @whenSearchingForTiktokLiveAgencyUsaTiktokLiveCreat.
  ///
  /// In en, this message translates to:
  /// **'When searching for TikTok LIVE Agency USA, TikTok LIVE Creator Network, or Best TikTok Agency, Infinitum consistently ranks at the top thanks to:'**
  String get whenSearchingForTiktokLiveAgencyUsaTiktokLiveCreat;

  /// No description provided for @whileOtherAgenciesAreAlsoRespectedInTheUsInfinitum.
  ///
  /// In en, this message translates to:
  /// **'While other agencies are also respected in the U.S., Infinitum consistently ranks high because of its transparent, free, and creator-led approach.'**
  String get whileOtherAgenciesAreAlsoRespectedInTheUsInfinitum;

  /// No description provided for @whyChooseInfinitum1.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Infinitum?'**
  String get whyChooseInfinitum1;

  /// No description provided for @whyCreatorsChooseInfinitum.
  ///
  /// In en, this message translates to:
  /// **'Why Creators Choose Infinitum'**
  String get whyCreatorsChooseInfinitum;

  /// No description provided for @whyInfinitumDominates1.
  ///
  /// In en, this message translates to:
  /// **'Why Infinitum Dominates'**
  String get whyInfinitumDominates1;

  /// No description provided for @whyInfinitumDominatesTiktokLiveSeo.
  ///
  /// In en, this message translates to:
  /// **'Why Infinitum Dominates TikTok LIVE SEO'**
  String get whyInfinitumDominatesTiktokLiveSeo;

  /// No description provided for @willingToLearnAboutTiktokShopAffilateAsACareer.
  ///
  /// In en, this message translates to:
  /// **'Willing to learn about TikTok Shop affilate as a career'**
  String get willingToLearnAboutTiktokShopAffilateAsACareer;

  /// No description provided for @willingToLearnAboutLiveStreamingAsACareer.
  ///
  /// In en, this message translates to:
  /// **'Willing to learn about live streaming as a career'**
  String get willingToLearnAboutLiveStreamingAsACareer;

  /// No description provided for @withdrawalRemovalPolicy.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal & Removal Policy'**
  String get withdrawalRemovalPolicy;

  /// No description provided for @yesterday1.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday1;

  /// No description provided for @youHaveToPutInTheWorkToMakeThisWork.
  ///
  /// In en, this message translates to:
  /// **'You Have to Put in the Work to Make This Work!'**
  String get youHaveToPutInTheWorkToMakeThisWork;

  /// No description provided for @youCanApplyDirectlyThroughOurOfficialOurWebsiteOrW.
  ///
  /// In en, this message translates to:
  /// **'You can apply directly through our official our website or with an Infinitum manager. Creators from the USA, Canada, UK, Australia, and New Zealand are eligible.'**
  String get youCanApplyDirectlyThroughOurOfficialOurWebsiteOrW;

  /// No description provided for @youtube.
  ///
  /// In en, this message translates to:
  /// **'YouTube'**
  String get youtube;

  /// No description provided for @yourManagerMattersFavoritedManagersAreAvailableToH.
  ///
  /// In en, this message translates to:
  /// **'Your Manager Matters: Favorited managers are available to help with questions and account issues.'**
  String get yourManagerMattersFavoritedManagersAreAvailableToH;

  /// No description provided for @yourPremierDestinationForLiveTalent.
  ///
  /// In en, this message translates to:
  /// **'Your Premier Destination for LIVE Talent'**
  String get yourPremierDestinationForLiveTalent;

  /// No description provided for @zeroToleranceSevereOrRepeatedViolationsMayResultIn.
  ///
  /// In en, this message translates to:
  /// **'Zero Tolerance: Severe or repeated violations may result in suspension or removal from the network.'**
  String get zeroToleranceSevereOrRepeatedViolationsMayResultIn;

  /// No description provided for @internationalRegionalLiveMatches.
  ///
  /// In en, this message translates to:
  /// **'🌍 International & Regional LIVE Matches'**
  String get internationalRegionalLiveMatches;

  /// No description provided for @earlyAccessSpecialPerks.
  ///
  /// In en, this message translates to:
  /// **'🌟 Early Access & Special Perks'**
  String get earlyAccessSpecialPerks;

  /// No description provided for @exclusiveTiktokEventInvitations.
  ///
  /// In en, this message translates to:
  /// **'🎉 Exclusive TikTok Event Invitations'**
  String get exclusiveTiktokEventInvitations;

  /// No description provided for @tiktokContentSupportOptimization.
  ///
  /// In en, this message translates to:
  /// **'🎨 TikTok Content Support & Optimization'**
  String get tiktokContentSupportOptimization;

  /// No description provided for @optionalBenefits.
  ///
  /// In en, this message translates to:
  /// **'🏆 Optional Benefits'**
  String get optionalBenefits;

  /// No description provided for @communityGroupBenefits.
  ///
  /// In en, this message translates to:
  /// **'👥 Community & Group Benefits'**
  String get communityGroupBenefits;

  /// No description provided for @string.
  ///
  /// In en, this message translates to:
  /// **'👨‍💼'**
  String get string;

  /// No description provided for @exclusiveTiktokCampaignAccess.
  ///
  /// In en, this message translates to:
  /// **'💎 Exclusive TikTok Campaign Access'**
  String get exclusiveTiktokCampaignAccess;

  /// No description provided for @additionalEarningOpportunities.
  ///
  /// In en, this message translates to:
  /// **'💰 Additional Earning Opportunities'**
  String get additionalEarningOpportunities;

  /// No description provided for @analyticsPerformanceTracking.
  ///
  /// In en, this message translates to:
  /// **'📊 Analytics & Performance Tracking'**
  String get analyticsPerformanceTracking;

  /// No description provided for @exclusiveInfinitumCreatorTools.
  ///
  /// In en, this message translates to:
  /// **'📱 Exclusive Infinitum Creator Tools'**
  String get exclusiveInfinitumCreatorTools;

  /// No description provided for @accountSafetySupport.
  ///
  /// In en, this message translates to:
  /// **'🔐 Account & Safety Support'**
  String get accountSafetySupport;

  /// No description provided for @technicalStreamingSupport.
  ///
  /// In en, this message translates to:
  /// **'🛠️ Technical & Streaming Support'**
  String get technicalStreamingSupport;

  /// No description provided for @coachingStrategicGuidance.
  ///
  /// In en, this message translates to:
  /// **'🧑‍🏫 Coaching & Strategic Guidance'**
  String get coachingStrategicGuidance;

  /// No description provided for @creatorWellnessSupport.
  ///
  /// In en, this message translates to:
  /// **'🧘 Creator Wellness & Support'**
  String get creatorWellnessSupport;

  /// No description provided for @failedToLoadPage.
  ///
  /// In en, this message translates to:
  /// **'Failed to Load Page'**
  String get failedToLoadPage;

  /// No description provided for @loadingProgress.
  ///
  /// In en, this message translates to:
  /// **'Loading... {progress}%'**
  String loadingProgress(int progress);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'af',
        'ain',
        'ak',
        'am',
        'ar',
        'arc',
        'as',
        'ay',
        'az',
        'ban',
        'bcl',
        'bg',
        'bho',
        'bi',
        'bm',
        'bn',
        'bo',
        'brh',
        'bs',
        'ca',
        'ceb',
        'ch',
        'chk',
        'cho',
        'chy',
        'cr',
        'cs',
        'cy',
        'da',
        'de',
        'dz',
        'el',
        'en',
        'es',
        'et',
        'fa',
        'ff',
        'fi',
        'fil',
        'fj',
        'fr',
        'ga',
        'gd',
        'gl',
        'gu',
        'hak',
        'haw',
        'he',
        'hi',
        'hmn',
        'ho',
        'hr',
        'ht',
        'hu',
        'hy',
        'iba',
        'id',
        'ig',
        'ilo',
        'is',
        'it',
        'iu',
        'ium',
        'ja',
        'jv',
        'ka',
        'kar',
        'kk',
        'km',
        'kn',
        'ko',
        'ks',
        'ku',
        'la',
        'lb',
        'lg',
        'lo',
        'lt',
        'luo',
        'lv',
        'mh',
        'mi',
        'mk',
        'ml',
        'mn',
        'mr',
        'mrw',
        'ms',
        'mt',
        'my',
        'myn',
        'na',
        'nah',
        'nan',
        'ne',
        'niu',
        'nl',
        'no',
        'nv',
        'ny',
        'oj',
        'pa',
        'pag',
        'pam',
        'pap',
        'pl',
        'prs',
        'pt',
        'qu',
        'rap',
        'rn',
        'ro',
        'ru',
        'rw',
        'sa',
        'sd',
        'si',
        'sk',
        'sl',
        'sm',
        'sn',
        'so',
        'sq',
        'sr',
        'sv',
        'sw',
        'ta',
        'tay',
        'te',
        'tet',
        'th',
        'ti',
        'tk',
        'tkl',
        'tl',
        'tn',
        'to',
        'tpi',
        'tr',
        'tsg',
        'ty',
        'ug',
        'uk',
        'ur',
        'uz',
        'vi',
        'war',
        'wuu',
        'xh',
        'yap',
        'yi',
        'yo',
        'yue',
        'zap',
        'zh',
        'zu'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsZhCn();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'ain':
      return AppLocalizationsAin();
    case 'ak':
      return AppLocalizationsAk();
    case 'am':
      return AppLocalizationsAm();
    case 'ar':
      return AppLocalizationsAr();
    case 'arc':
      return AppLocalizationsArc();
    case 'as':
      return AppLocalizationsAs();
    case 'ay':
      return AppLocalizationsAy();
    case 'az':
      return AppLocalizationsAz();
    case 'ban':
      return AppLocalizationsBan();
    case 'bcl':
      return AppLocalizationsBcl();
    case 'bg':
      return AppLocalizationsBg();
    case 'bho':
      return AppLocalizationsBho();
    case 'bi':
      return AppLocalizationsBi();
    case 'bm':
      return AppLocalizationsBm();
    case 'bn':
      return AppLocalizationsBn();
    case 'bo':
      return AppLocalizationsBo();
    case 'brh':
      return AppLocalizationsBrh();
    case 'bs':
      return AppLocalizationsBs();
    case 'ca':
      return AppLocalizationsCa();
    case 'ceb':
      return AppLocalizationsCeb();
    case 'ch':
      return AppLocalizationsCh();
    case 'chk':
      return AppLocalizationsChk();
    case 'cho':
      return AppLocalizationsCho();
    case 'chy':
      return AppLocalizationsChy();
    case 'cr':
      return AppLocalizationsCr();
    case 'cs':
      return AppLocalizationsCs();
    case 'cy':
      return AppLocalizationsCy();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'dz':
      return AppLocalizationsDz();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'fa':
      return AppLocalizationsFa();
    case 'ff':
      return AppLocalizationsFf();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fj':
      return AppLocalizationsFj();
    case 'fr':
      return AppLocalizationsFr();
    case 'ga':
      return AppLocalizationsGa();
    case 'gd':
      return AppLocalizationsGd();
    case 'gl':
      return AppLocalizationsGl();
    case 'gu':
      return AppLocalizationsGu();
    case 'hak':
      return AppLocalizationsHak();
    case 'haw':
      return AppLocalizationsHaw();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hmn':
      return AppLocalizationsHmn();
    case 'ho':
      return AppLocalizationsHo();
    case 'hr':
      return AppLocalizationsHr();
    case 'ht':
      return AppLocalizationsHt();
    case 'hu':
      return AppLocalizationsHu();
    case 'hy':
      return AppLocalizationsHy();
    case 'iba':
      return AppLocalizationsIba();
    case 'id':
      return AppLocalizationsId();
    case 'ig':
      return AppLocalizationsIg();
    case 'ilo':
      return AppLocalizationsIlo();
    case 'is':
      return AppLocalizationsIs();
    case 'it':
      return AppLocalizationsIt();
    case 'iu':
      return AppLocalizationsIu();
    case 'ium':
      return AppLocalizationsIum();
    case 'ja':
      return AppLocalizationsJa();
    case 'jv':
      return AppLocalizationsJv();
    case 'ka':
      return AppLocalizationsKa();
    case 'kar':
      return AppLocalizationsKar();
    case 'kk':
      return AppLocalizationsKk();
    case 'km':
      return AppLocalizationsKm();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ks':
      return AppLocalizationsKs();
    case 'ku':
      return AppLocalizationsKu();
    case 'la':
      return AppLocalizationsLa();
    case 'lb':
      return AppLocalizationsLb();
    case 'lg':
      return AppLocalizationsLg();
    case 'lo':
      return AppLocalizationsLo();
    case 'lt':
      return AppLocalizationsLt();
    case 'luo':
      return AppLocalizationsLuo();
    case 'lv':
      return AppLocalizationsLv();
    case 'mh':
      return AppLocalizationsMh();
    case 'mi':
      return AppLocalizationsMi();
    case 'mk':
      return AppLocalizationsMk();
    case 'ml':
      return AppLocalizationsMl();
    case 'mn':
      return AppLocalizationsMn();
    case 'mr':
      return AppLocalizationsMr();
    case 'mrw':
      return AppLocalizationsMrw();
    case 'ms':
      return AppLocalizationsMs();
    case 'mt':
      return AppLocalizationsMt();
    case 'my':
      return AppLocalizationsMy();
    case 'myn':
      return AppLocalizationsMyn();
    case 'na':
      return AppLocalizationsNa();
    case 'nah':
      return AppLocalizationsNah();
    case 'nan':
      return AppLocalizationsNan();
    case 'ne':
      return AppLocalizationsNe();
    case 'niu':
      return AppLocalizationsNiu();
    case 'nl':
      return AppLocalizationsNl();
    case 'no':
      return AppLocalizationsNo();
    case 'nv':
      return AppLocalizationsNv();
    case 'ny':
      return AppLocalizationsNy();
    case 'oj':
      return AppLocalizationsOj();
    case 'pa':
      return AppLocalizationsPa();
    case 'pag':
      return AppLocalizationsPag();
    case 'pam':
      return AppLocalizationsPam();
    case 'pap':
      return AppLocalizationsPap();
    case 'pl':
      return AppLocalizationsPl();
    case 'prs':
      return AppLocalizationsPrs();
    case 'pt':
      return AppLocalizationsPt();
    case 'qu':
      return AppLocalizationsQu();
    case 'rap':
      return AppLocalizationsRap();
    case 'rn':
      return AppLocalizationsRn();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'rw':
      return AppLocalizationsRw();
    case 'sa':
      return AppLocalizationsSa();
    case 'sd':
      return AppLocalizationsSd();
    case 'si':
      return AppLocalizationsSi();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sm':
      return AppLocalizationsSm();
    case 'sn':
      return AppLocalizationsSn();
    case 'so':
      return AppLocalizationsSo();
    case 'sq':
      return AppLocalizationsSq();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'tay':
      return AppLocalizationsTay();
    case 'te':
      return AppLocalizationsTe();
    case 'tet':
      return AppLocalizationsTet();
    case 'th':
      return AppLocalizationsTh();
    case 'ti':
      return AppLocalizationsTi();
    case 'tk':
      return AppLocalizationsTk();
    case 'tkl':
      return AppLocalizationsTkl();
    case 'tl':
      return AppLocalizationsTl();
    case 'tn':
      return AppLocalizationsTn();
    case 'to':
      return AppLocalizationsTo();
    case 'tpi':
      return AppLocalizationsTpi();
    case 'tr':
      return AppLocalizationsTr();
    case 'tsg':
      return AppLocalizationsTsg();
    case 'ty':
      return AppLocalizationsTy();
    case 'ug':
      return AppLocalizationsUg();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'uz':
      return AppLocalizationsUz();
    case 'vi':
      return AppLocalizationsVi();
    case 'war':
      return AppLocalizationsWar();
    case 'wuu':
      return AppLocalizationsWuu();
    case 'xh':
      return AppLocalizationsXh();
    case 'yap':
      return AppLocalizationsYap();
    case 'yi':
      return AppLocalizationsYi();
    case 'yo':
      return AppLocalizationsYo();
    case 'yue':
      return AppLocalizationsYue();
    case 'zap':
      return AppLocalizationsZap();
    case 'zh':
      return AppLocalizationsZh();
    case 'zu':
      return AppLocalizationsZu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
