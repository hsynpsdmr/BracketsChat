import 'package:bracketschat/core/base/model/base_viewmodel.dart';
import 'package:bracketschat/core/constants/db/collection_names.dart';
import 'package:bracketschat/core/constants/navigation/navigation_constants.dart';
import 'package:bracketschat/view/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TextEditingController? emailController;
  TextEditingController? passwordController;
  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLockOpen = true;

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  Future<void> register() async {
    navigation.navigateToPageClear(path: NavigationConstants.REGISTER_VIEW);
  }

  @action
  Future<void> login() async {
    if (emailController!.text != '' && passwordController!.text != '') {
      LoginService().signInWithEmailAndPassword(email: emailController!.text, password: passwordController!.text).then((value) {
        if (value == AuthResultMessage.kAuthSuccessLogin) {
          navigation.navigateToPageClear(path: NavigationConstants.HOME_VIEW);
        } else if (value == AuthResultMessage.kUserNotFound) {
          print('Kullanıcı bulunamadı');
        } else if (value == AuthResultMessage.kWrongPassword) {
          print('Şifre yanlış');
        } else {
          print(value);
        }
      });
    }
  }
}
