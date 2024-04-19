import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rent_a_car_skeleton/src/controllers/booking_controller.dart';

import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';

// widgets

//Dynamic list

class Booking extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<BookingController>(
      builder: (_) {
        return _.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: UIDataColors.commonblackColor,
                  // margin: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            // color: UIDataColors.commonblackColor,
                            child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.DashboardRoute);
                                },
                                icon: Icon(Icons.arrow_back,
                                    color: Colors.white)),
                            Text(
                              "Booking ",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        )).marginSymmetric(vertical: 20),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: Get.width,
                              height: Get.height / 20,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Text(
                                // "Prado TX Series"
                                _.Items?[_.index].name ?? '',

                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 2),
                              ).paddingSymmetric(horizontal: 10),
                            )
                                .marginSymmetric(horizontal: 20)
                                .marginOnly(bottom: 20),
                            TextField(
                              cursorHeight: 20,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              autofocus: false,
                              controller: _.customer,
                              decoration: InputDecoration(
                                hintText: "Customer Name",
                                hintStyle: TextStyle(color: Colors.white),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 0.0,
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5),
                                ),
                              ),
                            ).marginSymmetric(horizontal: 20),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Get.width / 2.3,
                                    child: TextFormField(
                                      cursorHeight: 20,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                        hintText: "Start Date Time",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                      ),
                                      controller: _.dateCtl2,
                                      onTap: () async {
                                        DateTime? date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100));

                                        if (date != null) {
                                          _.dateCtl2.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(date);
                                        }
                                        // _.dateCtl2.text = date.toString();
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: Get.width / 2.3,
                                    child: TextFormField(
                                      cursorHeight: 20,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                        hintText: "End Date Time",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                      ),
                                      controller: _.dateCtl3,
                                      onTap: () async {
                                        DateTime? date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100));
                                        if (date != null) {
                                          _.dateCtl3.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(date);
                                        }
                                        // _.dateCtl3.text = date.toString();
                                      },
                                    ),
                                  ),
                                ],
                              ).marginSymmetric(horizontal: 20, vertical: 20),
                            ),
                            // TextField(
                            //   cursorHeight: 20,
                            //   cursorColor: Colors.white,
                            //   style: TextStyle(color: Colors.white),
                            //   autofocus: false,
                            //   keyboardType: TextInputType.numberWithOptions(
                            //       decimal: true),
                            //   controller: TextEditingController(),
                            //   decoration: InputDecoration(
                            //     hintText: "Reference",
                            //     hintStyle: TextStyle(color: Colors.white),
                            //     contentPadding: const EdgeInsets.symmetric(
                            //         vertical: 10, horizontal: 10),
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //       borderSide:
                            //           BorderSide(color: Colors.white, width: 2),
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //       borderSide: BorderSide(
                            //           color: Colors.white, width: 1.5),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       gapPadding: 0.0,
                            //       borderRadius: BorderRadius.circular(10),
                            //       borderSide: BorderSide(
                            //           color: Colors.white, width: 1.5),
                            //     ),
                            //   ),
                            // )
                            //     .marginSymmetric(horizontal: 20)
                            //     .marginOnly(bottom: 20),
                            Container(
                              width: Get.width,
                              child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        hintText: "Reference",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                      ),
                                      iconEnabledColor: UIDataColors.white,
                                      value: _.refValue,
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'Talha Anwar',
                                          child: Text('Talha Anwar'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Abdullah Asif',
                                          child: Text('Abdullah Asif'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Murtaza Khalil',
                                          child: Text('Murtaza Khalil'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Shoaib Sarwar',
                                          child: Text('Shoaib Sarwar'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        _.refValue = value;
                                      })
                                  .marginSymmetric(horizontal: 20)
                                  .marginOnly(bottom: 20),
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Get.width / 2.3,
                                  child: TextField(
                                    cursorHeight: 20,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    autofocus: false,
                                    // keyboardType: TextInputType.numberWithOptions(
                                    //     decimal: true),
                                    controller: TextEditingController(),
                                    decoration: InputDecoration(
                                      hintText: "Pick From",
                                      hintStyle: TextStyle(color: Colors.white),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        gapPadding: 0.0,
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.5),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    width: Get.width / 2.3,
                                    child: TextField(
                                      cursorHeight: 20,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      autofocus: false,
                                      controller: TextEditingController(),
                                      decoration: InputDecoration(
                                        hintText: "Drop To",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                      ),
                                    )),
                              ],
                            ).marginSymmetric(horizontal: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: Get.width / 2.3,
                                  height: Get.height / 20,
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: Row(
                                    children: [
                                      Text('Rs :',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500))
                                          .marginOnly(right: 10),
                                      Text(
                                        _.Items != null &&
                                                _.index >= 0 &&
                                                _.index < _.Items!.length &&
                                                _.Items?[_.index]
                                                        .priceListRate !=
                                                    null
                                            ? _.Items![_.index].priceListRate
                                                .toString()
                                            : '0',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ).paddingSymmetric(horizontal: 10),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: Get.width / 2.3,
                                  height: Get.height / 20,
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: Row(
                                    children: [
                                      Text('Rs :',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500))
                                          .marginOnly(right: 10),
                                      Text(
                                        _.Items != null &&
                                                _.index >= 0 &&
                                                _.index < _.Items!.length &&
                                                _.Items?[_.index]
                                                        .priceListRate !=
                                                    null
                                            ? _.Items![_.index].priceListRate
                                                .toString()
                                            : '0',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ).paddingSymmetric(horizontal: 10),
                                ),
                              ],
                            ).marginSymmetric(horizontal: 20, vertical: 20),
                            Container(
                              width: Get.width - 120,
                              height: Get.height / 15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(radiusCircular(100))),
                              child: TextButton(
                                onPressed: () {
                                  // _.customer.clear();
                                  // _.dateCtl2.clear();
                                  // _.dateCtl3.clear();
                                  // Get.toNamed(Routes.DashboardRoute);

                                  print("All Ok");
                                },
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic,
                                      color: UIDataColors.commonblackColor),
                                ),
                              ),
                            ).marginOnly(top: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
      elevation: 0.0,
      appTitle: " ",
      backGroundColor: UIDataColors.commonblackColor,
      showBottomNav: false,
      actionFirstIcon: false,
    );
  }
}
