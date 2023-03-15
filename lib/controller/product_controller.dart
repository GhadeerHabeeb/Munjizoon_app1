import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munjizoon_app/MainScreen/StagesList.dart';
import 'package:munjizoon_app/lessonScreen/widget/Favorate.dart';


class ProductController extends GetxController
{

  var productsList=<StageItems>[].obs;
  var favoriteList=<String>[].obs;
  final deleting=false.obs;


  var isLoading=true.obs;
  //search
  var searchList=[].obs;
  TextEditingController searchTextController=TextEditingController();

@override
void onInit(){
  super.onInit();
 /* getProducts();*/
}
  void changeDeleting(bool value)
  {
    deleting.value=value;
  }
  void deleteTask(Favorites task)
  {
    favoriteList.remove(task);
  }

/*void  getProducts() async{

 var products= await  ProductServices.getProduct();
 try{
   isLoading(true);
   if(products.isNotEmpty)
  {
    productsList.addAll(products);
  }
 }
 finally
 {
   isLoading(false);
 }
  }*/
  //logic Favorite screen
/*
void ManageFavorites( int productId)
{



    favoriteList.add(
        items.firstWhere((element) => element.Id == productId));
    print(favoriteList);

}


bool isFavorate(int productId){
  return favoriteList.any((element) => element.Id == productId);
}
*/

//search bar logic

/*void addSearchToList(String searchNamed)
{
   searchNamed=searchNamed.toLowerCase();

  searchList.value =productsList.where((search){
    var searchTitle=search.title.toLowerCase();
    var searchPrice=search.price.toString().toLowerCase();
    return searchTitle.contains(searchNamed)||
        searchPrice.contains(searchNamed);
  }).toList();
  update();
}*/
/*void ClearSearch()

{
searchTextController.clear();
addSearchToList("");
}*/

}