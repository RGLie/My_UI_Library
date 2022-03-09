import 'package:get/get.dart';
import 'package:my_ui_library/data/popular_product_repo.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];  //popular product repo returns data and save it to this list
  List<dynamic> get popularProductList=>_popularProductList;

  Future<void> getpopularProductList() async{
    Response response = await popularProductRepo.getPopularProductionList();

    if(response.statusCode==200){
      //if response succesfful (most http response returns 200)
      _popularProductList=[];//initialize
      //_popularProductList.addAll(); //json->model

      update(); //like a setstate
    }
    else{

    }
  }



}