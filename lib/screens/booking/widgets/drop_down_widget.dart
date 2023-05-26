import 'package:flutter/material.dart';

class DropDownSelectorWidget extends StatefulWidget {
  bool isDispatchStage;
  DropDownSelectorWidget({
    Key? key,
    required this.isDispatchStage,
  }) : super(key: key);

  @override
  State<DropDownSelectorWidget> createState() => _DropDownSelectorWidgetState();
}

class _DropDownSelectorWidgetState extends State<DropDownSelectorWidget> {
  String? disPatchFrom;
  String? shipTo;
  bool showSelectTraders = false;

  @override
  void initState() {
    super.initState();
    if (widget.isDispatchStage) {
      disPatchFrom = dispatchFromOption[0];
    } else {
      shipTo = dispatchFromOption[1];
    }
  }

  clearSelectedData() {
    widget.isDispatchStage ? disPatchFrom = null : shipTo = null;
    showSelectTraders = true; // Show "Select traders"
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24.0,
            style: const TextStyle(fontSize: 16.0),
            value: widget.isDispatchStage ? disPatchFrom : shipTo,
            onChanged: (String? newValue) {
              if (widget.isDispatchStage) {
                disPatchFrom = newValue;
              } else {
                shipTo = newValue;
              }
              showSelectTraders =
                  false; // Hide "Select traders" when a value is selected
              setState(() {});
            },
            items: [
              ...dispatchFromOption.map(
                (name) => DropdownMenuItem<String>(
                  value: name,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.clear, size: 18),
              onPressed: () {
                clearSelectedData();
              },
            ),
          ),
          if (showSelectTraders)
            const Positioned(
              left: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  'Select traders',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

const List<String> dispatchFromOption = [
  "Balaji Traders",
  "Krishna Pvt Ltd",
  "Jaguar Pvt Ltd"
];
