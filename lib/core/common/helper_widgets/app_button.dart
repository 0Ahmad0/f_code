import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_string.dart';
import '../../utils/color_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
          backgroundColor: ColorManager.secondaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ));
  }
}
