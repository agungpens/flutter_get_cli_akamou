import 'package:get/get.dart';

class MyController extends GetxController {
  var counter = 0.obs;
  var isDark = false.obs;
  var isPasswordVisible = false.obs;
  var selectedOption = ''.obs; // Menyimpan nilai pilihan dropdown

  void changeTheme() => isDark.value = !isDark.value;

  void increment() => counter.value++; // Menambahkan 1 ke counter
  void decrement() => counter.value--; // Mengurangi 1 dari counter
  void reset() => counter.value = 0; // Mengatur nilai counter kembali ke 0

  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;

  void updateSelectedOption(String newValue) {
    selectedOption.value = newValue; // Memperbarui nilai pilihan dropdown
  }
}
