import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';

class MouDetailController extends GetxController {
  var isLoading = true.obs;
  late int mouId;
  var mouData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    mouId = Get.arguments ?? 0;
    print("Received MOU ID: $mouId");
    if (mouId != 0) {
      getDataById(mouId);
    } else {
      Get.snackbar('Error', 'Invalid MOU ID');
      isLoading.value = false;
    }
  }

  Future<void> getDataById(int id) async {
    try {
      final response = await http.get(Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.authEndPoints.mouDetailData +
          '?id=$id'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        mouData.value = jsonData['data'];
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
