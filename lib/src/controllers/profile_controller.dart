import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../services/auth_service.dart';

class ProfileController extends GetxController {
  AuthService auth = Get.find<AuthService>();
  RxString profileImage = ''.obs;
  SharedPreferences? prefs1;

  @override
  void onInit() {
    super.onInit();
    auth.loadProfileImagePath();
  }

}
