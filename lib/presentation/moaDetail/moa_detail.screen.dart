import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/moa_detail.controller.dart';

class MoaDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MoaDetailController controller = Get.put(MoaDetailController());
    int moaId = Get.arguments ?? 0;
    print("MoaDetailScreen received ID: $moaId");

    return Scaffold(
      appBar: AppBar(
        title: Text('MOA Detail'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.moaData.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nomor MOA: ${controller.moaData['nomor_moa'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Judul: ${controller.moaData['judul_moa'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Kerjasama Dengan: ${controller.moaData['kerja_sama_dengan'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Tanggal Dibuat: ${controller.moaData['tanggal_dibuat'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Tanggal Berakhir: ${controller.moaData['tanggal_berakhir'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Status: ${controller.moaData['status'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Jenis Dokumen: ${controller.moaData['jenis_doc'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Level MOA: ${controller.moaData['level_moa'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Kategori MOA: ${controller.moaData['kategori_moa'] ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Relevansi Prodi: ${controller.moaData['relevansi_prodi'] != null ? (controller.moaData['relevansi_prodi'] as List).join(", ") : "N/A"}'),
              ],
            ),
          );
        }
      }),
    );
  }
}
