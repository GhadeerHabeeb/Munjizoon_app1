import 'package:get/get.dart';
import 'package:munjizoon_app/FavorateScreen/SavedLectures.dart';
import 'package:munjizoon_app/HomePage.dart';
import 'package:munjizoon_app/MainScreen/main_screen.dart';
import 'package:munjizoon_app/search_screen/SearchScreen.dart';


//data always change we use =>obx
class MainController extends GetxController{

RxInt currentIndex=0.obs;

final tabs=[
  MainScreen(),
  SavedLectures(),
  SearchScreen(),


].obs;

final title=[
  'munjizoon',
  'Favorate',
  'search'
];
}