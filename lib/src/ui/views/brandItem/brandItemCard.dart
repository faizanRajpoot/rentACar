import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/brandItem_controller.dart';
import '../../../utils/config/config.dart';
import '../../../utils/config/uidata.dart';
import '../../../utils/routes/app_routes.dart';

class BrandItemCard extends StatelessWidget {
  final int index;

  BrandItemCard(this.index);

  @override
  Widget build(context) {
    return GetBuilder<BrandItemController>(
      builder: (_) {
        bool isSelected = _.isCardSelected(index);
        return GestureDetector(
          onTap: () {
            print(index);
            Get.toNamed(
              Routes.DashboardRoute + Routes.carDetailRoute,
               // arguments: _.args.name
                );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        ServerData.hostname + (_.Items?[index].image ?? ''),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _.toggleFav(index);
                      },
                      child: Icon(
                        isSelected
                            ? Icons.favorite_outlined
                            : Icons.favorite_border,
                        color: isSelected ? Colors.red : Colors.black,
                      ),
                    ).marginSymmetric(horizontal: 5),
                  ],
                ),
                Text(
                  _.Items?[index].name ?? '',
                  // _.Items![index].name ?? '',
                  // "hhhh",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ).paddingSymmetric(horizontal: 10).paddingOnly(top: 5),
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
                ).paddingSymmetric(horizontal: 10).paddingOnly(top: 5),
                Row(
                  children: [
                    Text('Rs :',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                        .marginOnly(right: 10),
                    Text(
                      _.Items != null
                          ? _.Items![index].priceListRate.toString()
                          : '0',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10).paddingOnly(top: 5),
              ],
            ),
          ),
        );
      },
    );
  }
}
