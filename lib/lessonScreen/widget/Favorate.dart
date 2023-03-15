import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/StagesList.dart';
import 'package:munjizoon_app/controller/product_controller.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class Favorites with ChangeNotifier {
  final  controller=Get.find<ProductController>();

  List<String> get items =>controller.favoriteList;

  void add(String itemNo) {
    controller.favoriteList.add(itemNo);
    notifyListeners();
  }

  void remove(String itemNo) {
    controller.favoriteList.remove(itemNo);
    notifyListeners();
  }
}