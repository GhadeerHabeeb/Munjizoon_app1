import 'package:get/get.dart';


class AuthController extends GetxController{
bool isVisibilty=false;
bool isCheck=false;
bool isSelected=false;
bool isActive=false;

void visibilty(){
  isVisibilty=!isVisibilty;

  update(

  );
}
void Active() {
   isActive=!isActive;

  update(

  );
}
void Checkbox(){
  isCheck=!isCheck;

  update(

  );

}
void selected(){
  isSelected=!isSelected;

  update(

  );

}

}

//getxbuilder اذا عندي شغل قليل
// gox