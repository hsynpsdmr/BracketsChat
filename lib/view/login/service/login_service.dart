import 'package:bracketschat/core/constants/db/collection_names.dart';
import 'package:bracketschat/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService extends FirebaseService {
  Future<String> signInWithEmailAndPassword({required String email, required String password}) async {
    firebaseAuth.useAuthEmulator("10.0.2.2", 9099);
    String result = AuthResultMessage.kUnExpectedErrorMessage;
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      result = AuthResultMessage.kAuthSuccessLogin;
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthResultMessage.kUserNotFound) {
        result = AuthResultMessage.kUserNotFound;
      } else if (e.code == AuthResultMessage.kWrongPassword) {
        result = AuthResultMessage.kWrongPassword;
      }
    }
    return result;
  }

  Future<String> logOut() async {
    String result = AuthResultMessage.kUnExpectedErrorMessage;
    await firebaseAuth.signOut().then((value) {
      result = AuthResultMessage.kLogOutMessage;
    }).catchError((e) {
      result = AuthResultMessage.kUnExpectedErrorMessage;
    });
    return result;
  }
}
