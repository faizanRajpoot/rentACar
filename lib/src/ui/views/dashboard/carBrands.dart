import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../utils/config/config.dart';
import '../../../utils/routes/app_routes.dart';

class CarBrands extends StatelessWidget {
  final int index;

  CarBrands(this.index);

  @override
  Widget build(context) {
    return GetBuilder<DashboardController>(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            Get.offAndToNamed(Routes.DashboardRoute + Routes.BrandDetailRoute,
                arguments: _.frappeHelper.brands?[index]);

            // print('name: ${_.brands?[index].name}');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 75, 75, 75),
                  child: Container(
                    child: Image.network(
                      ServerData.hostname + (_.frappeHelper.brands?[index].image ?? ''),
                    ),
                  ).paddingAll(10),
                ),
              ),
              Text(
                _.frappeHelper.brands?[index].name ?? '',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ).marginOnly(left: 12),
        );
      },
    );
  }
}
