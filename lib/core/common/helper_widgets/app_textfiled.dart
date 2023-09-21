import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_futurecode/core/utils/app_string.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';


class AppTextFiled extends StatefulWidget {
  AppTextFiled(
      {Key? key,
        this.textInputAction = TextInputAction.next,
        this.keyboardType = TextInputType.text,
        this.controller,
        this.iconData,
        this.hintText,
        this.obscureText = false,
        this.suffixIcon = false,
        this.validator,
        this.onChanged,
        this.onTap,
        this.autofocus = false,
        this.readOnly = false,
        this.maxline = 1,
        this.minline = 1,
        this.icon})
      : super(key: key);

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Widget? iconData;
  final String? hintText;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxline;
  final int? minline;
  final String? icon;

  @override
  State<AppTextFiled> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  void _showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxline,
      minLines: widget.minline,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator ??
              (String? val) {
            if (val!.trim().isEmpty) return AppString.thisFiledRequired;
            return null;
          },
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold
        ),
        prefixIcon: Padding(
          padding:  EdgeInsets.all(12.sp),
          child: SvgPicture.asset(widget.icon!),
        ),
          suffixIcon:
              widget.icon == AssetsManager.lockIcon?IconButton(
                onPressed: (){
                  _showPassword();
                },
                icon: Icon(widget.obscureText?Icons.visibility_off:Icons.visibility),
              ):SizedBox.shrink(),
          hintText: widget.hintText),
    );
  }
}


