import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roommate/core/errors/base_error.dart';
import 'package:roommate/core/result_wrapper/result_wrapper.dart';

abstract class GoogleSignInFirebase {
  Future<Result> googleAndCreateAccountIfNotExists();
}

class GoogleSignInFirebaseImpl implements GoogleSignInFirebase {
  @override
  Future<Result> googleAndCreateAccountIfNotExists() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference usersCollection = firestore.collection('users');

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        DocumentSnapshot userSnapshot =
            await usersCollection.doc(userCredential.user!.uid).get();
        if (!userSnapshot.exists) {
          await usersCollection.doc(userCredential.user!.uid).set({
            'email': userCredential.user!.email,
          });
          return ResultSuccess(userCredential.user!.uid);
        }

        return ResultSuccess(userCredential.user!.uid);
      } else {
        return ResultError(BaseError('Google sign in failed'));
      }
    } catch (e) {
      return ResultError(BaseError(e.toString()));
    }
  }
}
