import 'package:get/get.dart';

class ScreenController extends GetxController {
  var currPage = 0.obs;

  void setPage(int value) {
    currPage.value = value;
  }
}
