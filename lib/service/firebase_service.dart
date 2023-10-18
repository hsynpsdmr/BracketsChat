import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static const String FIREBASE_URL = "https://brackets-chat-default-rtdb.europe-west1.firebasedatabase.app/"; //realtime database url
  static const String FIREBASE_AUTH_URL = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDVegIxp-Hrc1zewRET1bB2EvnmLmrt_DQ";
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
}
