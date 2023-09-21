import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_button.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/utils/app_string.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';
import 'package:test_futurecode/screens/auth/signup/signup_screen.dart';

import '../../../core/common/helper_widgets/app_textfiled.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
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
                      AppString.loginTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 40.sp,
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
                      hintText: AppString.loginPassword,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          AppString.loginForgetPassword,
                          style: TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.sp,
                    ),
                    AppButton(
                        text: AppString.loginTitle,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        }),
                    SizedBox(
                      height: 20.sp,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.off(() => const SignUpScreen());
                        },
                        child: const Text.rich(TextSpan(children: [
                          TextSpan(
                              text: AppString.loginDoNotHaveAccount,
                              style: TextStyle(
                                  color: ColorManager.secondaryColor)),
                          TextSpan(
                            text: AppString.loginCreateAccount,
                          )
                        ])))
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
