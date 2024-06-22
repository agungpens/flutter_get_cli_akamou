import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class MasterTemplateDetailController extends GetxController {
  var isLoading = true.obs;
  var isDownloading = false.obs; // Observable to track download status
  var downloadProgress = 0.0.obs; // Observable to track download progress
  late int dataId;
  var listData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    dataId = Get.arguments ?? 0;
    print("Received DATA ID: $dataId");
    if (dataId != 0) {
      getDataById(dataId);
    } else {
      Get.snackbar('Error', 'Invalid DATA ID');
      isLoading.value = false;
    }
  }

  Future<void> getDataById(int id) async {
    try {
      final response = await http.get(Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.authEndPoints.detailDataMasterTemplate +
          '?id=$id'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        
        // Check if jsonData['data'] is a List
        if (jsonData['data'] is List) {
          if (jsonData['data'].isNotEmpty) {
            listData.value = jsonData['data'][0];
          } else {
            Get.snackbar('Error data loading!', 'No data available');
          }
        } else {
          listData.value = jsonData['data'];
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

  void downloadDocument(String filePath, String fileName) async {
    Dio dio = Dio();

    try {
      // URL lengkap untuk file yang akan diunduh
      String fileUrl = ApiEndPoints.baseUrlWeb + filePath + fileName;

      // Mendapatkan direktori tempat penyimpanan lokal
      Directory? externalDir = await getExternalStorageDirectory();
      if (externalDir == null) {
        throw FileSystemException('External storage directory is null');
      }
      String externalPath = externalDir.path;

      // Menentukan path untuk menyimpan file yang diunduh
      String savePath = '$externalPath/$fileName';

      // Mengubah status sedang mengunduh
      isDownloading.value = true;

      // Memulai proses unduhan dengan progress
      await dio.download(fileUrl, savePath,
          onReceiveProgress: (receivedBytes, totalBytes) {
        double progress = receivedBytes / totalBytes * 100;
        print('Download progress: $progress%');

        // Update download progress observable
        downloadProgress.value = progress;
      });

      print('File downloaded to: $savePath');

      // Menampilkan notifikasi berhasil (Snackbar hijau)
      Get.snackbar('Download Complete', 'File downloaded successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      print('Error during downloading file: $e');
      // Handle error, for example show error message using Get.snackbar
      Get.snackbar('Error', 'Failed to download file: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      // Reset status dan progress
      isDownloading.value = false;
      downloadProgress.value = 0.0;
    }
  }
}
