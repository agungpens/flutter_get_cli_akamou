import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/infrastructure/navigation/bindings/controllers/my_controller.dart';
import 'package:get_cli/presentation/screens.dart';

import 'controllers/master_template.controller.dart';

class MasterTemplateScreen extends StatelessWidget {
  final MyController c = Get.find<MyController>();
  final MasterTemplateController controller =
      Get.put(MasterTemplateController(), permanent: false);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Master Template Dokumen',
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
                      controller.searchData(value);
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
                    controller.resetlistData();
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
          } else if (controller.listData.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.listData.length,
              itemBuilder: (BuildContext context, int index) {
                return DaftarData(templateData: controller.listData[index]);
              },
            );
          }
        }),
      ),
    );
  }
}

class DaftarData extends StatelessWidget {
  final dynamic templateData;
  const DaftarData({required this.templateData});

  @override
  Widget build(BuildContext context) {
    String nama_template = templateData['nama_template'];
    String nama_jenis = templateData['nama_jenis'];
    String file = templateData['file'];

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        child: Icon(Icons.document_scanner_outlined),
      ),
      title: Text(
        nama_template,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
        children: [
          Text(
            nama_jenis.length > 30
                ? nama_jenis.substring(0, 30) + '...'
                : nama_jenis,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(height: 4),
          Text(
            file,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      onTap: () {
        onTapAction(templateData['id']);
      },
    );
  }

  void onTapAction(int id) {
    if (id != null) {
      Get.to(MasterTemplateDetailScreen(), arguments: id);
    } else {
      Get.snackbar('Error', 'Invalid DATA ID');
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
