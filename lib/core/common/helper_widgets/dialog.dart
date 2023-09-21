import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_button.dart';

import '../../utils/app_string.dart';
import '../../utils/assets_manager.dart';
import '../../utils/color_manager.dart';

class AppDialogs{
  static Future<void> showLoadingDialog({Function? onPressed})async {
    Get.dialog(

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Get.width,
              height: Get.width,
              padding: EdgeInsets.all(60.sp),
              margin: EdgeInsets.all(20.sp),
              decoration: const BoxDecoration(
                  color: ColorManager.white,
                  shape: BoxShape.circle
              ),
              child: Column(
                children: [
                  Expanded(child: SvgPicture.asset(AssetsManager.dialogIMG)),
                  Material(
                    color: Colors.transparent,
                    child: Text(AppString.dialogText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.sp),
              child: AppButton(
                text: AppString.okay,
                onPressed: ()
                {

                  onPressed!=null?onPressed!():"";
                  Get.back();
                },
              ),
            )
          ],
        ),
        barrierColor: Color(0xff272739).withOpacity(.36)
    );
  }
  static void showLoading(){
    FocusManager.instance.primaryFocus?.unfocus();
    Get.dialog(

        Center(child: CircularProgressIndicator(
        )),
        barrierColor: Color(0xff272739).withOpacity(.36)
    );
  }
}