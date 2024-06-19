import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

class MoaController extends GetxController {
  var mouList = [].obs;
  var isLoading = true.obs;
  var allMouList = [].obs; // To store the original data

  @override
  void onInit() {
    fetchMoaData();
    super.onInit();
  }

  Future<void> fetchMoaData() async {
    try {
      isLoading.value = true;
      final response = await http.get(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.moaDta));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // Clear previous data before adding new data
        mouList.clear();
        allMouList.clear();

        // Add the data to the lists
        mouList.addAll(jsonData['data']);
        allMouList.addAll(jsonData['data']);

        isLoading.value = false; // Set isLoading to false when data is loaded
      } else {
        isLoading.value = false; // Ensure isLoading is set to false in case of error
        Get.snackbar('Error data loading!', 'Server responded : ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      isLoading.value = false; // Set isLoading to false in case of error
      Get.snackbar('Error data loading!', 'Exception: $e');
    }
  }

  void searchMoa(String query) {
    if (query.isEmpty) {
      mouList.assignAll(allMouList);
    } else {
      mouList.assignAll(allMouList.where((mou) =>
          mou['judul_moa'].toLowerCase().contains(query.toLowerCase()) ||
          mou['kerja_sama_dengan'].toLowerCase().contains(query.toLowerCase())));
    }
  }

  void resetMouList() {
    fetchMoaData();
  }
}
