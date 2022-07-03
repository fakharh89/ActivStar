import 'dart:math';

import 'package:activestar/models/item_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppController extends GetxController with StateMixin {
  RxBool isLoading = true.obs;
  RxList<Item> items = <Item>[].obs;
  RxInt randomnum = 0.obs;
  RxDouble slidervalue = 0.0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    final response = await http
        .get(Uri.parse('https://appka.activstar.eu/wp-json/app/testimonials'));
    change(null, status: RxStatus.loading());

    if (response.statusCode == 200) {
      items.value = Items.fromJson(json.decode(response.body)).itemslist;
      isLoading.value = false;
      change(null, status: RxStatus.success());
      randomnum.value = random(0, items.length);
      items.forEach((element) {
        print(element.title);
      });
      return;
    } else {
      throw Exception('Failed to load data');
    }
  }

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  @override
  void onClose() {
    super.onClose();
    isLoading.value = false;
    items.clear();
  }
}
