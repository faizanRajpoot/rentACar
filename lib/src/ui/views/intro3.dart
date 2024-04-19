
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rent_a_car_skeleton/src/controllers/intro.dart';

import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';

class Intro3Screen extends StatelessWidget {


  Widget bodyData(BuildContext context) {
    return GetBuilder<IntroController>(
      builder: (_) {
        return SafeArea(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'LETS FIND \n THE BEST CAR \n FOR YOU',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: UIDataColors.commontextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Container(
                      height: Get.height / 1.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          image: AssetImage(
                            "assets/images/car3.png",
                          ),
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UIDataColors.commontextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(radiusCircular(50)),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.loginRoute);
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ).paddingSymmetric(vertical: 5),
                    ),
                  ).marginSymmetric(horizontal: 90),
                ],
              ).marginOnly(bottom: 10),
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
      showAppBar: true,
      elevation: 0.0,
      appTitle: " ",
      backGroundColor: UIDataColors.commonblackColor,
      showBottomNav: false,
      actionFirstIcon: false,
    );
  }
}
