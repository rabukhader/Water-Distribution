import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_distribution_management/model/user.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirestoreService();

    Future<Map<String, dynamic>> getUserData({required String id}) async {
    DocumentReference userDocRef = firestore.collection('user').doc(id);
    DocumentSnapshot documentSnapshot = await userDocRef.get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return data;
  }

  Future addUser({required User user}) async {
    CollectionReference userCollectionRef = firestore.collection('user');
    await userCollectionRef.doc(user.id).set({
      "fullname": user.fullname
    });
  }
}