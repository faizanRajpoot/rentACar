import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car_skeleton/src/utils/routes/app_routes.dart';
import '../../utils/config/config.dart';
import '../../utils/config/uidata.dart';
import '../widgets/common_scaffold.dart';
import '../../controllers/carDetail_controller.dart';

class CarDetail extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<CarDetailController>(
      builder: (_) {
        return Obx(() => _.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: UIDataColors.commonblackColor,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.offAndToNamed(Routes.DashboardRoute);
                                },
                                icon: Icon(Icons.arrow_back),
                                color: Colors.white,
                              ),
                              Text(
                                "Car details",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          width: Get.width,
                          height: Get.height / 3.5,
                          margin: EdgeInsets.all(6.0),
                          child: Image.network(ServerData.hostname +
                              (_.frappeHelper.items?[_.args].image ?? '')),
                        ),
                        SizedBox(height: 20),
                        Text(
                          // "Prado TX Series"
                          _.frappeHelper.items?[_.args].name ?? '',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2),
                        ).marginSymmetric(horizontal: 10, vertical: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                            Icon(
                              Icons.star_half_outlined,
                              color: Colors.white,
                              size: 14,
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ).paddingSymmetric(horizontal: 5),
                          ],
                        )
                            .paddingSymmetric(horizontal: 10)
                            .marginSymmetric(vertical: 10),
                        Row(
                          children: [
                            Text('Rs :',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500))
                                .marginOnly(right: 10),
                            Text(
                              _.frappeHelper.items != null &&
                                      _.args >= 0 &&
                                      _.args < _.frappeHelper.items!.length &&
                                      _.frappeHelper.items?[_.args]
                                              .priceListRate !=
                                          null
                                  ? _.frappeHelper.items![_.args].priceListRate
                                      .toString()
                                  : '0',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 10),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).marginSymmetric(horizontal: 10, vertical: 10),
                        Text(
                          "Prado perday rent in Lahore is 10000Rs with driver for 12 hours.\nWithout the driver, Prado rent is 17000rs in the city.\nOutstation rent for Prado is 18000 for 24 hours.",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 1),
                        ).marginSymmetric(horizontal: 10),
                        Text(
                          "Features",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).marginSymmetric(horizontal: 10, vertical: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    // "Auto Gears"

                                    _.frappeHelper.items?[_.args]
                                            .vehicleModel ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ).marginOnly(left: 10),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    // "Auto Gears"
                                    _.frappeHelper.items?[_.args]
                                            .vehicleEngineType ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ).marginOnly(left: 10),
                                ],
                              ),
                            ),
                          ],
                        ).marginSymmetric(horizontal: 10, vertical: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    _.frappeHelper.items?[_.args]
                                            .vehicleColor ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        letterSpacing: 1),
                                  ).marginOnly(left: 10),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    _.frappeHelper.items?[_.args].vehicleYear ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ).marginOnly(left: 10),
                                ],
                              ),
                            ),
                          ],
                        ).marginSymmetric(horizontal: 10, vertical: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        // "Auto Gears"
                                        _.frappeHelper.items?[_.args]
                                                .initialMileage ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ).marginOnly(left: 10),
                                      Text(
                                        "Km",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ).marginOnly(left: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    _.frappeHelper.items?[_.args].vehicleType ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ).marginOnly(left: 10),
                                ],
                              ),
                            )
                          ],
                        ).marginSymmetric(horizontal: 10, vertical: 5),
                        Text(
                          "More Details",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).marginSymmetric(horizontal: 10, vertical: 10),
                        Text(
                          "Contact Us : +92 308 4522212",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).marginSymmetric(horizontal: 10),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DashboardRoute + Routes.BookingRoute,
                              // arguments: {'index': _.args}
                            );
                            // print(_.frappeHelper.items);

                            // print('car Image : ${index}');
                          },
                          child: Container(
                            width: double.infinity,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ).paddingSymmetric(vertical: 5),
                            )
                                .marginSymmetric(horizontal: 30)
                                .marginOnly(top: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
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
      elevation: 0.0,
      appTitle: " ",
      backGroundColor: UIDataColors.commonblackColor,
      showBottomNav: false,
      actionFirstIcon: false,
    );
  }
}
