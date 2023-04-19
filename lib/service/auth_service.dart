import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    final GoogleSignInAccount? qUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication qAuth = await qUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: qAuth.accessToken,
      idToken: qAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
