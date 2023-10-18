import 'package:bracketschat/core/base/model/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = RegisterViewModelBase with _$RegisterViewModel;

abstract class RegisterViewModelBase with Store, BaseViewModel {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? adSoyadController;
  TextEditingController? sehirController;

  @override
  void setContext(BuildContext context) => myContext = context;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    adSoyadController = TextEditingController();
    sehirController = TextEditingController();
  }

  @observable
  bool isLockOpen = false;

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
