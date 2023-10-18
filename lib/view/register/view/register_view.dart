import 'package:bracketschat/core/base/view/base_view.dart';
import 'package:bracketschat/core/init/language/locale_keys.g.dart';
import 'package:bracketschat/view/register/viewmodel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, RegisterViewModel value) => Scaffold(
          key: value.scaffoldState,
          body: SafeArea(
            child: Padding(
              padding: context.paddingNormal,
              child: buildForm(value, context),
            ),
          )),
    );
  }

  Form buildForm(RegisterViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextFormFieldEmail(context, viewModel),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextFormFieldPassword(context, viewModel),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextFormField(
              context,
              viewModel.adSoyadController,
              LocaleKeys.register_namesurname.tr(),
              buildContainerIconField(context, Icons.pending_actions),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextFormField(
              context,
              viewModel.sehirController,
              LocaleKeys.register_city.tr(),
              buildContainerIconField(context, Icons.location_city),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormField(BuildContext context, TextEditingController? textController, String? labelText, Widget? icon) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: context.textTheme.subtitle1,
        icon: icon,
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

  Widget buildTextFormFieldPassword(BuildContext context, RegisterViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
            labelStyle: context.textTheme.subtitle1,
            labelText: LocaleKeys.register_password.tr(),
            icon: buildContainerIconField(context, Icons.vpn_key),
            suffixIcon: TextButton(onPressed: () {
              viewModel.isLockStateChange();
            }, child: Observer(builder: (_) {
              return Icon(viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
            }))),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, RegisterViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmails ? 'asdasd' : null,
      decoration: InputDecoration(
        labelText: LocaleKeys.register_email.tr(),
        labelStyle: context.textTheme.subtitle1,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }
}
