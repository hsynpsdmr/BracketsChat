import 'package:bracketschat/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel {
  late BuildContext myContext;
  NavigationService navigation = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
