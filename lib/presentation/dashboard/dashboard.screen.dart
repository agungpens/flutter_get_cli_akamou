import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get_cli/infrastructure/navigation/bindings/controllers/my_controller.dart';
import 'controllers/dashboard.controller.dart';

class DashboardScreen extends StatelessWidget {
  final MyController c = Get.find<MyController>();
  final DashboardController controller =
      Get.put(DashboardController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Jumlah Mitra Industri',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: charts.BarChart(
                    _createMitraIndustriData(controller.dataMitraIndustri),
                    animate: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Jumlah Leveling Semua Dokumen',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: charts.BarChart(
                    _createMitraLevelData(controller.dataMitraLevel),
                    animate: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Jumlah Keterkaitan Prodi dengan Dokumen',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: charts.BarChart(
                    _createProdiData(controller.jumlahProdi),
                    animate: true,
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  List<charts.Series<ChartData, String>> _createMitraIndustriData(
      Map<String, int> data) {
    final dataEntries =
        data.entries.map((entry) => ChartData(entry.key, entry.value)).toList();

    return [
      charts.Series<ChartData, String>(
        id: 'MitraIndustri',
        domainFn: (ChartData data, _) => data.category,
        measureFn: (ChartData data, _) => data.value,
        data: dataEntries,
      )
    ];
  }

  List<charts.Series<ChartData, String>> _createMitraLevelData(
      Map<String, int> data) {
    final dataEntries =
        data.entries.map((entry) => ChartData(entry.key, entry.value)).toList();

    return [
      charts.Series<ChartData, String>(
        id: 'MitraLevel',
        domainFn: (ChartData data, _) => data.category,
        measureFn: (ChartData data, _) => data.value,
        data: dataEntries,
      )
    ];
  }

  List<charts.Series<ChartData, String>> _createProdiData(
      Map<String, int> data) {
    final dataEntries =
        data.entries.map((entry) => ChartData(entry.key, entry.value)).toList();

    return [
      charts.Series<ChartData, String>(
        id: 'Prodi',
        domainFn: (ChartData data, _) => data.category,
        measureFn: (ChartData data, _) => data.value,
        data: dataEntries,
      )
    ];
  }
}

class ChartData {
  final String category;
  final int value;

  ChartData(this.category, this.value);
}
