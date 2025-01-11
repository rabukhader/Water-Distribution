import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:water_distribution_management/model/user.dart' as my_user;
import 'package:water_distribution_management/services/auth_store.dart';

class MonitorViewModel extends ChangeNotifier {
  my_user.User? user;
  final AuthStore authStore;
  late DatabaseReference databaseRef;
  late FirebaseDatabase secondaryDatabase;

  final String email = "mobile.application@email.com";
  final String password = "smartwaterdistributionsy-app";
  final String databaseUrl =
      "https://smartwaterdistributionsy-7f598-default-rtdb.europe-west1.firebasedatabase.app";

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool? _isAutomated = false;
  bool? get isAutomated => _isAutomated;

  set setAutomation(bool value) {
    _isAutomated = value;
    notifyListeners();
  }

  bool? _pump = false;
  bool? get pump => _pump;

  set setPump(bool value) {
    _pump = value;
    notifyListeners();
  }

  late FirebaseApp secondaryApp;
  late FirebaseAuth secondaryAuth;

  final String apiKey = "AIzaSyCoLp6UD0om9mKbjL_CUIzGU4lbPvmAK74";

  List<CityValveStatus> cities = [
    CityValveStatus(cityName: 'عرابة', openValve: true),
    CityValveStatus(cityName: 'الزبابدة', openValve: true),
    CityValveStatus(cityName: 'قباطية', openValve: true),
  ];

  MonitorViewModel({required this.authStore}) {
    loadData();
  }

  loadData() async {
    try {
      _isLoading = true;
      notifyListeners();
      user = await authStore.getUser();
      await authenticateAndConnect();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> authenticateAndConnect() async {
    try {
      // Initialize the Firebase app
      secondaryApp = await Firebase.initializeApp(
        name: 'SecondaryFirebaseApp',
        options: FirebaseOptions(
          apiKey: apiKey,
          databaseURL: databaseUrl,
          projectId: "smartwaterdistributionsy-7f598",
          appId: "YOUR_SECONDARY_APP_ID",
          messagingSenderId: "739188955992",
        ),
      );

      await FirebaseAuth.instanceFor(app: secondaryApp)
          .signInWithEmailAndPassword(email: email, password: password);

      // Initialize the secondary database
      secondaryDatabase = FirebaseDatabase.instanceFor(app: secondaryApp);

      // Get a reference to the database
      databaseRef = secondaryDatabase.ref();

      await databaseRef.child("online").set(false);
      
      DataSnapshot snapshot = await databaseRef.get();

      await Future.delayed(const Duration(seconds: 3));

      if (snapshot.exists) {
        // Parse the data (if needed) and modify it
        Map<String, dynamic>? data =
            Map<String, dynamic>.from(snapshot.value as Map);
            print("here the check - ${data['online']}");

        if (data['online'] == true) {
          cities[0].openValve = data['valve1'];
          cities[1].openValve = data['valve2'];
          cities[2].openValve = data['valve3'];
          _isAutomated = data['isAutomated'];
          _pump = data['pump'];
        } else {
          cities[0].openValve = null;
          cities[1].openValve = null;
          cities[2].openValve = null;
          _isAutomated = null;
          _pump = null;
          _startShortPulling();
        }

        print("Updated Database Data: $data");
      } else {
        print("Database is empty or node does not exist.");
      }
    } catch (e, stackTrace) {
      print("Error in authenticateAndConnect: $e");
      print(stackTrace);
    }
  }

  Future<void> updateDatabase() async {
    try {
      // Write to the database
      await databaseRef.child("valve1").set(cities[0].openValve);
      await databaseRef.child("valve2").set(cities[1].openValve);
      await databaseRef.child("valve3").set(cities[2].openValve);
      await databaseRef.child("isAutomated").set(_isAutomated);
      await databaseRef.child("pump").set(_pump);
    } catch (e) {
      print("Error updating database: $e");
    }
  }

  _startShortPulling() async {
    try {
      while (true) {
        DataSnapshot snapshot = await databaseRef.get();

        if (snapshot.exists) {
          Map<String, dynamic>? data =
              Map<String, dynamic>.from(snapshot.value as Map);

          if (data['online'] == true) {
            // Update the state and exit the polling loop
            cities[0].openValve = data['valve1'];
            cities[1].openValve = data['valve2'];
            cities[2].openValve = data['valve3'];
            _isAutomated = data['isAutomated'];
            _pump = data['pump'];
            notifyListeners();
            print("Online is now true. Exiting short polling.");
            break;
          } else {
            // Handle offline state during polling
            cities[0].openValve = null;
            cities[1].openValve = null;
            cities[2].openValve = null;
            _isAutomated = null;
            _pump = null;
            notifyListeners();
            print("Still offline. Retrying...");
          }
        } else {
          print("Database node does not exist or is empty.");
        }

        // Wait for a short duration before the next check
        await Future.delayed(const Duration(seconds: 2));
      }
    } catch (e) {
      print("Error during short polling: $e");
    }
  }
}

class CityValveStatus {
  final String cityName;
  bool? openValve;

  CityValveStatus({required this.cityName, required this.openValve});
}
