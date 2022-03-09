import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_ui_library/controllers/popular_product_controller.dart';
import 'package:my_ui_library/data/api_client.dart';
import 'package:my_ui_library/data/popular_product_repo.dart';

Future<void> init()async {

  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: "url"));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}