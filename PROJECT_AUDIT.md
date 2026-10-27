<!--
Filename: PROJECT_AUDIT.md
Purpose: Source-code audit of the Infinitum LIVE Creator Network public hub app.
Author: Kevin Doyle Jr. / Infinitum Imagery LLC
Last Modified: 2026-10-27
Dependencies: Local Flutter tree (excludes build/, .dart_tool/, ios/Pods)
Platform Compatibility: Markdown viewers
-->

# Infinitum LIVE Creator Network App — Project Audit

**2026-10-27 adaptive UI + store readiness (local):** Hub chrome is platform-native: Cupertino tab bar on iOS, Material 3 navigation on Android, rail + max-width content on wide web. Surfaces, scroll physics, and page transitions follow the same split. App information includes **Built by Infinitum Pittsburgh**. Unused camera/location/contacts/mic/Bluetooth plist and Android permissions removed. PrivacyInfo.xcprivacy added (AdMob tracking + UserDefaults). Info.plist no longer claims the app collects no data while AdMob/ATT exist. Banner ad frames hide on web so empty grey bars do not show. Pay Explained garbled emoji replaced with icons. Listing copy: `Documentation/STORE_LISTING_1.0.1.md`. No Firebase Hosting project in this repo. Store ship still operator-owned. Chrome hub verified 2026-10-27: Home/Join/Network/InfiniView/About, What We Do, App Information Pittsburgh line.

**2026-10-27 benefits copy + version 1.0.1 Build 1 (local):** About benefits screens (What we do, What is your role, What we do not do, Talent agreement, Requirements) now match current public apply pages and InfiniView onboarding. TikTok LIVE apply floor is 8 valid days / 20 hours (D.I.P. still 12/25+). Favorited requires under \$1,000 already earned and no existing Favorited agency. Broken emoji encoding removed. App version is **1.0.1+1** (Version 1.0.1 Build 1). Store binaries remain operator-owned.

**2026-10-27 InfiniView tab + About tab (local):** InfiniView tab is a branded destination with **Get InfiniView for iOS** (not iPhone-only), Android/web CTAs, and both **this month** and **lifetime** public stats. About is a fifth tab with current company/benefits/legal copy. Settings cog is back in the top right on every tab. Onboarding links go to InfiniView (`view.infinitumlive.com` / InfiniView tab), not `infinitum-onboarding.web.app`.

**2026-10-27 Chrome white screen (local):** `web/index.html` used deprecated `flutter.js` plus a 5-second overlay hide that set `body` transparent before Flutter 3.47 could paint. Boot now uses generated `flutter_bootstrap.js` and keeps the HTML splash until `flutter-first-frame`. Requires a full `flutter run` restart (hot reload does not copy `index.html`).

**2026-10-27 compatible packages + compile notes (local):** `flutter pub upgrade` within existing constraints; unused `flutter_svg` and `cached_network_image` removed. Left on current majors: `google_mobile_ads` 5.x (not 9), `flutter_lints` 3.x (not 6), `package_info_plus` 9.x (not 10), `shimmer` 3.x (not 4), `cupertino_icons` 1.x (not 2), `flutter_launcher_icons` 0.13 (not 0.14). First Chrome compile failed on synthetic `package:flutter_gen` after Flutter 3.47; l10n now generates into `lib/l10n/generated/` and that import is gone. Untranslated hub strings (36 keys, English-only) are written to `.dart_tool/untranslated_messages.json` instead of flooding `flutter run`. Analyze: 0 errors/warnings, infos only (`withOpacity`, prefer_const, BuildContext). Chrome hub compile succeeds.

**2026-10-27 public hub overhaul (local source):** The store-listed Flutter app is now a no-account public hub with four tabs (Home, Join, Network, InfiniView). Home presents three jobs: join the network, serve people already on it, and send both groups into InfiniView. Announcements read InfiniCore `GET /public/announcements` with GitHub JSON as last-resort fallback. Stats read InfiniView `GET /public/network-stats`. Legacy `TTCreatorAMT.json` is no longer used. Tools/links use InfiniView Resources canonical URLs. About/legal/benefits moved to a Home overflow. No InfiniView login, Firebase, or new InfiniCore/View routes. Store binaries remain operator-owned. Version at that overhaul was later set to **1.0.1+1**. Chrome/live public API verification is recorded in the same change; iOS ATT/AdMob and store listing remain **Unverified**.

| Field | Value |
|-------|--------|
| **Audit date** | 2026-10-27 |
| **Last update date** | **2026-10-27** adaptive UI + store readiness + Built by Infinitum Pittsburgh. Prior: benefits screens + version **1.0.1+1**. Prior: InfiniView tab stats/UI, About tab, settings cog, InfiniView onboarding link. Prior: Chrome white-screen bootstrap fix. Prior: compatible package upgrade + unused dep removal + l10n generate-dir. Prior: hub overhaul (local source). Prior: checkout relocated into this workspace with no project audit. |
| **Package** | `infinitum_live_creator_network` `1.0.1+1` (`pubspec.yaml`) |
| **Owner** | Kevin Doyle Jr. / Infinitum Imagery LLC |
| **Origin** | `https://github.com/jrftw/InfinitumLIVECreatorNetworkApp.git` (separate from InfiniView) |
| **Store** | iOS App Store id `6755161753` (operator-owned binary) |
| **Reviewed scope** | `pubspec.yaml`, `pubspec.lock`, `l10n.yaml`, `lib/` screens/services/models/theme, `PROJECT_AUDIT.md` (this file) |
| **Excluded** | `build/`, `.dart_tool/`, `ios/Pods`, generated l10n output, secret values |

**Evidence labels:** **Confirmed** (local source) | **Unverified** (runtime/store)

---

## 1. Purpose (Confirmed)

Public, no-login Flutter hub so people who search Infinitum LIVE can find the network. It is **not** InfiniView.

Jobs:

1. Help creators **join** (website apply). Onboarding is inside InfiniView.
2. Help people **already on the network** (live stats, InfiniCore announcements, Discord, tools).
3. Send both groups to **InfiniView** (iOS / Android / web).

---

## 2. Stack (Confirmed)

| Layer | Technology |
|-------|------------|
| Client | Flutter (`sdk: '>=3.0.0 <4.0.0'`), Material 3 |
| HTTP | `http` ^1.1.0 to public InfiniCore + InfiniView endpoints |
| Cache | SharedPreferences, 5-minute hub feeds |
| Ads | Google AdMob on iOS/Android only |
| Auth | None |
| Firebase | None |

---

## 3. Navigation (Confirmed)

Tabs in `lib/screens/home_screen.dart`:

| Tab | Screen | Role |
|-----|--------|------|
| Home | `_CreatorNetworkHubHomePage` | Three destination cards, stats snapshot, latest announcement |
| Join | `lib/screens/join_hub_screen.dart` | LIVE / Shop / Favorited / how-to; onboarding opens InfiniView |
| Network | `lib/screens/network_hub_screen.dart` | Public stats + announcements + member tools |
| InfiniView | `lib/screens/infiniview_hub_screen.dart` | iOS/Android/web CTAs + month and lifetime public stats |
| About | `lib/screens/about_screen.dart` | Company, benefits, legal, contact |

Settings cog is in the top right of every tab (`CreatorNetworkSettingsCogButton`).

---

## 4. Public data (Confirmed source; live payload Unverified until this change’s check)

| Need | Endpoint | Auth |
|------|----------|------|
| Announcements | InfiniCore `GET /public/announcements` | None. GitHub `Announcements.json` fallback only. |
| Network stats | InfiniView `GET /public/network-stats` | None. No GitHub stats fallback. |

Does **not** call `/creator/announcements`, `/community/network-stats`, popup campaigns, or guest apply.

URLs: `lib/core/app_config.dart`.

---

## 5. Connected projects

| Project | Relationship |
|---------|--------------|
| InfiniCore API | Public announcements consumer only |
| InfiniView Unified App / API | Public network-stats consumer; store/web CTAs; canonical tool URLs |
| infinitumlive.com | Apply, merch, shadow-ban, legal pages opened in WebView or browser |

No writes. No InfiniCore/View source changes in this overhaul.

---

## 6. Findings

| ID | Severity | Finding | Status |
|----|----------|---------|--------|
| CN-01 | Medium | Stats/announcements previously GitHub-only and stale | **Fixed 2026-10-27** — InfiniCore + InfiniView public APIs |
| CN-02 | Medium | Flat Home link dump; iView naming | **Fixed 2026-10-27** — three-path hub + InfiniView tab |
| CN-03 | Low | About used `l10n` without a local variable | **Fixed 2026-10-27** |
| CN-04 | Info | 157 ARB locales; new hub strings English-only this pass | Open — other locales fall back to English; report is `.dart_tool/untranslated_messages.json` |
| CN-05 | Info | Unused iOS/Android permission declarations | **Fixed 2026-10-27** — unused camera/location/contacts/mic/Bluetooth removed; Android targetSdk 35. Release signing still operator-owned debug-config |
| CN-06 | Info | Store binary still 1.0.0+4 until operator ships 1.0.1+1 | **Unverified** |
| CN-11 | Medium | Benefits screens had garbled emoji, InfiniVIEW naming, stale LIVE hours (12/25 as apply floor), Favorited USA-only, missing Bigo do-not-do | **Fixed 2026-10-27** — copy aligned to infinitumlive.com pre-check / Favorited apply / Shop pages |
| CN-07 | Medium | Flutter 3.47 removed synthetic `flutter_gen`; Chrome compile failed on old import | **Fixed 2026-10-27** — generate into `lib/l10n/generated/` |
| CN-08 | Info | Unused `flutter_svg` + `cached_network_image` | **Fixed 2026-10-27** — removed; compatible lockfile upgrade applied |
| CN-09 | Medium | Chrome compiled but stayed white; old `flutter.js` boot hid splash at 5s | **Fixed 2026-10-27** — `flutter_bootstrap.js`; overlay waits for first frame |
| CN-10 | Low | InfiniView CTA said iPhone; About/settings buried; onboarding pointed at old Hosting site | **Fixed 2026-10-27** — iOS wording, About tab, settings cog, InfiniView onboarding |
| CN-12 | Medium | One Material glass shell on all platforms; unused permissions; listing copy claimed no ads | **Fixed 2026-10-27** — adaptive chrome, PrivacyInfo, honest listing doc |

---

## 7. Verification gaps

- Chrome `flutter run -d chrome` **Confirmed** compile/connect after l10n generate-dir (2026-10-27). Cursor IDE browser cannot attach to the DWDS debug session; live UI clicks were not re-run in that tab.
- Live InfiniView `GET /public/network-stats` **Confirmed** 2026-10-27 18:29 UTC: roster 2010, October 2026 diamonds 25,297,259.
- InfiniCore `GET /public/announcements` **Confirmed** reachable (~432 KB payload).
- iOS ATT + AdMob on device
- App Store / Play listing update
- Flutter web hosting origin (native has no CORS Origin; localhost is already allowlisted)
- Live InfiniCore public announcement contents vs InfiniBoard-composed posts

---

## 8. How to run (Chrome)

```powershell
Set-Location "G:\Code\InfiniView-V3\Infinitum LIVE Creator Network - App"
flutter run -d chrome
```

# Suggestions For Features and Additions Later:
# - Public newsroom feed (`destination=live`) if the hub should show InfiniNews
# - Drop unused iOS permission declarations at the next store submit
# - Translate new hub ARB keys beyond English
