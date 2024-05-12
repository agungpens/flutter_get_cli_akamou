import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_cli/domain/core/interfaces/models/api_mou_model.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';

class MouController extends GetxController {
  var mouList = <MouData>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMouData();
    super.onInit();
  }

  Future<void> fetchMouData() async {
    try {
      final response = await http.get(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.mouData));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> dataList = jsonData['data'];
        // return print(dataList);
        // Clear previous data before adding new data
        mouList.clear();

        // Loop through the data list and add MouData objects to mouList
        for (var item in dataList) {
          mouList.add(
            MouData(
              id: int.parse(item['id'].toString()),
              nomorMou: item['nomor_mou'],
              judulMou: item['judul_mou'],
              jenisDoc: int.parse(item['jenis_doc'].toString()),
              tanggalDibuat: item['tanggal_dibuat'],
              tanggalBerakhir: item['tanggal_berakhir'],
              fileMou: item['file_mou'],
              filePath: item['file_path'],
              levelMou: int.parse(item['level_mou'].toString()),
              kategoriMou: KategoriMou.fromJson(item['kategori_mou']),
              relevansiProdi: int.parse(item['relevansi_prodi'].toString()),
              status: item['status'],
              kerjaSamaDengan: item['kerja_sama_dengan'],
              createdAt: item['created_at'],
              updatedAt: item['updated_at'],
              deletedAt: item['deleted_at'],
              levelDocMou: LevelDocMou.fromJson(item['level_doc_mou']),
              jenisMou: JenisMou.fromJson(item['jenis_mou']),
              relevansiProdiMou:
                  RelevansiProdiMou.fromJson(item['relevansi_prodi_mou']),
            ),
          );
        }

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
