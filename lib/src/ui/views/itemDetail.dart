// ignore_for_file: prefer_const_literals_to_create_immutables, unused_import

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../utils/config/config.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/forms/textfields/searchBar.dart';
import 'itemDetail/itemdetailCard.dart';
import '../../utils/config/uidata.dart';
import '../widgets/common_scaffold.dart';
import '../../services/auth_service.dart';
import 'package:rent_a_car_skeleton/src/controllers/ItemDetail_controller.dart';

class ItemDetail extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<ItemDetailController>(
      builder: (_) {
        return _.isLoading
            ? Center(
                child: CircularProgressIndicator(),
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
                          onPressed: () {
                            Get.toNamed(
                                Routes.DashboardRoute + Routes.LikedCardRoutes);
                          },
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
                      itemCount: _.frappeHelper.items!.length,
                      itemBuilder: (context, index) {
                        return ItemDetailCard(index);
                      },
                    ).marginOnly(bottom: 15)
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
