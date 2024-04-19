import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/dashboard_controller.dart';
import 'package:rent_a_car_skeleton/src/ui/views/dashboard/carBrands.dart';
import 'package:rent_a_car_skeleton/src/ui/widgets/forms/textfields/searchBar.dart';
import 'package:rent_a_car_skeleton/src/utils/routes/app_routes.dart';
import '../../utils/config/uidata.dart';
import '../widgets/common_scaffold.dart';
import 'dashboard/banner.dart';
import 'dashboard/items.dart';

class Dashboard extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) {
        return _.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : SingleChildScrollView(
                primary: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    CommonSearchBar()
                        .marginOnly(top: 20)
                        .marginSymmetric(horizontal: 10),

                    // horizontal scroll
                    SingleChildScrollView(
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        ...getBanners(_),
                      ]),
                    ).marginOnly(top: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // _.getItemData();
                            // Get.toNamed(
                            //     Routes.DashboardRoute + Routes.ItemDetailRoute);
                          },
                          child: Text(
                            "See All",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 85,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        primary: false,
                        itemCount: _.frappeHelper.brands!.length,
                        itemBuilder: (context, index) {
                          return CarBrands(index);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(
                                Routes.DashboardRoute + Routes.ItemDetailRoute);
                          },
                          child: Text(
                            "See All",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),

                    // listview
                    SizedBox(
                      height: Get.height / 3.2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ItemClass(index);
                        },
                      ),
                    )
                  ],
                ),
              ).marginSymmetric(horizontal: 10);
      },
    );
  }

  List<Widget> getBanners(DashboardController _) {
    List<Widget> w = [];
    for (int i = 0; i < _.banners!.length; i++) {
      if (_.banners?[i].image != null) {
        w.add(DashbaordBanner(i));
      } else {
        print('---- empty banner');
      }
    }
    return w;
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
