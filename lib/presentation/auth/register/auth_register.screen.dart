import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli/infrastructure/navigation/bindings/controllers/my_controller.dart';


import 'controllers/auth_register.controller.dart';

class AuthRegisterScreen extends GetView<AuthRegisterController> {
  const AuthRegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final c =
        Get.find<MyController>(); // Pindahkan pemanggilan ini ke dalam build()
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              c.changeTheme();
            },
            icon: Icon(Icons.color_lens), // Ikon untuk mengganti tema
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daftar Akun',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => TextFormField(
                        obscureText: !c.isPasswordVisible.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(c.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              c.togglePasswordVisibility();
                              // print("Password visibility: ${!c.isPasswordVisible.value}");
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        value: c.selectedOption.value.isNotEmpty
                            ? c.selectedOption.value
                            : null,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            c.updateSelectedOption(newValue);
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Pilih Prodi', // Label untuk dropdown
                          border:
                              OutlineInputBorder(), // Jenis border untuk dropdown
                        ),
                        items: <String>[
                          'Administrasi Server Dan Jaringan Komputer',
                          'Penyutingan Audio Video',
                          'Pengolahan Hasil Ternak Unggas',
                          'Administrasi Perkantoran',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.defaultDialog(
                            title: "Alert Konfirmasi",
                            contentPadding: EdgeInsets.all(20),
                            middleText:
                                "Apakah anda yakin melanjutkan proses ini?",
                            textCancel: "Tidak",
                            textConfirm: "Yakin",
                            onConfirm: () {
                              Get.back();
                              Get.back();
                              Get.snackbar(
                                'Success',
                                'Anda berhasil daftar!',
                                backgroundColor: Color(0xFF57C983),
                              );
                            }),
                        child: Text(
                          'Daftar',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          'Kembali',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah mempunyai akun ? ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Login!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          onTap: () => Get.back(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
