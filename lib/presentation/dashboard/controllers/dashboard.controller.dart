import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';

class DashboardController extends GetxController {
  var dataMitraInstansi = 0.obs;
  var dataMitraLevel = <String, int>{}.obs;
  var dataMitraIndustri = <String, int>{}.obs;
  var jumlahProdi = <String, int>{}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMouData();
    super.onInit();
  }

  Future<void> fetchMouData() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getDataDashboard));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = jsonData['data'];

        dataMitraInstansi.value = data['data_mitra_instansi'];
        dataMitraLevel.value = Map<String, int>.from(data['data_mitra_level']);
        dataMitraIndustri.value = Map<String, int>.from(data['data_mitra_industri']);
        jumlahProdi.value = Map<String, int>.from(data['jumlah_prodi']);

        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar('Error data loading!',
            'Server responded : ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error data loading!', 'Exception: $e');
    }
  }
}
