import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/domain/core/interfaces/models/api_mou_model.dart';
import 'package:get_cli/infrastructure/navigation/bindings/controllers/my_controller.dart';
import 'package:get_cli/presentation/mou/controllers/mou.controller.dart';
import 'package:get_cli/presentation/screens.dart';

class MouScreen extends StatelessWidget {
  final MyController c = Get.find<MyController>();
  final MouController controller = Get.put(MouController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Momerandum Of Understanding',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
          ),
        ),
        actions: [
          actionBar(c: c),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          // Tampilkan loading indicator jika data belum tersedia
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.mouList.isEmpty) {
          // Tampilkan pesan jika data tidak tersedia
          return Center(
            child: Text('No MOU data available'),
          );
        } else {
          // Tampilkan daftar dokumen jika data sudah tersedia
          return ListView.builder(
            itemCount: controller.mouList.length,
            itemBuilder: (BuildContext context, int index) {
              return DaftarDokumen(mouData: controller.mouList[index]);
            },
          );
        }
      }),
    );
  }
}

class DaftarDokumen extends StatelessWidget {
  final MouData mouData;
  const DaftarDokumen({required this.mouData});

  @override
  Widget build(BuildContext context) {
    String judul = mouData.judulMou;
    String kerja_sama_dengan = '${mouData.kerjaSamaDengan}';
    bool isActive = mouData.status == 'AKTIF';
    String tanggal = mouData.tanggalDibuat;

    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.notes_rounded),
      ),
      title: Text(
        judul,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(kerja_sama_dengan),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Badge(
            isActive: isActive,
          ),
          SizedBox(height: 4),
          Text(
            tanggal,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      onTap: () {
        // Tambahkan logika untuk menangani ketika item dokumen diklik
      },
    );
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
