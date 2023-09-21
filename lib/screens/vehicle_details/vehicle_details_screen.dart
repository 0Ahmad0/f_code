import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_textfiled.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';

import '../../core/common/helper_widgets/app_back_button.dart';
import '../../core/common/helper_widgets/app_button.dart';
import '../../core/utils/app_string.dart';
import '../../core/utils/color_manager.dart';
import '../my_vehicles/controller/my_vehicles_controller.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  MyVehiclesController myVehiclesController = Get.find<MyVehiclesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text(
          AppString.vehicleDetails,
          style: TextStyle(color: ColorManager.secondaryColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(16.sp),
            children: [
              DetailsCarItem(
                icon: AssetsManager.typeCarIcon,
                title: AppString.typeVehicle,
                value: myVehiclesController.vehicle.value.vehicleType?.name??'',//'سيارة',
              ),
              Divider(
                color: ColorManager.ligthGrey,
              ),
              DetailsCarItem(
                icon: AssetsManager.modelCarIcon,
                title: AppString.modelVehicle,
                value:myVehiclesController.vehicle.value.model// 'كيا ريو',
              ),
              Divider(
                color: ColorManager.ligthGrey,
              ),
              DetailsCarItem(
                icon: AssetsManager.colorPaletteCarIcon,
                title: AppString.colorVehicle,
                value: myVehiclesController.vehicle.value.color//'أسود',
              ),
              Divider(
                color: ColorManager.ligthGrey,
              ),
              DetailsCarItem(
                icon: AssetsManager.plateNumberCarIcon,
                title: AppString.numberVehicle,
                value:'${myVehiclesController.vehicle.value.boardNumber}'// '125478',
              ),
              Divider(
                color: ColorManager.ligthGrey,
              ),
              DetailsCarItem(
                icon: AssetsManager.priceKiloIcon,
                title: AppString.priceKilo,
                value: '1كم / 50 ليرة',
              ),
              Divider(
                color: ColorManager.ligthGrey,
              ),
              DetailsCarItem(
                icon: AssetsManager.priceCompanyCarIcon,
                title: AppString.priceCompany,
                value: '1كم / 50 ليرة',
              ),
              Divider(
                color: ColorManager.ligthGrey,
              ),
              SizedBox(height: 10.sp,),
              Text(
                AppString.imagesVehicle,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0;
                      i < AppString.detailsImagesVehicle.length;
                      i++)
                    Text(
                      '${i + 1}- ' + AppString.detailsImagesVehicle[i],
                      style: TextStyle(color: ColorManager.ligthGrey),
                    )
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              SizedBox(
                height: Get.width / 2.5,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        width: Get.width / 2.5,
                        height: Get.width / 2.5,
                        decoration: BoxDecoration(
                            color: ColorManager.secondaryColor,
                            borderRadius: BorderRadius.circular(8.sp)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.sp),
                            child: Image.network(
                              'https://th.bing.com/th/id/OIP.V7y7SFAjIFwkGZve7_twggHaE7?pid=ImgDet&rs=1',
                              fit: BoxFit.cover,
                            )),
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(
                          width: 10.sp,
                        ),
                    itemCount: 10),
              )
            ],
          )),
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: AppButton(text: AppString.pickerVehicle, onPressed: () async {

               AppDialogs.showLoadingDialog(onPressed: (){  Get.back();});


            }),
          )
        ],
      ),
    );
  }
}

class DetailsCarItem extends StatelessWidget {
  const DetailsCarItem({
    super.key, required this.title, required this.icon, required this.value,
  });

  final String title;
  final String icon;
  final String value;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(
          width: 10.sp,
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              value,
              style: TextStyle(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),
      ],
    );
  }
}
