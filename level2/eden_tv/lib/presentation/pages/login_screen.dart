import 'package:EdenTV/core/app_export.dart';
import 'package:EdenTV/theme/custom_button_style.dart';
import 'package:EdenTV/widgets/custom_elevated_button.dart';
import 'package:EdenTV/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final ValueNotifier<bool> loading = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  signIn(String email, String password) {
    ref.read(authNotifierProvider.notifier).signInUser(email, password).then((result){
      Navigator.pushReplacementNamed(
          context, AppRoutes.dashboardBaseContainerPage);
      });
 }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimaryContainer,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: getPadding(all: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Opacity(
                              opacity: 0.87,
                              child: Padding(
                                  padding: getPadding(left: 12, top: 48),
                                  child: Text("EdenTV",
                                      style: theme.textTheme.displaySmall))),
                          CustomTextFormField(
                              controller: emailController,
                              margin: getMargin(top: 36),
                              hintText: "Your Email",
                              hintStyle:
                                  CustomTextStyles.bodySmallPoppinsBluegray300,
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 10, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgMail)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48))),
                          CustomTextFormField(
                              controller: passwordController,
                              margin: getMargin(top: 16),
                              hintText: "Password",
                              hintStyle:
                                  CustomTextStyles.bodySmallPoppinsBluegray300,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 10, bottom: 12),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgLockBlueGray300)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48)),
                              obscureText: true),
                          CustomElevatedButton(
                            height: getVerticalSize(56),
                            text: "Login",
                            margin: getMargin(top: 16),
                            buttonStyle: CustomButtonStyles.fillPrimary,
                            onTap: () {
                              final email = emailController.text;
                              final password = passwordController.text;
                              signIn(email, password);
                            },
                          ),
                          const Spacer(),
                          Align(
                              alignment: Alignment.center,
                              child: Opacity(
                                  opacity: 0.87,
                                  child: Padding(
                                      padding: getPadding(bottom: 18),
                                      child: Text(
                                          "Don’t have an Account? Sign up here.",
                                          style: theme.textTheme.bodySmall))))
                        ])))));
  }
}