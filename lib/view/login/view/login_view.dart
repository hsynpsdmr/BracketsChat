import 'package:bracketschat/core/base/view/base_view.dart';
import 'package:bracketschat/core/constants/image/image_constatns.dart';
import 'package:bracketschat/core/init/language/locale_keys.g.dart';
import 'package:bracketschat/view/login/viewmodel/login_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/extension/context_extension.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => Scaffold(
        key: value.scaffoldState,
        body: SafeArea(
          child: Column(
            children: [
              buildAnimatedContainer(context),
              Expanded(flex: 6, child: Padding(padding: context.paddingNormal, child: buildForm(value, context))),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      // color: Colors.white,
      child: Center(
        child: Image.asset(ImageConstants.instance.login),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(labelStyle: context.textTheme.headline5, unselectedLabelStyle: context.textTheme.headline5, labelColor: Colors.black, indicatorColor: Colors.yellow, indicatorWeight: 5, indicatorSize: TabBarIndicatorSize.label, tabs: [
      Tab(text: '   ${LocaleKeys.login_tab1.tr()}   '),
      Tab(text: LocaleKeys.login_tab2.tr()),
    ]);
  }

  Form buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextFormFieldEmail(context, viewModel),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextFormFieldPassword(context, viewModel),
          ),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildRaisedButtonLogin(context, viewModel),
          buildWrapForgot(viewModel),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
          labelStyle: context.textTheme.subtitle1,
          labelText: LocaleKeys.login_password.tr(),
          icon: buildContainerIconField(context, Icons.vpn_key),
          suffixIcon: TextButton(
            onPressed: () {
              viewModel.isLockStateChange();
            },
            child: Observer(
              builder: (_) {
                return Icon(viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
              },
            ),
          ),
        ),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmails ? 'asdasd' : null,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
        labelStyle: context.textTheme.subtitle1,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.colors.primaryContainer),
    );
  }

  Widget buildTextForgot() => Align(alignment: Alignment.centerRight, child: Text(LocaleKeys.login_forgotText, textAlign: TextAlign.end).tr());

  Widget buildRaisedButtonLogin(BuildContext context, LoginViewModel viewModel) {
    return Padding(
      padding: context.paddingNormal,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: context.colors.onError,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          viewModel.login();
        },
        child: Center(
          child: Text(LocaleKeys.login_login.tr(), style: context.textTheme.headline5),
        ),
      ),
    );
  }

  Wrap buildWrapForgot(LoginViewModel viewModel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(LocaleKeys.login_dontAccount.tr()),
        TextButton(
            onPressed: () {
              viewModel.register();
            },
            child: Text(LocaleKeys.login_tab2.tr()))
      ],
    );
  }
}
