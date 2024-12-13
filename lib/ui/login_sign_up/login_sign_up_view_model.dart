import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:water_distribution_management/model/user.dart';
import 'package:water_distribution_management/services/auth_store.dart';
import 'package:water_distribution_management/services/firebase_auth_service.dart';
import 'package:water_distribution_management/services/firestore_service.dart';
import 'package:water_distribution_management/model/user.dart' as cuser;

class LoginSignupProvider extends ChangeNotifier {
  final AuthStore authStore;
  final FirebaseAuthService authService;
  final FirestoreService firestoreService;

  LoginSignupProvider(
      {required this.authStore,
      required this.authService,
      required this.firestoreService});

  bool _isLoggingIn = false;

  bool get isLoggingIn => _isLoggingIn;

  Future login(String email, String password) async {
    try { 
      _isLoggingIn = true;
      notifyListeners();
      UserCredential user =
          await authService.login(email: email, password: password);
      await _saveInfoOnAuthStoreAfterLogin(
          user.user?.uid ?? "", email, password);
      return "pass";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        return 'Invalid Credintials';
      } else {
        return "Something went wrong, Please try again";
      }
    } catch (e) {
      return e.toString();
    } finally {
      _isLoggingIn = false;
      notifyListeners();
    }
  }

  Future signup(String email, String password, String fullname) async {
    try {
      _isLoggingIn = true;
      notifyListeners();
      UserCredential user =
          await authService.signUp(email: email, password: password);
      await addUserOnFirebase(cuser.User(
          email: email,
          password: password,
          fullname: fullname,
          id: user.user?.uid ?? ""));

      await _saveInfoOnAuthStoreAfterSignUp(cuser.User(
          id: user.user!.uid,
          email: email,
          password: password,
          fullname: fullname));
      return "pass";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return "Something went wrong, Please try again";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    } finally {
      _isLoggingIn = false;
      notifyListeners();
    }
  }

  addUserOnFirebase(cuser.User user) async {
    await firestoreService.addUser(user: user);
  }

  _saveInfoOnAuthStoreAfterSignUp(cuser.User user) async {
    await authStore.saveUser(user);
  }

  _saveInfoOnAuthStoreAfterLogin(id, email, password) async {
    Map<String, dynamic> data = await firestoreService.getUserData(id: id);

    await authStore.saveUser(cuser.User(
        fullname: data['fullname'],
        id: id,
        email: email,
        password: password,
        registrationStatus: registrationStatusFromFirestore(data['registrationStatus'])));
  }
}
