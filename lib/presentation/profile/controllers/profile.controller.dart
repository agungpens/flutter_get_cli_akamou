import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var userData = {}.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getUserIdAndFetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getUserIdAndFetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? idUser = prefs.getInt('id_user');
    if (idUser != null) {
      getDataUser(idUser);
    } else {
      Get.snackbar('Error', 'User ID not found');
      isLoading.value = false;
    }
  }

  Future<void> getDataUser(int id) async {
    try {
      isLoading.value = true;
      final response = await http.post(Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.detailUser}?id=$id'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['is_valid']) {
          userData.value = jsonData['data'];
        } else {
          Get.snackbar('Error', 'Invalid data received');
        }
      } else {
        Get.snackbar('Error data loading!', 'Server responded: ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      Get.snackbar('Error data loading!', 'Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
