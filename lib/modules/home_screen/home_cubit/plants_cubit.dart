import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plants_orange/models/all_model.dart';
import 'package:plants_orange/models/plants_model.dart';
import 'package:plants_orange/models/seeds_model.dart';
import 'package:plants_orange/models/tools_model.dart';
import 'package:plants_orange/models/update_user_model.dart';
import 'package:plants_orange/models/user_model.dart';
import 'package:plants_orange/modules/care_plants/care_plant_screen.dart';
import 'package:plants_orange/modules/home_screen/home_cubit/plants_states.dart';
import 'package:plants_orange/modules/home_screen/home_screen.dart';
import 'package:plants_orange/modules/notification/notification_screen.dart';
import 'package:plants_orange/modules/profile/profile_screen.dart';
import 'package:plants_orange/modules/scanner/scanner_screen.dart';
import 'package:plants_orange/shared/component.dart';

import '../../../network/dio_helper.dart';
import '../../../shared/constant.dart';
import '../../../style/colors.dart';

class PlantsCubit extends Cubit<PlantsState> {
  PlantsCubit() : super(InitialState_());

  static PlantsCubit get(context) => BlocProvider.of(context);

  int count = 1;

  void changeCountCartPlus() {
    count++;
    emit(StateCountCartPlus());
  }

  void changeCountCartMinus() {
    count--;
    emit(StateCountCartMinus());
  }

  bool buttonAll = true;
  bool buttonPlants = false;
  bool buttonSeeds = false;
  bool buttonTools = false;
  bool buttonProducts = false;

  void changeButtonAll() {
    buttonAll = true;
    buttonPlants = false;
    buttonSeeds = false;
    buttonTools = false;
    buttonProducts = false;
    emit(StateButtonAll());
  }

  void changeButtonPlants() {
    buttonAll = false;
    buttonPlants = true;
    buttonSeeds = false;
    buttonTools = false;
    buttonProducts = false;
    emit(StateButtonPlants());
  }

  void changeButtonSeeds() {
    buttonAll = false;
    buttonPlants = false;
    buttonSeeds = true;
    buttonTools = false;
    buttonProducts = false;
    emit(StateButtonSeeds());
  }

  void changeButtonTools() {
    buttonAll = false;
    buttonPlants = false;
    buttonSeeds = false;
    buttonTools = true;
    buttonProducts = false;
    emit(StateButtonTools());
  }

  void changeButtonProducts() {
    buttonAll = false;
    buttonPlants = false;
    buttonSeeds = false;
    buttonTools = false;
    buttonProducts = true;
    emit(StateButtonProducts());
  }

  Widget buildGridItem(model, index, context) {
    return Stack(alignment: Alignment.topLeft, children: [
      Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.w,
              offset: Offset(0.w, 2.w),
            ),
          ],
        ),
        child: SizedBox(
          height: 300,
          child: Padding(
            padding: EdgeInsets.all(18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          PlantsCubit.get(context).changeCountCartMinus();
                        },
                        child: Container(
                            width: 22.h,
                            height: 22.h,
                            color: Colors.grey.shade200,
                            child: FittedBox(
                              child: Text('-',
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey,
                                      fontFamily: 'Roboto')),
                            )),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '${PlantsCubit.get(context).count}',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto'),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      InkWell(
                        onTap: () {
                          PlantsCubit.get(context).changeCountCartPlus();
                        },
                        child: Container(
                            width: 22.h,
                            height: 22.h,
                            color: Colors.grey.shade200,
                            child: FittedBox(
                              child: Text('+',
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey,
                                      fontFamily: 'Roboto')),
                            )),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FittedBox(
                  child: Text(
                    model.data![index].name!,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                  ),
                ),
                Text(
                  model.data![index].description!,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Roboto'),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: double.infinity,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: PrimaryGreen,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        width: 110.w,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
            image: NetworkImage('$BASE_URL${model.data![index].imageUrl!}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ]);

    //     return Card(
//       elevation: 6.0,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.r),
//       ),
//       child: SizedBox(
//         width: 176.w,
//         height: 227.h,
//
//         child: Stack(
//           alignment: Alignment.topLeft,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                 right: 14.w,
//                 left: 14.w,
//                 bottom: 20.h,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 27.h,
//                     ),
//                     child: Row(
//                       children: [
//                         Spacer(),
//                         InkWell(
//                           onTap: () {
//                             cubit.changeCountCartMinus();
//                           },
//                           child: Container(
//                               width: 22.h,
//                               height: 22.h,
//                               color: Colors.grey.shade200,
//                               child: FittedBox(
//                                 child: Text('-',
//                                     style: TextStyle(
//                                         fontSize: 22.sp,
//                                         fontWeight: FontWeight.w900,
//                                         color: Colors.grey,
//                                         fontFamily: 'Roboto')),
//                               )),
//                         ),
//                         SizedBox(
//                           width: 4.w,
//                         ),
//                         Text(
//                           '${PlantsCubit
//                               .get(context)
//                               .count}',
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                               fontStyle: FontStyle.normal,
//                               fontFamily: 'Roboto'),
//                         ),
//                         SizedBox(
//                           width: 4.w,
//                         ),
//
//                         InkWell(
//                           onTap: () {
//                             cubit.changeCountCartPlus();
//                           },
//                           child: Container(
//                               width: 22.h,
//                               height: 22.h,
//                               color: Colors.grey.shade200,
//                               child: FittedBox(
//                                 child: Text('+',
//                                     style: TextStyle(
//                                         fontSize: 22.sp,
//                                         fontWeight: FontWeight.w900,
//                                         color: Colors.grey,
//                                         fontFamily: 'Roboto')),
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//
//                   FittedBox(
//                     child: Text(
//                       'GARDENIA PLANT',
//                       style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontStyle: FontStyle.normal,
//                           fontFamily: 'Roboto'),
//                     ),
//                   ),
//                   Text(
//                     '70 EGP',
//                     style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                         fontStyle: FontStyle.normal,
//                         fontFamily: 'Roboto'),
//                   ),
//                   SizedBox(
//                     height: 8.h,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 48.h,
//                     decoration: BoxDecoration(
//                       color: PrimaryGreen,
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                     child: MaterialButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Add To Cart',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16.sp,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: 110.w,
//               height: 200.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.r),
//                 image: DecorationImage(
//                   image:  NetworkImage(
// 'assets/images/ex_plant.png')                ,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
  }

  List<Widget>? typeGridView(context) {
    if (buttonSeeds) {
      return List.generate(seedsModel!.data!.length, (index) {
        return buildGridItem(seedsModel!, index, context);
      });
    }
    if (buttonPlants) {
      return List.generate(plantsModel!.data!.length, (index) {
        return buildGridItem(plantsModel!, index, context);
      });
    }
    if (buttonTools) {
      return List.generate(toolsModel!.data!.length, (index) {
        return buildGridItem(toolsModel!, index, context);
      });
    }
    return List.generate(seedsModel!.data!.length, (index) {
      return buildGridItem(seedsModel!, index, context);
    });
  }

  int currentIndex = 2;
  List<Widget> screens = [
    const CarePlantsScreen(),
    const ScannerScreen(),
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  void changeScreen(int index) {
    currentIndex = index;

    emit(changeIndexButton());
  }

  bool doneSeeds = false;
  bool donePlants = false;
  bool doneTools = false;
  bool doneAll = false;
  bool doneUser = false;

  SeedsModel? seedsModel;

  void getSeeds() {
    emit(SeedsLoadingState());
    DioHelper.getData(
      url: GET_SEEDS,
      token: token,
    ).then((value) {
      seedsModel = SeedsModel.fromJson(value.data);
      doneSeeds = true;
      print(seedsModel!.data![0].name);
      emit(SeedsSuccessState());
    }).catchError((onError) {
      emit(SeedsErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  PlantsModel? plantsModel;

  void getPlants() {
    emit(PlantsLoadingState());
    DioHelper.getData(
      url: GET_PLANTS,
      token: token,
    ).then((value) {
      plantsModel = PlantsModel.fromJson(value.data);
      donePlants = true;
      print(plantsModel!.data![0].name);
      emit(PlantsSuccessState());
    }).catchError((onError) {
      emit(PlantsErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  ToolsModel? toolsModel;

  void getTools() {
    emit(ToolsLoadingState());
    DioHelper.getData(
      url: GET_TOOLS,
      token: token,
    ).then((value) {
      toolsModel = ToolsModel.fromJson(value.data);
      doneTools = true;
      print(toolsModel!.data![0].name);
      emit(ToolsSuccessState());
    }).catchError((onError) {
      emit(ToolsErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  AllModel? allModel;

  void getAll() {
    emit(AllLoadingState());
    DioHelper.getData(
      url: GET_ALL,
      token: token,
    ).then((value) {
      allModel = AllModel.fromJson(value.data);
      doneAll = true;
      print(allModel!.data!.plants);
      emit(AllSuccessState());
    }).catchError((onError) {
      emit(AllErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  UserModel? userModel;

  void getUser() {
    emit(UserLoadingState());
    DioHelper.getData(
      url: GET_USER,
      token: token,
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(userModel!.data!.firstName);
      if (userModel!.data!.userPoints == null) {
        userModel!.data!.userPoints = '0';
      }
      doneUser = true;
      emit(UserSuccessState());
    }).catchError((onError) {
      emit(UserErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  UpdateUserModel? updateUserModel;

  void updateUserName({
    required String firstName,
    required String lastName,
  }) {
    emit(UserLoadingState());
    DioHelper.patchData(
      url: GET_USER,
      token: token,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": userModel!.data!.email,
        "address": userModel!.data!.address,
      },
    ).then((value) {
      updateUserModel = UpdateUserModel.fromJson(value.data);
      print(updateUserModel!.data!.firstName);
      Fluttertoast.showToast(
        msg: 'Updated Successfully ✔',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      getUser();
      emit(UserSuccessState());
    }).catchError((onError) {
      emit(UserErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  void updateUserEmail({
    required String email,
    required String address,
  }) {
    emit(UserLoadingState());
    DioHelper.patchData(
      url: GET_USER,
      token: token,
      data: {
        "firstName": userModel!.data!.firstName,
        "lastName": userModel!.data!.lastName,
        "email": email,
        "address": address,
      },
    ).then((value) {
      updateUserModel = UpdateUserModel.fromJson(value.data);
      Fluttertoast.showToast(
        msg: 'Updated Successfully ✔',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      getUser();
      emit(UserSuccessState());
    }).catchError((onError) {
      emit(UserErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}