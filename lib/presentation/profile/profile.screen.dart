import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/profile.controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileScreen'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.userData.isEmpty) {
          return Center(child: Text('No user data available'));
        } else {
          var user = controller.userData;
          var detailUser = user['detail_user'];
          var roles = user['roles'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: ${detailUser['nama_lengkap']}'),
                SizedBox(height: 8),
                Text('Username: ${user['username']}'),
                SizedBox(height: 8),
                Text('Jenis Kelamin: ${detailUser['jenis_kelamin']}'),
                SizedBox(height: 8),
                Text('No HP: ${detailUser['no_hp']}'),
                SizedBox(height: 8),
                Text('Alamat: ${detailUser['alamat']}'),
                SizedBox(height: 8),
                Text('Role: ${roles['nama_role']}'),
                // Add more fields as needed
              ],
            ),
          );
        }
      }),
    );
  }
}
