import 'dart:convert';
import 'package:get_cli/domain/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
class MoaDetailController extends GetxController {
  var isLoading = true.obs;
  late int moaId;
  var moaData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    moaId = Get.arguments ?? 0;
    print("Received MOa ID: $moaId");
    if (moaId != 0) {
      getDataById(moaId);
    } else {
      Get.snackbar('Error', 'Invalid MOa ID');
      isLoading.value = false;
    }
  }

  Future<void> getDataById(int id) async {
    try {
      final response = await http.get(Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.authEndPoints.moaDetailData +
          '?id=$id'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['is_valid']) {
          moaData.value = jsonData['data'][0];
        } else {
          Get.snackbar('Error', 'Invalid data received');
        }
      } else {
        Get.snackbar('Error data loading!',
            'Server responded : ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      Get.snackbar('Error data loading!', 'Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
