import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/master_template_detail.controller.dart';

class MasterTemplateDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MasterTemplateDetailController controller =
        Get.put(MasterTemplateDetailController());
    int dataId = Get.arguments ?? 0;
    print("DATA ID : $dataId");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Master Template Dokumen Detail',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.listData.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow(
                    "Nama Template", controller.listData['nama_template']),
                _buildDetailRow(
                    "Keterangan", controller.listData['keterangan']),
                _buildDetailRow(
                    "Jenis Dokumen", controller.listData['nama_jenis']),
              ],
            );
          }
        }),
      ),
      floatingActionButton: Obx(() {
        return controller.isDownloading.value
            ? FloatingActionButton.extended(
                onPressed: null,
                label: Text(
                    '${controller.downloadProgress.value.toStringAsFixed(1)}%'),
                icon: Icon(Icons.download),
                backgroundColor: Colors.blue,
              )
            : FloatingActionButton(
                onPressed: () {
                  controller.downloadDocument(
                      controller.listData['dokumen_path'],
                      controller.listData['file']);
                },
                child: Icon(Icons.download),
                tooltip: 'Unduh Dokumen',
              );
      }),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value ?? "N/A",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
