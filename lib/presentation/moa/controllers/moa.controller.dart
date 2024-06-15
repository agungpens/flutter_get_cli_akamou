import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

class MoaController extends GetxController {
  var mouList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMoaData();
    super.onInit();
  }

  Future<void> fetchMoaData() async {
    try {
      final response = await http.get(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.moaDta));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // Clear previous data before adding new data
        mouList.clear();

        // Add the data to the mouList
        mouList.addAll(jsonData['data']);

        isLoading.value = false; // Set isLoading to false when data is loaded
      } else {
        isLoading.value =
            false; // Ensure isLoading is set to false in case of error
        Get.snackbar('Error data loading!',
            'Server responded : ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      isLoading.value = false; // Set isLoading to false in case of error
      Get.snackbar('Error data loading!', 'Exception: $e');
    }
  }
}
