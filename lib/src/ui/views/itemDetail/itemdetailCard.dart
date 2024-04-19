import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/controllers/ItemDetail_controller.dart';
import '../../../utils/config/config.dart';
import '../../../utils/config/uidata.dart';
import '../../../utils/routes/app_routes.dart';

class ItemDetailCard extends StatelessWidget {
  final int index;

  ItemDetailCard(this.index);

  @override
  Widget build(context) {
    return GetBuilder<ItemDetailController>(
      builder: (_) {
        bool isSelected = _.isCardSelected(index);
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.DashboardRoute + Routes.carDetailRoute,
                arguments: index);
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
                        ServerData.hostname +
                            (_.frappeHelper.items?[index].image ?? ''),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _.toggleFav(index);
                        if (!isSelected) {
                          var ss = {
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
                    ),
                  ],
                ),
                Text(
                  _.frappeHelper.items?[index].name ?? '',
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
                      _.frappeHelper.items != null &&
                              _.frappeHelper.items?[index].priceListRate != null
                          ? _.frappeHelper.items![index].priceListRate
                              .toString()
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
