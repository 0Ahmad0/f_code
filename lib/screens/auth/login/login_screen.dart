import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/utils/app_string.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
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
                  decoration: BoxDecoration(
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      backgroundColor: ColorManager.secondaryColor,
                    ),
                      onPressed: (){
                        Get.back();
                      },
                      child: Text(AppString.okay,style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500
                      ),)
                  ),
                )
              ],
            ),
              barrierColor: Color(0xff272739).withOpacity(.36)
            );
          },
          child: Text('Open Dialog'),
        ),
      ),
    );
  }
}
