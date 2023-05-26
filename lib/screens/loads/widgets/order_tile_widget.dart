import 'package:flutter/material.dart';
import 'package:shypclone/data/order.dart';
import 'package:shypclone/common_widgets/small_chip.dart';
import 'package:shypclone/utils/color_tokens.dart';

class OrderTileWidget extends StatelessWidget {
  const OrderTileWidget({
    Key? key,
    required this.currentOrder,
  }) : super(key: key);

  final Order currentOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
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
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  "Price Pending",
                  style: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                SmallChip(
                  text: currentOrder.status,
                )
              ],
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: iconColor),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentOrder.from,
                              style: const TextStyle(
                                color: iconColor,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              currentOrder.pickupDate,
                              style: const TextStyle(
                                color: iconColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Icon(Icons.flag, color: iconColor),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentOrder.to,
                              style: const TextStyle(
                                color: iconColor,
                                fontSize: 16,
                              ),
                            ),
                            const Text("To be determined"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 24,
                  left: .5,
                  child: Container(
                    height: 45.0,
                    width: 2.0,
                    color: iconColor,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${currentOrder.quantityInTon} Tonne • ${currentOrder.materialType} • ${currentOrder.vehicleType}",
                  style: const TextStyle(
                    color: iconColor,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_right_alt_sharp,
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
