// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rent_a_car_skeleton/src/models/error.dart';
import 'package:rent_a_car_skeleton/src/services/restclient.dart';
import 'package:rent_a_car_skeleton/src/utils/routes/app_routes.dart';
import '../models/login.dart';
import '../models/signUp.dart';

class AuthService extends GetxService {
  String? myloggedInStatus;
  RestClient restClient = Get.find<RestClient>();
  String? loggedInUser;
  late SharedPreferences prefs;
  late SharedPreferences? prefsImg;
  RxString profileImage = ''.obs;
  List liked = [].obs;
  

  Future<AuthService> init() async {
    prefs = await SharedPreferences.getInstance();
    isLoggedIn();
    return this;
  }

  Future<bool> login(String username, String password) async {
    LoginRequest req = LoginRequest.fromJson({
      'usr': username,
      'pwd': password,
      'device': 'mobile',
    });
    try {
      LoginResponse res = await restClient.login(req);
      if (res.userId != null) loggedInUser = res.userId;

      print('---- $loggedInUser');
      await prefs.setString("loggedInUser", loggedInUser!);
      {
        loggedInUser = res.userId;
        return true;
      }
    } catch (e) {
      e as ErrorResponse;
      print(e.statusMessage);
    }
    loggedInUser = null;
    return false;
  }

  bool isLoggedIn() {
    String? loggedInStatus = prefs.getString('loggedInUser');
    myloggedInStatus = loggedInStatus;
    return myloggedInStatus != null;
  }

  final List<int> selectedCardIndices = [];

  void toggleFav(int index) {
    if (selectedCardIndices.contains(index)) {
      selectedCardIndices.remove(index);
    } else {
      selectedCardIndices.add(index);
    }
    // update();
  }

  final picker = ImagePicker();

  Future<String?> imagePicker() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      await prefs.setString("storedPath", pickedImage.path);
      return pickedImage.path;
    } else {
      print("Something is wrong");
    }

    return null;
  }

  Future<void> loadProfileImagePath() async {
    prefsImg = await SharedPreferences.getInstance();
    String? storedPath = prefsImg!.getString('storedPath');
    if (storedPath != null && loggedInUser == null) {
      profileImage.value = storedPath;
    }
  }

  void selectImage() async {
    String? profileImagePath = await imagePicker();
    if (profileImagePath != null) {
      profileImage(profileImagePath);
    } else {
      print('got null');
    }
  }

  Future<bool> register(SignUp signup) async {
    final response = await restClient.sendRequest(
      '/method/signup',
      data: signup.toJson(),
      type: RequestType.post,
    );
    return true;
  }

  Future<dynamic> getLoggedOutUser() async {
    prefs.clear();
    Get.offAndToNamed(Routes.loginRoute);
    prefsImg?.clear();
  }
}
