import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

class MasterTemplateController extends GetxController {
  var listData = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      final response = await http.get(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getDataMasterTemplate));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> dataList = jsonData['data'];

        listData.value = dataList;
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

  void searchData(String query) {
    if (query.isEmpty) {
      fetchData();
    } else {
      var filteredList = listData.where((data) =>
          data['nama_template'].toLowerCase().contains(query.toLowerCase()) ||
          data['file'].toLowerCase().contains(query.toLowerCase()) ||
          data['nama_jenis'].toLowerCase().contains(query.toLowerCase())).toList();

      print('Filtered List: $filteredList');
      listData.assignAll(filteredList);
    }
  }

  void resetlistData() {
    fetchData();
  }

}
