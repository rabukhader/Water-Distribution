import 'package:flutter/material.dart';
import 'package:water_distribution_management/model/user.dart';
import 'package:water_distribution_management/services/auth_store.dart';

class MonitorViewModel extends ChangeNotifier {
  User? user;
  final AuthStore authStore;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  MonitorViewModel({
    required this.authStore,
  }) {
    loadData();
  }

  loadData() async {
    try {
      _isLoading = true;
      notifyListeners();
      user = await authStore.getUser();
      print(user?.toJson());
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}