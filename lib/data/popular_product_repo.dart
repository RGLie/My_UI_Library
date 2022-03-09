import 'package:get/get.dart';
import 'package:my_ui_library/data/api_client.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({ required this.apiClient});

  Future<Response> getPopularProductionList() async{
    return await apiClient.getData("end point url");//http:
  }
}