import 'package:bracketschat/core/constants/enum/preferences_keys_enum.dart';
import 'package:bracketschat/core/init/memory/preferences_manager.dart';
import 'package:bracketschat/view/login/view/login_view.dart';
import 'package:bracketschat/view/onboard/view/onboard_view.dart';

import 'package:flutter/material.dart';

Widget initiator() {
  //uygulamayı ilk defa indiren kişi için açılış sayfası eklenecek ise buradan eklenir.
  int isFirstEntry = PreferencesManager.instance.getIntVal(PreferencesKeys.IS_FIRST_ENTRY);
  if (isFirstEntry == -1) {
    PreferencesManager.instance.setIntVal(PreferencesKeys.IS_FIRST_ENTRY, 0);
    return OnBoardView();
  } else {
    return LoginView();
  }
}
