import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._();

  static AuthService authService = AuthService._();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //ACCOUNT CREATE --SIGN UP

  Future<void> createAccountWithEmailPass(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // LogIn

  Future<String?> signInWithEmailPasswors(String email, String password) async {

    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      return "null";

    }
    return "kashosh";
  }

//Sign Out
  Future<void> signOutUser() async {
    await  _firebaseAuth.signOut();
  }


// current user
  User? getCurrentUser() {
    User? user = _firebaseAuth.currentUser;
    return user;
  }
}

