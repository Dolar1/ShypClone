import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shypclone/data/order.dart';
import 'package:shypclone/utils/color_tokens.dart';
import 'package:shypclone/common_widgets/cta_button.dart';
import 'package:shypclone/common_widgets/bottom_sheet.dart';
import 'package:shypclone/screens/booking/widgets/load_status_widget.dart';
import 'package:shypclone/screens/booking/widgets/total_price_widget.dart';
import 'package:shypclone/screens/booking/widgets/order_detail_tile_widget.dart';

class BookingPage extends StatelessWidget {
  final Order currentOrder;
  const BookingPage({
    super.key,
    required this.currentOrder,
  });

  void _showBottomSheet(BuildContext context, Order currentOrder) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return BottomSheetWidget(currentOrder: currentOrder);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: bottomNav,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'item1') {
                // Perform action for item 1
              } else if (value == 'item2') {
                // Perform action for item 2
              }
            },
            itemBuilder: (BuildContext context) => const [
              PopupMenuItem<String>(
                value: 'item1',
                child: Text('Get Bill'),
              ),
              PopupMenuItem<String>(
                value: 'item2',
                child: Text('Get Info'),
              ),
            ],
          ),
        ],
        title: Text(
          "Order: #${currentOrder.orderId.toString()}",
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            children: [
              OrderDetailTileWidget(currentOrder: currentOrder),
              const SizedBox(height: 15),
              LoadStatusWidget(currentOrder: currentOrder),
              const SizedBox(height: 15),
              TotalPriceWidget(currentOrder: currentOrder),
              const SizedBox(height: 15),
              CtaButton(
                buttonText: "Confirm Load Booking",
                isConfirm: true,
                onPressed: () {
                  _showBottomSheet(context, currentOrder);
                },
              ),
              const SizedBox(height: 15),
              CtaButton(
                buttonText: "Cancel",
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
