import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/infrastructure/componen/badge_componen.dart';
import 'controllers/moa_detail.controller.dart';


class MoaDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MoaDetailController controller = Get.put(MoaDetailController());
    int moaId = Get.arguments ?? 0;
    print("MoaDetailScreen received ID: $moaId");

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
                _buildDetailRow("Nomor MOA", controller.moaData['nomor_moa']),
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
                _buildDetailRow("Level MOA", controller.moaData['level_moa']),
                _buildDetailRow(
                    "Kategori MOA", controller.moaData['kategori_moa']),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the download action
          controller.downloadDocument();
        },
        child: Icon(Icons.download),
        tooltip: 'Unduh Dokumen',
      ),
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
        BadgeComponen(isActive: isActive),
        SizedBox(height: 12),
      ],
    );
  }
}

