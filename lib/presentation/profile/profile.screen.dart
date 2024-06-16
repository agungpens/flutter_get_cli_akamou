import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/profile.controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
          ),
        ),
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
            child: SingleChildScrollView(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          'Nama Lengkap',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(detailUser['nama_lengkap']),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text(
                          'Username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(user['username']),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.wc),
                        title: Text(
                          'Jenis Kelamin',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(detailUser['jenis_kelamin']),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text(
                          'No HP',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(detailUser['no_hp']),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text(
                          'Alamat',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(detailUser['alamat']),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.work),
                        title: Text(
                          'Role',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(roles['nama_role']),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
