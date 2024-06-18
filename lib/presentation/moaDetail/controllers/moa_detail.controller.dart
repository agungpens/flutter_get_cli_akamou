import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_cli/domain/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MoaDetailController extends GetxController {
  var isLoading = true.obs;
  var downloadProgress = 0.0.obs; // Observable to track download progress
  late int moaId;
  var moaData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    moaId = Get.arguments ?? 0;
    print("Received MoA ID: $moaId");
    if (moaId != 0) {
      getDataById(moaId);
    } else {
      Get.snackbar('Error', 'Invalid MoA ID');
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

  void downloadDocument(String filePath, String fileName) async {
    Dio dio = Dio();

    try {
      // Complete URL for the file to be downloaded
      String fileUrl = ApiEndPoints.baseUrlWeb + filePath + fileName;

      // Get the local storage directory
      Directory? externalDir = await getExternalStorageDirectory();
      if (externalDir == null) {
        throw FileSystemException('External storage directory is null');
      }
      String externalPath = externalDir.path;

      // Determine the path to save the downloaded file
      String savePath = '$externalPath/$fileName';

      // Start the download process
      await dio.download(
        fileUrl,
        savePath,
        onReceiveProgress: (receivedBytes, totalBytes) {
          double progress = receivedBytes / totalBytes * 100;
          print('Download progress: $progress%');

          // Update download progress observable
          downloadProgress.value = progress;
        },
      );

      print('File downloaded to: $savePath');

      // Show success notification (green snackbar)
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
    }
  }
}
