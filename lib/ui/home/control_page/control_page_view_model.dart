import 'package:flutter/material.dart';
import 'package:water_distribution_management/model/user.dart';
import 'package:water_distribution_management/services/auth_store.dart';
import 'package:water_distribution_management/services/firebase_auth_service.dart';

class ControlPageViewModel extends ChangeNotifier {
   User? user;
  final AuthStore authStore;
  final FirebaseAuthService authService;

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  ControlPageViewModel({
    required this.authStore,
    required this.authService,
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

  Future logOut() async {
    await authService.logout();
    await authStore.logout();
  }
}
