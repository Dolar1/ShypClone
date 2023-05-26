import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shypclone/data/order.dart';
import 'package:shypclone/controllers/get_load_data.dart';
import 'package:shypclone/screens/booking/booking.dart';
import 'package:shypclone/screens/loads/widgets/filter_widget.dart';
import 'package:shypclone/screens/loads/widgets/order_tile_widget.dart';

class OngoingWidget extends StatelessWidget {
  OngoingWidget({super.key});
  final orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderController.totalOrders.length + 1,
      itemBuilder: (_, index) {
        if (index == 0) {
          return const FilterWidget();
        } else {
          Order currentOrder = orderController.totalOrders[index - 1];
          return Padding(
            padding: EdgeInsets.only(
              bottom: orderController.totalOrders.length == index ? 70.0 : 16.0,
            ),
            child: InkWell(
                onTap: () {
                  Get.to(
                    BookingPage(currentOrder: currentOrder),
                    transition: Transition.rightToLeft,
                  );
                },
                child: OrderTileWidget(currentOrder: currentOrder)),
          );
        }
      },
    );
  }
}
