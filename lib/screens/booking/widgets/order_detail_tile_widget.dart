import 'package:flutter/material.dart';
import 'package:shypclone/data/order.dart';
import 'package:shypclone/utils/color_tokens.dart';

class OrderDetailTileWidget extends StatelessWidget {
  const OrderDetailTileWidget({
    Key? key,
    required this.currentOrder,
  }) : super(key: key);

  final Order currentOrder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 275,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pickup Location",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      currentOrder.from,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Drop Location",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      currentOrder.to,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Spacer(),
                OrderDetails(
                  leftText: "Order ID",
                  rightText: currentOrder.orderId.toString(),
                ),
                OrderDetails(
                  leftText: "Pickup Date",
                  rightText: currentOrder.pickupDate,
                ),
                OrderDetails(
                  leftText: "Preferred Vehicle",
                  rightText: currentOrder.vehicleType,
                ),
                OrderDetails(
                  leftText: "Quantity of load",
                  rightText: currentOrder.quantityInTon.toString(),
                ),
                OrderDetails(
                  leftText: "Material Type",
                  rightText: currentOrder.materialType,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          child: SizedBox(
            // height: 50,
            // width: 50,
            child: Image.asset("assets/icons/big_truck.png"),
          ),
        ),
      ],
    );
  }
}

class OrderDetails extends StatelessWidget {
  final String leftText;
  final String rightText;

  const OrderDetails({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            leftText,
            style: const TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          Text(
            rightText,
            style: const TextStyle(color: iconColor),
          ),
        ],
      ),
    );
  }
}
