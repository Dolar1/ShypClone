import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shypclone/data/order.dart';
import 'package:shypclone/utils/color_tokens.dart';

class LoadStatusWidget extends StatelessWidget {
  final Order currentOrder;
  const LoadStatusWidget({
    super.key,
    required this.currentOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Load Status",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Spacer(),
            CustomStepper(),
            SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentStep = Random().nextInt(5);

  final List<String> steps = [
    "Pending",
    "Quoted",
    "Scheduled",
    "In Progress",
    "Completed",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                steps.length,
                (index) {
                  return Column(
                    children: [
                      CircleStep(
                        stepNumber: index,
                        activeNumber: currentStep,
                        text: steps[index],
                        length: steps.length,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CircleStep extends StatelessWidget {
  final int stepNumber;
  final int activeNumber;
  final String text;
  final int length;

  const CircleStep({
    super.key,
    required this.stepNumber,
    required this.activeNumber,
    required this.text,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        stepNumber < length - 1
            ? Positioned(
                left: 40,
                right: 0,
                top: 10,
                child: Container(
                  height: 5,
                  width: 100,
                  color: (activeNumber > stepNumber)
                      ? iconColor
                      : fadedBottomNavColor,
                ),
              )
            : const SizedBox(),
        stepNumber != 0
            ? Positioned(
                left: 0,
                right: 40,
                top: 10,
                child: Container(
                  height: 5,
                  width: 100,
                  color: (activeNumber >= stepNumber)
                      ? iconColor
                      : fadedBottomNavColor,
                ),
              )
            : const SizedBox(),
        SizedBox(
          width: 85,
          child: Column(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (activeNumber == stepNumber)
                      ? Colors.green
                      : stepNumber < activeNumber
                          ? iconColor
                          : Colors.white,
                  border: Border.all(
                    color: stepNumber <= activeNumber
                        ? Colors.transparent
                        : fadedBottomNavColor,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: stepNumber < activeNumber
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20,
                        )
                      : const SizedBox(),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: stepNumber == activeNumber ? Colors.green : iconColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
