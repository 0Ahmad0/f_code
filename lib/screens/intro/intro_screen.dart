import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_back_button.dart';
import 'package:test_futurecode/core/utils/app_string.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';
import 'package:test_futurecode/screens/intro/widgets/circle_progress_bar.dart';

import '../auth/login/login_screen.dart';
import 'widgets/intro_page1.dart';
import 'widgets/intro_page2.dart';
import 'widgets/intro_page3.dart';

const gradientCircle = [
  ColorManager.primaryColor,
  ColorManager.primaryColor,
];

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final PageController _pageController;
  int _currentPage = 0;
  double progressPercent = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StatefulBuilder(
          builder: (context,pageViewState) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: PageView(
                        onPageChanged: (index) {
                          pageViewState(() {
                            _currentPage = index;
                          });
                        },
                        controller: _pageController,
                        children: [
                          IntroPage1(),
                          IntroPage2(),
                          IntroPage3(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: _customProgress(),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: _currentPage != 0,
                      child: InkWell(
                        onTap: () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                        child: AppBackButton(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.off(() => LoginScreen());
                      },
                      child: const Text(
                        AppString.skip,
                        style: TextStyle(
                            color: ColorManager.black
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _customProgress() {
    return _currentPage == 2 
        ?InkWell(
      onTap: (){
        Get.off(()=>LoginScreen());
      },
          child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(4.sp),
      height: 90.w,
      width: 90.w,
      decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          shape: BoxShape.circle,
      ),
      child: Text(AppString.goNow,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          color: ColorManager.white
      ),),
    ),
        )
        : Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 70.w,
          height: 70.w,
          child: CircleProgressBar(
            backgroundColor: Colors.white,
            gradientColors: gradientCircle,
            value: ((_currentPage + 1) * 1.0 / 3),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.nextIntroButton,
          ),
          child: IconButton(
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            icon: Icon(

              Icons.arrow_back
              ,
              color: ColorManager.black,
            ),
          ),
        )
      ],
    );
  }

}

