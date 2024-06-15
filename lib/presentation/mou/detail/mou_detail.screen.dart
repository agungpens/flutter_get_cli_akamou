import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/presentation/mou/detail/controllers/mou_detail.controller.dart';

class MouDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MouDetailController controller = Get.put(MouDetailController());
    int mouId = Get.arguments ?? 0;
    print("MouDetailScreen received ID: $mouId");

    return Scaffold(
      appBar: AppBar(
        title: Text('MOU Detail'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.mouData.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nomor MOU: ${controller.mouData['nomor_mou']}'),
                SizedBox(height: 8),
                Text('Judul: ${controller.mouData['judul_mou']}'),
                SizedBox(height: 8),
                Text('Kerjasama Dengan: ${controller.mouData['kerja_sama_dengan']}'),
                SizedBox(height: 8),
                Text('Tanggal Dibuat: ${controller.mouData['tanggal_dibuat']}'),
                SizedBox(height: 8),
                Text('Tanggal Berakhir: ${controller.mouData['tanggal_berakhir']}'),
                SizedBox(height: 8),
                Text('Status: ${controller.mouData['status']}'),
                SizedBox(height: 8),
                Text('Jenis Dokumen: ${controller.mouData['jenis_doc']}'),
                SizedBox(height: 8),
                Text('Level MOU: ${controller.mouData['level_mou']}'),
                SizedBox(height: 8),
                Text('Kategori MOU: ${controller.mouData['kategori_mou']}'),
                SizedBox(height: 8),
                Text('Relevansi Prodi: ${controller.mouData['relevansi_prodi'].join(", ")}'),
              ],
            ),
          );
        }
      }),
    );
  }
}
