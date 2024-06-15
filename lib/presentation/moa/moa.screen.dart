import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/presentation/moa/controllers/moa.controller.dart';
import 'package:get_cli/presentation/screens.dart';

class MoaScreen extends StatelessWidget {
  final MoaController controller = Get.put(MoaController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Memorandum Of Agreements',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.mouList.isEmpty) {
            return Center(
              child: Text('No MOA data available'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.mouList.length,
              itemBuilder: (BuildContext context, int index) {
                return DaftarDokumen(mouData: controller.mouList[index]);
              },
            );
          }
        }),
      ),
    );
  }
}

class DaftarDokumen extends StatelessWidget {
  final dynamic mouData;
  const DaftarDokumen({required this.mouData});

  @override
  Widget build(BuildContext context) {
    String judul = mouData['judul_moa'] ?? 'Unknown Title';
    String kerjaSamaDengan = mouData['kerja_sama_dengan'] ?? 'Unknown Partner';
    bool isActive = mouData['status'] == 'AKTIF';
    String tanggal = mouData['tanggal_dibuat'] ?? 'Unknown Date';

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        child: Icon(Icons.document_scanner_outlined),
      ),
      title: Text(
        kerjaSamaDengan,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        judul.length > 30 ? judul.substring(0, 30) + '...' : judul,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Badge(
              isActive: isActive,
            ),
          ),
          SizedBox(height: 4),
          Text(
            tanggal,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      onTap: () {
        onTapAction(mouData['id']);
      },
    );
  }

  void onTapAction(int id) {
    if (id != null) {
      Get.to(MoaDetailScreen(), arguments: id);
    } else {
      Get.snackbar('Error', 'Invalid MOU ID');
    }
  }
}

class Badge extends StatelessWidget {
  final bool isActive;

  const Badge({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'Aktif' : 'Tidak Aktif',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
