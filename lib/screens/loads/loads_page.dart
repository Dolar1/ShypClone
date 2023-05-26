import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shypclone/common_widgets/loader.dart';
import 'package:shypclone/controllers/get_load_data.dart';
import 'package:shypclone/screens/loads/widgets/on_going_widget.dart';
import 'package:shypclone/screens/loads/widgets/past_order_widget.dart';
import 'package:shypclone/utils/color_tokens.dart';

class LoadsPage extends StatefulWidget {
  const LoadsPage({super.key});

  @override
  State<LoadsPage> createState() => _LoadsPageState();
}

class _LoadsPageState extends State<LoadsPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final OrderController orderController = Get.put(OrderController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: bottomNav,
        title: const Text(
          'My Loads',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: activeRed,
          indicatorWeight: 5,
          labelColor: activeRed,
          unselectedLabelColor: Colors.black,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          tabs: const <Widget>[
            Tab(
              child: Text("Ongoing"),
            ),
            Tab(
              child: Text("Past"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            Obx(
              () {
                return orderController.isOrderDataLoaded.value
                    ? const Loader()
                    : OngoingWidget();
              },
            ),
            const PastOrder()
          ],
        ),
      ),
    );
  }
}
