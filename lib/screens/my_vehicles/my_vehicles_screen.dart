import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_back_button.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_button.dart';
import 'package:test_futurecode/core/config/storage/app_storage.dart';
import 'package:test_futurecode/core/utils/app_string.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';
import 'package:test_futurecode/screens/add_vehicle/add_vehicle_screen.dart';

import '../../data/datasource/remote/remote_data_source.dart';
import '../../data/models/models.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/services/api_services_imp.dart';
import '../vehicle_details/vehicle_details_screen.dart';
import 'controller/my_vehicles_controller.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyVehiclesController myVehiclesController = Get.put(MyVehiclesController(Repository(RemoteDataSource(ApiServicesImp( Dio())))));
    myVehiclesController.getMyVehicles();
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text(
          AppString.myVehicles,
          style: TextStyle(color: ColorManager.secondaryColor),
        ),
      ),
      body:



               Column(

                children: [
                  GetBuilder<MyVehiclesController>(
                      init: myVehiclesController,
                      builder: (controller)=>
    Obx(() {
                    if (controller.isLoading.value) {
                      return Expanded(child: Center(child: CircularProgressIndicator()));
                    }
                    else {
                      return Expanded(
                          child: ListView.separated(
                            separatorBuilder: (_,__)=>SizedBox(height: 30.sp,),
                            padding: EdgeInsets.all(40.sp),
                            itemBuilder: (_, index) {
                              Vehicle vehicle= controller.vehicles.value.listVehicle[index];
                              return

                                VehicleItem(
                                index: index,
                                image: vehicle.idImage,
                                name:vehicle.model,
                                priceKilo: '50 ل.س 1كم/',
                                priceCompany: '50 ل.س1كم/',
                              );

                              },
                            itemCount: controller.vehicles.value.listVehicle.length,)
                      );}
                  })),
                  Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: AppButton(text: AppString.myVehiclesAddVehicle, onPressed: () {
                      Get.to(()=>const AddVehicleScreen());
                    }),
                  )
                ],
              )




    );
  }
}

class VehicleItem extends StatelessWidget {
   VehicleItem(
      {super.key,
      required this.index,
      required this.name,
      required this.image,
      required this.priceKilo,
      required this.priceCompany});

  final int index;
  final String name;
  final String image;
  final String priceKilo;
  final String priceCompany;
  MyVehiclesController myVehiclesController = Get.find<MyVehiclesController>();
  _getStyleColor(){
    return TextStyle(
      color: myVehiclesController.clickIndex.value==index? ColorManager.primaryColor : ColorManager.secondaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 13.sp
    );
  }
  @override
  Widget build(BuildContext context) {

    return

      InkWell(
        onTap: (){
          myVehiclesController.clickIndex.value=index;
          myVehiclesController.vehicle.value=myVehiclesController.vehicles.value.listVehicle[index];
          Get.to(()=>const VehicleDetailsScreen());
        },
        child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration:   BoxDecoration(
          //Todo Add on select Index
          border:  myVehiclesController.clickIndex.value==index?Border.all(
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

              title: Text(AppString.priceKilo,style:_getStyleColor()),
              trailing: Text(priceKilo,style:_getStyleColor()),
            ),
            ListTile(
              title: Text(AppString.priceCompany,style:_getStyleColor()),
              trailing: Text(priceCompany,style:_getStyleColor()),
            ),
          ],
        ),
    ),
      );
  }
}
