import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';

class MouController extends GetxController {
  var mouList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMouData();
    super.onInit();
  }

  Future<void> fetchMouData() async {
    try {
      isLoading.value = true;
      final response = await http.get(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.mouData));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> dataList = jsonData['data'];

        mouList.value = dataList;
        isLoading.value = false;
      } else {
        isLoading.value = false; // Ensure isLoading is set to false in case of error
        Get.snackbar('Error data loading!', 'Server responded : ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      isLoading.value = false; // Set isLoading to false in case of error
      Get.snackbar('Error data loading!', 'Exception: $e');
    }
  }

  void searchMou(String query) {
    if (query.isEmpty) {
      fetchMouData();
    } else {
      var filteredList = mouList.where((mou) =>
          mou['judul_mou'].toLowerCase().contains(query.toLowerCase()) ||
          mou['kerja_sama_dengan'].toLowerCase().contains(query.toLowerCase())).toList();

      print('Filtered List: $filteredList');
      mouList.assignAll(filteredList);
    }
  }

  void resetMouList() {
    fetchMouData();
  }
}
