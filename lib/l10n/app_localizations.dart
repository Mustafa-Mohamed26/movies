import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @auth_view_model_register_success.
  ///
  /// In en, this message translates to:
  /// **'Success Register'**
  String get auth_view_model_register_success;

  /// No description provided for @auth_view_model_register_error.
  ///
  /// In en, this message translates to:
  /// **'Error Register'**
  String get auth_view_model_register_error;

  /// No description provided for @auth_view_model_login_success.
  ///
  /// In en, this message translates to:
  /// **'Success Login'**
  String get auth_view_model_login_success;

  /// No description provided for @auth_view_model_login_error.
  ///
  /// In en, this message translates to:
  /// **'Error Login'**
  String get auth_view_model_login_error;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forget_password;

  /// No description provided for @forget_password_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get forget_password_email;

  /// No description provided for @forget_password_enter.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get forget_password_enter;

  /// No description provided for @forget_password_email_valid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get forget_password_email_valid;

  /// No description provided for @forget_password_verify.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get forget_password_verify;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @avater.
  ///
  /// In en, this message translates to:
  /// **'Avatar'**
  String get avater;

  /// No description provided for @donot_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get donot_have_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create_Account'**
  String get create_account;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @login_with_google.
  ///
  /// In en, this message translates to:
  /// **'Login with Google(not available)'**
  String get login_with_google;

  /// No description provided for @no_movies_found.
  ///
  /// In en, this message translates to:
  /// **'No Movies Found'**
  String get no_movies_found;

  /// No description provided for @see_more.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get see_more;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @old_password.
  ///
  /// In en, this message translates to:
  /// **'Old password'**
  String get old_password;

  /// No description provided for @wishList.
  ///
  /// In en, this message translates to:
  /// **'WishList'**
  String get wishList;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @pick_avatar.
  ///
  /// In en, this message translates to:
  /// **'Pick Avatar'**
  String get pick_avatar;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @update_data.
  ///
  /// In en, this message translates to:
  /// **'Update Data'**
  String get update_data;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @details_view_model_not_launch.
  ///
  /// In en, this message translates to:
  /// **'Could not launch'**
  String get details_view_model_not_launch;

  /// No description provided for @details_view_model_launch_error.
  ///
  /// In en, this message translates to:
  /// **'Launch error'**
  String get details_view_model_launch_error;

  /// No description provided for @details_unKnown.
  ///
  /// In en, this message translates to:
  /// **'UnKnown'**
  String get details_unKnown;

  /// No description provided for @details_screen_watch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get details_screen_watch;

  /// No description provided for @details_screen_shots.
  ///
  /// In en, this message translates to:
  /// **'Screen Shots'**
  String get details_screen_shots;

  /// No description provided for @details_screen_Similar.
  ///
  /// In en, this message translates to:
  /// **'Similar'**
  String get details_screen_Similar;

  /// No description provided for @details_screen_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get details_screen_summary;

  /// No description provided for @details_screen_no_description.
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get details_screen_no_description;

  /// No description provided for @details_screen_cast.
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get details_screen_cast;

  /// No description provided for @details_screen_genres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get details_screen_genres;

  /// No description provided for @profile_view_model_user_missing.
  ///
  /// In en, this message translates to:
  /// **'User data is missing'**
  String get profile_view_model_user_missing;

  /// No description provided for @profile_view_model_token_not_found.
  ///
  /// In en, this message translates to:
  /// **'Token not found'**
  String get profile_view_model_token_not_found;

  /// No description provided for @profile_view_model_no_response.
  ///
  /// In en, this message translates to:
  /// **'No response from server'**
  String get profile_view_model_no_response;

  /// No description provided for @profile_view_model_user_not_logged.
  ///
  /// In en, this message translates to:
  /// **'User not logged in or token missing'**
  String get profile_view_model_user_not_logged;

  /// No description provided for @onboarding1_line1.
  ///
  /// In en, this message translates to:
  /// **'Find Your Next Favorite Movie Here'**
  String get onboarding1_line1;

  /// No description provided for @onboarding1_line2.
  ///
  /// In en, this message translates to:
  /// **'Get access to a huge library of movies to suit all tastes. You will surely like it.'**
  String get onboarding1_line2;

  /// No description provided for @onboarging1_explore.
  ///
  /// In en, this message translates to:
  /// **'Explore Now'**
  String get onboarging1_explore;

  /// No description provided for @onboarding2_title1.
  ///
  /// In en, this message translates to:
  /// **'Discover Movies'**
  String get onboarding2_title1;

  /// No description provided for @onboarding2_subtitle1.
  ///
  /// In en, this message translates to:
  /// **'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.'**
  String get onboarding2_subtitle1;

  /// No description provided for @onboarding2_title2.
  ///
  /// In en, this message translates to:
  /// **'Explore All Genres'**
  String get onboarding2_title2;

  /// No description provided for @onboarding2_subtitle2.
  ///
  /// In en, this message translates to:
  /// **'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.'**
  String get onboarding2_subtitle2;

  /// No description provided for @onboarding2_title3.
  ///
  /// In en, this message translates to:
  /// **'Create Watch lists'**
  String get onboarding2_title3;

  /// No description provided for @onboarding2_subtitle3.
  ///
  /// In en, this message translates to:
  /// **'Save movies to your watch list to keep track of what you want to watch next. Enjoy films in various qualities and genres.'**
  String get onboarding2_subtitle3;

  /// No description provided for @onboarding2_title4.
  ///
  /// In en, this message translates to:
  /// **'Rate, Review, and Learn'**
  String get onboarding2_title4;

  /// No description provided for @onboarding2_subtitle4.
  ///
  /// In en, this message translates to:
  /// **'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.'**
  String get onboarding2_subtitle4;

  /// No description provided for @onboarding2_title5.
  ///
  /// In en, this message translates to:
  /// **'Start Watching Now'**
  String get onboarding2_title5;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @adventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get adventure;

  /// No description provided for @animation.
  ///
  /// In en, this message translates to:
  /// **'Animation'**
  String get animation;

  /// No description provided for @biography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get biography;

  /// No description provided for @comedy.
  ///
  /// In en, this message translates to:
  /// **'Comedy'**
  String get comedy;

  /// No description provided for @crime.
  ///
  /// In en, this message translates to:
  /// **'Crime'**
  String get crime;

  /// No description provided for @documentary.
  ///
  /// In en, this message translates to:
  /// **'Documentary'**
  String get documentary;

  /// No description provided for @drama.
  ///
  /// In en, this message translates to:
  /// **'Drame'**
  String get drama;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// No description provided for @fantasy.
  ///
  /// In en, this message translates to:
  /// **'Fantasy'**
  String get fantasy;

  /// No description provided for @film_Noir.
  ///
  /// In en, this message translates to:
  /// **'Film-Noir'**
  String get film_Noir;

  /// No description provided for @horror.
  ///
  /// In en, this message translates to:
  /// **'Horror'**
  String get horror;

  /// No description provided for @music.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// No description provided for @musical.
  ///
  /// In en, this message translates to:
  /// **'Musical'**
  String get musical;

  /// No description provided for @mystery.
  ///
  /// In en, this message translates to:
  /// **'Mystery'**
  String get mystery;

  /// No description provided for @romance.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get romance;

  /// No description provided for @sci_Fi.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi'**
  String get sci_Fi;

  /// No description provided for @sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get sport;

  /// No description provided for @thriller.
  ///
  /// In en, this message translates to:
  /// **'Thriller'**
  String get thriller;

  /// No description provided for @war.
  ///
  /// In en, this message translates to:
  /// **'War'**
  String get war;

  /// No description provided for @western.
  ///
  /// In en, this message translates to:
  /// **'Western'**
  String get western;

  /// No description provided for @validate_enter_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get validate_enter_email;

  /// No description provided for @validate_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get validate_valid_email;

  /// No description provided for @validate_enter_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get validate_enter_password;

  /// No description provided for @validate_8_characters.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get validate_8_characters;

  /// No description provided for @validate_upper_password.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get validate_upper_password;

  /// No description provided for @validate_special.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character'**
  String get validate_special;

  /// No description provided for @validate_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get validate_not_match;

  /// No description provided for @validate_enter_phone.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get validate_enter_phone;

  /// No description provided for @validate_valid_phone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number (e.g. +2011xxxxxxxx or 011xxxxxxxx)'**
  String get validate_valid_phone;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
