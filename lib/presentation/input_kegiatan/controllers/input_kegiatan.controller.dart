import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';
import 'package:flutter/material.dart';

class InputKegiatanController extends GetxController {
  var instansiList = <String>[].obs;
  var isLoading = true.obs;
  final nomorMouController = TextEditingController(); // Tambahkan ini
  final nomorMoaController = TextEditingController(); // Tambahkan ini

  @override
  void onInit() {
    getDataInstansi();
    super.onInit();
  }

  Future<void> getDataInstansi() async {
    try {
      final response = await http.get(Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.listInstansi));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        final List<dynamic> dataList = jsonData['data_instansi'];

        instansiList
            .assignAll(dataList.map((item) => item.toString()).toList());

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

  Future<void> searchDataByInstansi(String namaMitra) async {
    try {
      final response = await http.post(Uri.parse(
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.searchDataByInstansi}?instansi=$namaMitra'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        final List<dynamic> dataList = jsonData['data'];
        nomorMoaController.text = '';
        nomorMouController.text = '';
        if (dataList.isNotEmpty) {
          final nomorMou = dataList[0]['nomor_mou'];
          nomorMouController.text = nomorMou; // Set nomorMouController

          getDataMoaByMou(nomorMou);
        }

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

  Future<void> getDataMoaByMou(String nomor_mou) async {
    try {
      final response = await http.post(Uri.parse(
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.getDataMoaByMou}?nomor_mou=$nomor_mou'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        final List<dynamic> dataList = jsonData['data'];

        if (dataList.isNotEmpty) {
          final nomorMoa = dataList[0]['nomor_moa'];
          nomorMoaController.text = nomorMoa; // Set nomorMoaController
        }

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
