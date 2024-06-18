import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/infrastructure/componen/badge_componen.dart';
import 'controllers/mou_detail.controller.dart';

class MouDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MouDetailController controller = Get.put(MouDetailController());
    int mouId = Get.arguments ?? 0;
    print("MouDetailScreen received ID: $mouId");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MoU Detail',
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
          } else if (controller.mouData.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow("Nomor MOU", controller.mouData['nomor_mou']),
                _buildDetailRow("Judul", controller.mouData['judul_mou']),
                _buildDetailRow("Kerjasama Dengan", controller.mouData['kerja_sama_dengan']),
                _buildDetailRow("Tanggal Dibuat", controller.mouData['tanggal_dibuat']),
                _buildDetailRow("Tanggal Berakhir", controller.mouData['tanggal_berakhir']),
                _buildDetailRowWithBadge("Status", controller.mouData['status']),
                _buildDetailRow("Jenis Dokumen", controller.mouData['jenis_doc']),
                _buildDetailRow("Level MOU", controller.mouData['level_mou']),
                _buildDetailRow("Kategori MOU", controller.mouData['kategori_mou']),
                _buildDetailRow(
                  "Relevansi Prodi",
                  controller.mouData['relevansi_prodi'] != null
                      ? (controller.mouData['relevansi_prodi'] as List).join(", ")
                      : "N/A",
                ),
              ],
            );
          }
        }),
      ),
      floatingActionButton: Obx(() {
        return controller.isDownloading.value
            ? FloatingActionButton.extended(
                onPressed: null,
                label: Text('${controller.downloadProgress.value.toStringAsFixed(1)}%'),
                icon: Icon(Icons.download),
                backgroundColor: Colors.blue,
              )
            : FloatingActionButton(
                onPressed: () {
                  controller.downloadDocument(controller.mouData['file_path'], controller.mouData['file_mou']);
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

  Widget _buildDetailRowWithBadge(String label, String status) {
    bool isActive = status == 'AKTIF'; // Adjust this condition based on your status logic
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
        BadgeComponen(isActive: isActive), // Assuming BadgeComponen is defined and imports correctly
        SizedBox(height: 12),
      ],
    );
  }
}
