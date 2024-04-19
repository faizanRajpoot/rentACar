import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../utils/config/config.dart';
import '../../../utils/config/uidata.dart';
import '../../../utils/routes/app_routes.dart';

class ItemClass extends StatelessWidget {
  final int index;

  ItemClass(this.index);

  @override
  Widget build(context) {
    return GetBuilder<DashboardController>(
      builder: (_) {
        bool isSelected = _.isCardSelected(index);
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.DashboardRoute + Routes.carDetailRoute,
                arguments: index);

            // print(isSelected);
          },
          child: Container(
            width: Get.width / 2.4,
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
                      height: Get.height / 4.8,
                      decoration: BoxDecoration(
                        color: UIDataColors.commontextColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Image.network(
                        ServerData.hostname +
                            (_.frappeHelper.items?[index].image ?? ''),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _.toggleFav(index);
                        if (!isSelected) {
                          dynamic ss = {
                            'name': _.frappeHelper.items?[index].name,
                            'image': _.frappeHelper.items?[index].image,
                            'price': _.frappeHelper.items != null &&
                                    index >= 0 &&
                                    index < _.frappeHelper.items!.length &&
                                    _.frappeHelper.items?[index]
                                            .priceListRate !=
                                        null
                                ? _.frappeHelper.items![index].priceListRate
                                    .toString()
                                : '0',
                            'index': index
                          };
                          _.auth.liked.add(ss);
                        }
                        if (isSelected) {
                          _.auth.liked.removeAt(index);
                        }
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
                  _.frappeHelper.items?[index].name ?? '',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ).paddingSymmetric(horizontal: 10).paddingOnly(top: 5),
                Row(
                  children: [
                    Icon(
                      Icons.star_half_outlined,
                      color: Colors.black,
                      size: 18,
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
                    Text(
                      'Rs :',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ).marginOnly(right: 10),
                    Text(
                      _.frappeHelper.items != null
                          ? _.frappeHelper.items![index].priceListRate
                              .toString()
                          : '0',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10).paddingOnly(top: 5),
              ],
            ),
          ).marginOnly(right: 10),
        );
      },
    );
  }
}
