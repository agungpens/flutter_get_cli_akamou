import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/infrastructure/componen/badge_componen.dart';
import 'controllers/moa_detail.controller.dart';


class MoaDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MoaDetailController controller = Get.put(MoaDetailController());
    int moaId = Get.arguments ?? 0;
    print("Received MoA ID: $moaId");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MoA Detail',
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
          } else if (controller.moaData.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow("Nomor MoA", controller.moaData['nomor_moa']),
                _buildDetailRow("Judul", controller.moaData['judul_moa']),
                _buildDetailRow("Kerjasama Dengan",
                    controller.moaData['kerja_sama_dengan']),
                _buildDetailRow(
                    "Tanggal Dibuat", controller.moaData['tanggal_dibuat']),
                _buildDetailRow(
                    "Tanggal Berakhir", controller.moaData['tanggal_berakhir']),
                _buildDetailRowWithBadge("Status", controller.moaData['status']),
                _buildDetailRow(
                    "Jenis Dokumen", controller.moaData['jenis_doc']),
                _buildDetailRow("Level MoA", controller.moaData['level_moa']),
                _buildDetailRow(
                    "Kategori MoA", controller.moaData['kategori_moa']),
                _buildDetailRow(
                    "Relevansi Prodi",
                    controller.moaData['relevansi_prodi'] != null
                        ? (controller.moaData['relevansi_prodi'] as List)
                            .join(", ")
                        : "N/A"),
              ],
            );
          }
        }),
      ),
      floatingActionButton: Obx(() {
        // Show download progress indicator when download in progress
        if (controller.downloadProgress.value > 0 && controller.downloadProgress.value < 100) {
          return FloatingActionButton.extended(
            onPressed: null,
            label: Text('${controller.downloadProgress.value.toStringAsFixed(1)}%'),
            icon: Icon(Icons.download),
            backgroundColor: Colors.blue,
          );
        } else {
          // Show regular download button when no download is in progress
          return FloatingActionButton(
            onPressed: () {
              controller.downloadDocument(controller.moaData['file_path'], controller.moaData['file_moa']);
            },
            child: Icon(Icons.download),
            tooltip: 'Unduh Dokumen',
          );
        }
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
        BadgeComponen(isActive: isActive), // Assuming BadgeComponen is a custom widget
        SizedBox(height: 12),
      ],
    );
  }
}
