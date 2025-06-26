import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices
{
  //Google Sign in
  signinWithGoogle() async {
    //begin Interactive Sign process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //Obtain details
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //create credentials for user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken, 
    );

    //Signed in 
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}