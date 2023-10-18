import 'package:bracketschat/core/constants/app/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get locale => this.tr();
  String get localeUpper => this.tr().toUpperCase();
  String get localeLower => this.tr().toLowerCase();
  String? get isValidEmail => contains(RegExp(ApplicationConstants.EMAIL_REGIEX)) ? null : 'Email does not valid';

  bool get isValidEmails => RegExp(ApplicationConstants.EMAIL_REGIEX).hasMatch(this);
}

extension ImagePathExtansion on String {
  String get toSVG => "assets/svg/$this.svg";
}
