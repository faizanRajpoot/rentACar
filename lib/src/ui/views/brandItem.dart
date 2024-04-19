// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car_skeleton/src/controllers/brandItem_controller.dart';
import 'package:rent_a_car_skeleton/src/ui/views/brandItem/brandItemCard.dart';
import '../widgets/common_scaffold.dart';
import '../../utils/config/uidata.dart';
import '../widgets/forms/textfields/searchBar.dart';
// import '../../utils/config/config.dart';
// import '../../utils/routes/app_routes.dart';

class BrandItem extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<BrandItemController>(
      builder: (_) {
        // print(_.brandItem);
        return _.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: _.auth.profileImage.value.isEmpty
                                    ? AssetImage('assets/images/user.png')
                                        as ImageProvider
                                    : FileImage(
                                        File(
                                          _.auth.profileImage.value,
                                        ),
                                      ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: const [
                              Text(
                                "Good Morning",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Talha Anwar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            // Get.toNamed(Routes.NotificationRoute);
                          },
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          alignment: Alignment.centerLeft,
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ).paddingOnly(top: 10),
                    CommonSearchBar().marginOnly(top: 20),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: .78,
                      ),
                      itemCount: _.Items!.length,
                      // itemCount: 2,
                      itemBuilder: (context, i) {
                        bool isSelected = _.isCardSelected(i);
                        return BrandItemCard(i);
                        // return GestureDetector(
                        //   onTap: () {
                        //     // print(i);
                        //     Get.toNamed(
                        //         Routes.DashboardRoute + Routes.carDetailRoute,
                        //         arguments: _.frappeHelper.items?[i]);
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(10)),
                        //       color: Colors.white,
                        //     ),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Stack(
                        //           alignment: Alignment.topRight,
                        //           children: [
                        //             Container(
                        //               width: Get.width,
                        //               height: Get.height / 6.5,
                        //               decoration: BoxDecoration(
                        //                 color: UIDataColors.commontextColor,
                        //                 borderRadius: BorderRadius.only(
                        //                   topLeft: Radius.circular(10),
                        //                   topRight: Radius.circular(10),
                        //                 ),
                        //               ),
                        //               child: Image.network(
                        //                 ServerData.hostname +
                        //                     (_.Items?[i].image ?? ''),
                        //               ),

                        //             ),
                        //             GestureDetector(
                        //               onTap: () {
                        //                 _.toggleFav(i);
                        //               },
                        //               child: Icon(
                        //                 isSelected
                        //                     ? Icons.favorite_outlined
                        //                     : Icons.favorite_border,
                        //                 color: isSelected
                        //                     ? Colors.red
                        //                     : Colors.black,
                        //               ),
                        //             ).marginSymmetric(horizontal: 5),
                        //           ],
                        //         ),
                        //         Text(
                        //           _.Items?[i].name ?? '',
                        //           // _.Items![i].name ?? '',
                        //           // "hhhh",
                        //           style: TextStyle(
                        //               fontSize: 25,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold),
                        //         )
                        //             .paddingSymmetric(horizontal: 10)
                        //             .paddingOnly(top: 5),
                        //         Row(
                        //           children: [
                        //             Icon(
                        //               Icons.star_half_outlined,
                        //               color: Colors.black,
                        //             ),
                        //             Text(
                        //               "4.5",
                        //               style: TextStyle(
                        //                   fontSize: 22,
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold),
                        //             ).paddingSymmetric(horizontal: 5),
                        //           ],
                        //         )
                        //             .paddingSymmetric(horizontal: 10)
                        //             .paddingOnly(top: 5),
                        //         Row(
                        //           children: [
                        //             Text('Rs :',
                        //                     style: TextStyle(
                        //                         fontSize: 20,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.bold))
                        //                 .marginOnly(right: 10),
                        //             Text(
                        //               _.Items != null
                        //                   ? _.Items![i].priceListRate.toString()
                        //                   : '0',
                        //               style: TextStyle(
                        //                   fontSize: 20, color: Colors.black),
                        //             ),
                        //           ],
                        //         )
                        //             .paddingSymmetric(horizontal: 10)
                        //             .paddingOnly(top: 5),
                        //       ],
                        //     ),
                        //   ),
                        // );
                      },
                    )
                  ],
                ).paddingSymmetric(horizontal: 20),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(context),
      showDrawer: false,
      enableHeader: false,
      headerName: false,
      showFAB: false,
      showAppBar: false,
      backGroundColor: UIDataColors.commonblackColor,
      showBottomNav: true,
      actionFirstIcon: false,
    );
  }
}
