// flutter imports
import 'dart:io';

import 'package:flutter/material.dart';

// package imports
import 'package:get/get.dart';
import '../../controllers/LikedCard_controller.dart';
import '../../utils/config/config.dart';
import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/forms/textfields/searchBar.dart';

//Dynamic list

class LikedCard extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<LikedCardController>(
      builder: (_) {
        return SingleChildScrollView(
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
                      Get.toNamed(Routes.DashboardRoute);
                    },
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  )
                ],
              ).paddingOnly(top: 10),
              CommonSearchBar().marginOnly(top: 20),
              Obx(() => _.auth.liked.isNotEmpty
                  ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: .78,
                      ),
                      itemCount: _.auth.liked.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                Routes.DashboardRoute + Routes.carDetailRoute,
                                arguments: {
                                  'index': _.auth.liked[index]['index']
                                });
                            // print(_.auth.liked[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      width: Get.width,
                                      height: Get.height / 6.5,
                                      decoration: BoxDecoration(
                                        color: UIDataColors.commontextColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Image.network(
                                        ServerData.hostname +
                                            (_.auth.liked[index]['image'] ??
                                                ''),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // _.toggleFav(index);
                                        _.auth.liked.removeAt(index);
                                      },
                                      child: Icon(
                                        // isSelected
                                        // ?
                                        Icons.favorite_outlined,
                                        //     :
                                        // Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    ).marginSymmetric(horizontal: 5),
                                  ],
                                ),
                                Text(
                                  _.auth.liked[index]['name'] ?? '',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                                    .paddingSymmetric(horizontal: 10)
                                    .paddingOnly(top: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_half_outlined,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ).paddingSymmetric(horizontal: 5),
                                  ],
                                )
                                    .paddingSymmetric(horizontal: 10)
                                    .paddingOnly(top: 5),
                                Row(
                                  children: [
                                    Text('Rs :',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold))
                                        .marginOnly(right: 10),
                                    Text(
                                      _.auth.liked[index]['price'],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ],
                                )
                                    .paddingSymmetric(horizontal: 10)
                                    .paddingOnly(top: 5),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Container()),
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
      showAppBar: false,
      showBottomNav: true,
      backGroundColor: UIDataColors.commonblackColor,
    );
  }
}
