import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shypclone/data/order.dart';
import 'package:shypclone/screens/booking/widgets/drop_down_widget.dart';
import 'package:shypclone/utils/color_tokens.dart';
import 'package:shypclone/common_widgets/cta_button.dart';

class BottomSheetWidget extends StatefulWidget {
  final Order currentOrder;
  const BottomSheetWidget({
    super.key,
    required this.currentOrder,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  bool isNextButtonActive = true;

  updateNext(bool value) {
    isNextButtonActive = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      expand: true,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: bottomNav,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  isNextButtonActive
                      ? "Consignor Details (Dispatch From)"
                      : "Consignor Details (Ship To)",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                DropDownSelectorWidget(isDispatchStage: isNextButtonActive),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        isNextButtonActive
                            ? widget.currentOrder.from
                            : widget.currentOrder.to,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "+ Add new Consignor Contact",
                        style: TextStyle(
                          color: activeRed,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                isNextButtonActive
                    ? CtaButton(
                        buttonText: "Next",
                        isRedFilled: true,
                        isFullWidth: true,
                        onPressed: () => updateNext(false),
                      )
                    : Row(
                        children: [
                          CtaButton(
                            buttonText: "Back",
                            isRedFilled: true,
                            isFullWidth: false,
                            onPressed: () => updateNext(true),
                          ),
                          const Spacer(),
                          CtaButton(
                            buttonText: "Confirm",
                            isRedFilled: true,
                            isFullWidth: false,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
