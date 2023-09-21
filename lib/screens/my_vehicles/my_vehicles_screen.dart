import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_back_button.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_button.dart';
import 'package:test_futurecode/core/utils/app_string.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';
import 'package:test_futurecode/screens/add_vehicle/add_vehicle_screen.dart';
import 'package:test_futurecode/screens/vehicle_details/vehicle_details_screen.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text(
          AppString.myVehicles,
          style: TextStyle(color: ColorManager.secondaryColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                separatorBuilder: (_,__)=>SizedBox(height: 30.sp,),
                  padding: EdgeInsets.all(40.sp),
                  itemBuilder: (_, index) => VehicleItem(
                        image: AssetsManager.dialogIMG,
                        name: 'أودي',
                        priceKilo: '50 ل.س 1كم/',
                        priceCompany: '50 ل.س1كم/',
                      ), itemCount: 10,)),
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: AppButton(text: AppString.myVehiclesAddVehicle, onPressed: () {
              Get.to(()=>AddVehicleScreen());
            }),
          )
        ],
      ),
    );
  }
}

class VehicleItem extends StatelessWidget {
  const VehicleItem(
      {super.key,
      required this.name,
      required this.image,
      required this.priceKilo,
      required this.priceCompany});

  final String name;
  final String image;
  final String priceKilo;
  final String priceCompany;

  _getStyleColor(){
    return TextStyle(
      color: false? ColorManager.primaryColor : ColorManager.secondaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 13.sp
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>VehicleDetailsScreen()),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          //Todo Add on select Index
          border: false?Border.all(
            color: ColorManager.primaryColor,
            width: 5
          ):null,
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(30.sp),
          boxShadow: [
            BoxShadow(
                color: ColorManager.black.withOpacity(.12), blurRadius: 13.sp)
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Row(
                children: [
                  Expanded(
                      child: ListTile(
                    title: Text(name,style:_getStyleColor()),
                  )),
                  CircleAvatar(
                    backgroundColor: ColorManager.nextIntroButton,
                    radius: 40.sp,
                    child: SvgPicture.asset(AssetsManager.dialogIMG),
                  ),
                ],
              ),
            ),
            ListTile(

              title: Text(name,style:_getStyleColor()),
              trailing: Text(priceKilo,style:_getStyleColor()),
            ),
            ListTile(
              title: Text(name,style:_getStyleColor()),
              trailing: Text(priceCompany,style:_getStyleColor()),
            ),
          ],
        ),
      ),
    );
  }
}
