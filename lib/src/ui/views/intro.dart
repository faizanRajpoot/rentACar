// flutter imports
import 'package:flutter/material.dart';

// package imports
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rent_a_car_skeleton/src/utils/routes/app_routes.dart';

import '../../controllers/intro.dart';
import '../../utils/config/uidata.dart';
import '../widgets/common_scaffold.dart';

//Dynamic list

class IntroScreen extends StatelessWidget {
  Widget bodyData(BuildContext context) {
    return GetBuilder<IntroController>(
      builder: (_) {
        return SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Text(
                    'ELEGANCE',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      color: UIDataColors.commontextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Container(
                      height: Get.height / 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          alignment: Alignment.centerRight,
                          image: AssetImage(
                            "assets/images/car1.png",
                          ),
                          fit: BoxFit.cover,
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
                        Get.toNamed(Routes.intro2Route);
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
      showAppBar: true,
      backGroundColor: UIDataColors.commonblackColor,
    );
  }
}
