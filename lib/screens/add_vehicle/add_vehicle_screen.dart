import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/app_textfiled.dart';
import 'package:test_futurecode/core/utils/assets_manager.dart';

import '../../core/common/helper_widgets/app_back_button.dart';
import '../../core/common/helper_widgets/app_button.dart';
import '../../core/utils/app_string.dart';
import '../../core/utils/color_manager.dart';
import '../../data/datasource/remote/remote_data_source.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/services/api_services_imp.dart';
import 'controller/add_vehicle_controller.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {

  final _formKey = GlobalKey<FormState>();
  AddVehicleController addVehicleController= Get.put(AddVehicleController(Repository(RemoteDataSource(ApiServicesImp( Dio())))));

  @override
  void dispose() {
    addVehicleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AddVehicleController addVehicleController= Get.put(AddVehicleController(Repository(RemoteDataSource(ApiServicesImp( Dio())))));
    addVehicleController.getVehicleTypes();
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text(
          AppString.addVehicle,
          style: TextStyle(color: ColorManager.secondaryColor),
        ),
      ),
      body:

      Obx(() {
      if (addVehicleController.isLoading.value) {
        return  Center(child: CircularProgressIndicator()); // عرض حلقة التحميل
      }
      else {
        return
      Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              padding: EdgeInsets.all(16.sp),
              children: [
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return AppString.thisFiledRequired;
                    }
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: ColorManager.secondaryColor,
                  ),
                  items: addVehicleController.vehicleTypes.value.listVehicleType
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            e.name.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                      hintText: AppString.typeVehicle,
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: SvgPicture.asset(AssetsManager.typeCarIcon),
                      )),
                  onChanged: (value) {
                    addVehicleController.vehicleTypeId=value;
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                AppTextFiled(
                  controller: addVehicleController.modelController,
                  icon: AssetsManager.modelCarIcon,
                  hintText: AppString.modelVehicle,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return AppString.thisFiledRequired;
                    }
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: ColorManager.secondaryColor,
                  ),
                  items: addVehicleController.colors
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.toString())))
                      .toList(),
                  decoration: InputDecoration(
                      hintText: AppString.colorVehicle,
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.sp),
                        child:
                            SvgPicture.asset(AssetsManager.colorPaletteCarIcon),
                      )),
                  onChanged: (value) {
                    addVehicleController.colorSelect=value;
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
                AppTextFiled(
                  controller: addVehicleController.numberController,
                  icon: AssetsManager.plateNumberCarIcon,
                  hintText: AppString.numberVehicle,
                ),
                SizedBox(
                  height: 30.sp,
                ),
                Text(
                  AppString.imagesVehicle,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
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
                        style: TextStyle(
                          color: ColorManager.ligthGrey
                        ),
                      )
                  ],
                ),
                SizedBox(height: 20.sp,),
                SizedBox(
                  height: Get.width / 2.5,
                  child: StatefulBuilder(
                    builder: (context,setStateFiles) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles(allowMultiple: true);

                              if (result != null) {
                                addVehicleController.files = result.paths
                                    .map((path) => File(path!))
                                    .toList();
                                setStateFiles(() {});
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: SizedBox(
                              height: Get.width / 2.5,
                              child: DottedBorder(
                                radius: Radius.circular(8.sp),
                                borderType: BorderType.RRect,
                                color: ColorManager.secondaryColor,
                                child:  Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 8.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorManager.nextIntroButton,
                                        child: Icon(Icons.add,color: ColorManager.primaryColor,),
                                      ),
                                      Text(AppString.addVehicle,style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp
                                      ),)
                                    ],
                                  ),
                                ),

                              ),
                            ),
                          ),
                          SizedBox(width: 10.sp,),
                          Expanded(child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                              itemBuilder: (_,index)=>Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    width: Get.width / 3,
                                    height: Get.width / 2.5,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12.sp),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.sp),
                                      child: Image.network('https://th.bing.com/th/id/OIP.V7y7SFAjIFwkGZve7_twggHaE7?pid=ImgDet&rs=1',
                                      fit: BoxFit.cover,),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      //ToDo : Delete Files
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 4.sp,horizontal: 8.sp),
                                      decoration: BoxDecoration(
                                        color: ColorManager.secondaryColor.withOpacity(.5),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.sp),
                                          bottomRight: Radius.circular(12.sp),
                                        )
                                      ),
                                      child: Icon(Icons.close,color: ColorManager.white,),
                                    ),
                                  )
                                ],
                              ),
                              separatorBuilder: (_,__)=>SizedBox(width: 10.sp,),
                              itemCount: addVehicleController.files.length,))
                        ],
                      );
                    }
                  ),
                )
              ],
            )),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: AppButton(
                  text: AppString.myVehiclesAddVehicle,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addVehicleController.addVehicle();
                    }
                  }),
            )
          ],
        ),
      );}}),
    );
  }
}
