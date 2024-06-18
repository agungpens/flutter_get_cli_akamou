import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/infrastructure/navigation/bindings/controllers/my_controller.dart';
import 'package:get_cli/presentation/input_kegiatan/controllers/input_kegiatan.controller.dart';

class InputKegiatanScreen extends GetView<InputKegiatanController> {
  final MyController c = Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Input Kegiatan',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() => DropdownButtonFormField<String>(
                    items: controller.instansiList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        controller.searchDataByInstansi(value);
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Cari Instansi / Mitra',
                      border: OutlineInputBorder(),
                    ),
                  )),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.nomorMouController,
                readOnly: true,  // Set readOnly to true
                decoration: InputDecoration(
                  labelText: 'Nomor MOU',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.nomorMoaController,
                readOnly: true,  // Set readOnly to true
                decoration: InputDecoration(
                  labelText: 'Nomor MOA',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Lampiran',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Open camera logic here
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(width: 8),
                    Text('Tambah Lampiran'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}