import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_button.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/utils/app_string.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';
import 'package:test_futurecode/screens/auth/add_profile/add_profile_screen.dart';
import 'package:test_futurecode/screens/auth/login/login_screen.dart';
import 'package:test_futurecode/screens/auth/signup/signup_screen.dart';

import '../../../core/common/helper_widgets/app_textfiled.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AssetsManager.backOpacityIMG,
                ))),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(26.sp),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset(
                      AssetsManager.logoIMG,
                      width: Get.width / 6,
                      height: Get.width / 6,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      AppString.signupTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 40.sp,
                    ),
                    AppTextFiled(
                      controller: nameController,
                      icon: AssetsManager.personIcon,
                      hintText: AppString.signupName,
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    AppTextFiled(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppString.thisFiledRequired;
                        }
                        if (!value.isPhoneNumber) {
                          return AppString.enterValidPhone;
                        }
                        return null;
                      },
                      controller: phoneController,
                      icon: AssetsManager.phoneIcon,
                      hintText: AppString.loginPhone,
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    AppTextFiled(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppString.thisFiledRequired;
                        }
                        if (!regex.hasMatch(value)) {
                          return AppString.enterValidPassword;
                        }
                        return null;
                      },
                      controller: passwordController,
                      icon: AssetsManager.lockIcon,
                      obscureText: true,
                      hintText: AppString.signupPassword,
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    AppTextFiled(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppString.thisFiledRequired;
                        }
                        if (confirmPasswordController.text
                                .compareTo(passwordController.text) !=
                            0) {
                          return AppString.enterValidPassword;
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      icon: AssetsManager.lockIcon,
                      obscureText: true,
                      hintText: AppString.signupConfirmPassword,
                    ),
                    SizedBox(
                      height: 40.sp,
                    ),
                    AppButton(
                        text: AppString.signupTitle,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.off(() => const AddProfileScreen());
                          }
                        }),
                    SizedBox(
                      height: 20.sp,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.off(() => const LoginScreen());
                        },
                        child: const Text.rich(TextSpan(children: [
                          TextSpan(
                              text: AppString.signupHaveAccount,
                              style: TextStyle(
                                  color: ColorManager.secondaryColor)),
                          TextSpan(
                            text: AppString.signupLogin,
                          )
                        ]))),
                    SizedBox(
                      height: 40.sp,
                    ),
                    const Text.rich(

                        TextSpan(

                      children: [
                        TextSpan(
                          text: AppString.signupAgreeWithUs,
                        ),
                        TextSpan(
                            text: AppString.signupPrivacyAndCondition,
                            style: TextStyle(color: ColorManager.primaryColor))
                      ],
                    ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
