import 'dart:convert';
import 'package:get/get.dart';
import 'package:shypclone/data/order.dart';
import 'package:flutter/services.dart' show rootBundle;

class OrderController extends GetxController {
  var isOrderDataLoaded = false.obs;
  List<Order> totalOrders = <Order>[].obs;

  @override
  void onInit() {
    getLoadData();
    super.onInit();
  }

  Future<List<Order>> getLoadData() async {
    isOrderDataLoaded(true);
    Map<String, dynamic> jsonData =
        await readJsonFile('assets/data/load_data.json');
    List<Order> orders = (jsonData['data'] as List<dynamic>)
        .map((e) => Order.fromJson(e as Map<String, dynamic>))
        .toList();
    await Future.delayed(const Duration(seconds: 2));
    isOrderDataLoaded(false);
    totalOrders = orders;
    return orders;
  }

  Future<Map<String, dynamic>> readJsonFile(String filePath) async {
    Map<String, dynamic> jsonData = await parseJsonFromAssets(filePath);
    return jsonData;
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
