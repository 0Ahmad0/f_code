import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_button.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/utils/app_string.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';
import 'package:test_futurecode/screens/auth/signup/signup_screen.dart';
import 'package:test_futurecode/screens/my_vehicles/my_vehicles_screen.dart';

import '../../../core/common/helper_widgets/app_textfiled.dart';
import '../signup/controller/signup_controller.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({super.key});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  SignUpController signUpController = Get.find<SignUpController>();

  _pickFromGallery() async {
    await signUpController.picker
        .pickImage(source: ImageSource.gallery)
        .then((value) {
      signUpController.image = value;
      Get.back();
    });
    setState(() {});
  }

  _pickFromCamera() async {
    await signUpController.picker
        .pickImage(source: ImageSource.camera)
        .then((value) {
      signUpController.image = value;
      Get.back();
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(26.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                AssetsManager.logoIMG,
                width: Get.width / 6,
                height: Get.width / 6,
              ),
              SizedBox(
                height: 80.sp,
              ),
              Text(
                AppString.addProfilePhoto,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                AppString.addProfilePhotoClean,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              StatefulBuilder(builder: (context, pickImageSate) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        buildShowImagePicker(context, pickImageSate);
                      },
                      child: Container(
                        margin: EdgeInsets.all(12.sp),
                        width: Get.width,
                        height: Get.width,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.white,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorManager.black.withOpacity(.10),
                                  blurRadius: 22.sp)
                            ]),
                        child: signUpController.image == null
                            ? Padding(
                                padding: EdgeInsets.all(90.sp),
                                child: SvgPicture.asset(
                                  AssetsManager.personIcon,
                                  color: ColorManager.nextIntroButton,
                                ),
                              )
                            : ClipOval(
                                    child: Image.file(
                                      File(
                                        signUpController.image!.path,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.width / 6,
                      right: Get.width / 8,
                      child: InkWell(
                        onTap: () {
                          buildShowImagePicker(context, pickImageSate);
                        },
                        child: CircleAvatar(
                          radius: 26.sp,
                          backgroundColor: ColorManager.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: ColorManager.white,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
              const Spacer(),
              AppButton(
                  text: AppString.addProfileNext,
                  onPressed: () {
                    signUpController.singUp();
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowImagePicker(
      BuildContext context, StateSetter pickImageSate) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    pickImageSate(() {
                      _pickFromGallery();
                    });
                  },
                  leading: Icon(Icons.image),
                  title: Text(AppString.addProfilePickFromGallery),
                ),
                ListTile(
                  onTap: () {
                    pickImageSate(() {
                      _pickFromCamera();
                    });
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text(AppString.addProfilePickFromCamera),
                ),
              ],
            ));
  }
}
