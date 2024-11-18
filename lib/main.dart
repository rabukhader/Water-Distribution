import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:water_distribution_management/app/water_app.dart';
import 'package:water_distribution_management/services/auth_store.dart';
import 'package:water_distribution_management/services/firebase_auth_service.dart';
import 'package:water_distribution_management/services/firestore_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  _setupGetIt();

  runApp(const WaterApp());
}

void _setupGetIt() {
  GetIt.I.registerLazySingleton<AuthStore>(() => AuthStore());
  GetIt.I.registerLazySingleton<FirestoreService>(() => FirestoreService());
  GetIt.I.registerLazySingleton<FirebaseAuthService>(
      () => FirebaseAuthService(authStore: GetIt.I<AuthStore>()));
}
