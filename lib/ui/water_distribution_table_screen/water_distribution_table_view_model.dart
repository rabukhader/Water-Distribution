import 'package:flutter/material.dart';

class WaterDistributionTableViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final List<CityWaterStatus> cityData = [
    CityWaterStatus(cityName: "غزة", hasWater: true),
    CityWaterStatus(cityName: "رام الله", hasWater: false),
    CityWaterStatus(cityName: "نابلس", hasWater: true),
    CityWaterStatus(cityName: "الخليل", hasWater: true),
    CityWaterStatus(cityName: "بيت لحم", hasWater: true),
  ];

  WaterDistributionTableViewModel() {
    loadData();
  }

  loadData() async {
    try {
      _isLoading = true;
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class CityWaterStatus {
  final String cityName;
  final bool hasWater;

  CityWaterStatus({required this.cityName, required this.hasWater});
}
