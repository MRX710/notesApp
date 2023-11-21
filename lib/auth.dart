import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<User?> signInWithGoogle() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;

  if (googleSignInAuthentication?.accessToken != null ||
      googleSignInAuthentication?.idToken != null) {
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    assert(!user!.isAnonymous);
    assert(await user?.getIdToken() != null);

    final User? currentUser = _auth.currentUser;
    assert(currentUser?.uid == user?.uid);

    return user;
  } else {
    throw PlatformException(
      code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
      message: 'Missing Google Auth Token',
    );
  }
}
