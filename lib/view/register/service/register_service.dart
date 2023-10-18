import 'package:bracketschat/core/constants/db/collection_names.dart';
import 'package:bracketschat/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterService extends FirebaseService {
  Future<String> createUserWithEmailAndPassword({required String email, required String password, required Map<String, dynamic> userDetail}) async {
    String result = AuthResultMessage.kUnExpectedErrorMessage;
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await firebaseFirestore.collection(CollectionNames.USERS).doc(userCredential.user!.uid).set(userDetail);
      result = AuthResultMessage.kAuthSuccessRegister;
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthResultMessage.kWeakPassword) {
        result = AuthResultMessage.kWeakPassword;
      } else if (e.code == AuthResultMessage.kEmailAlreadyInUse) {
        result = AuthResultMessage.kEmailAlreadyInUse;
      }
    } catch (e) {
      result = AuthResultMessage.kUnExpectedErrorMessage;
    }
    return result;
  }
}
