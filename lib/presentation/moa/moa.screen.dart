import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/infrastructure/componen/badge_componen.dart';
import 'package:get_cli/presentation/moa/controllers/moa.controller.dart';
import 'package:get_cli/presentation/screens.dart';

class MoaScreen extends StatelessWidget {
  final MoaController controller = Get.put(MoaController(), permanent: false);
  final TextEditingController searchController = TextEditingController();

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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      controller.searchMoa(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    searchController.clear();
                    controller.resetMouList();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
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
            child: BadgeComponen(
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
