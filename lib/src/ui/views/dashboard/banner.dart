import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/utils/config/config.dart';
import '../../../controllers/dashboard_controller.dart';

class DashbaordBanner extends StatelessWidget {
  final int bannerId;

  DashbaordBanner(this.bannerId);

  @override
  Widget build(context) {
    return GetBuilder<DashboardController>(
      builder: (_) {
        return Container(
          height: Get.height / 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(
            children: [
              Container(
                width: Get.width - 30,
                height: Get.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  child: _.banners?[bannerId].image != null
                      ? Image.network(
                          ServerData.hostname +
                              (_.banners?[bannerId].image ?? ''),
                          fit: BoxFit.fill,
                        )
                      : SizedBox(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    _.banners?[bannerId].title ?? '',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ).paddingOnly(right: 25),
                  Text(
                    _.banners?[bannerId].subTitle ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          print("its working");
                        },
                        child: Text(
                          _.banners?[bannerId].action ?? 'yes',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // print("its working");
                        },
                        child: Text(
                          _.banners?[bannerId].actionLabel ?? 'yes 2',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),

                  // Text(
                  //   "Get a new car \n discount,\n only valid week",
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     color: Colors.white,
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ).marginSymmetric(horizontal: 5);
      },
    );
  }
}
