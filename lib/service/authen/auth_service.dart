import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
final Stream<User?> _authGetStageChanges =
    FirebaseAuth.instance.authStateChanges();

String? userEmail;
String? imageUrl;
String? uid;
String? name;

Future getUser() async {
  await Firebase.initializeApp();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool authSignedIn = preferences.getBool('auth') ?? true;

  final User? user = _auth.currentUser;

  if (authSignedIn) {
    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
    }
  }
}

Future<User?> signInWithGoogle() async {
  await Firebase.initializeApp();

  User? user;

  try {
    // GoogleAuthProvider authProvider = GoogleAuthProvider();
    // final UserCredential userCredential =
    //     await _auth.signInWithPopup(authProvider);

    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    user = userCredential.user;
  } catch (err) {
    print(err);
  }

  if (user != null) {
    uid = user.uid;
    name = user.displayName;
    userEmail = user.email;
    imageUrl = user.photoURL;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('auth', true);
  }

  return user;
}

void signOutGoogle() async {
  await FirebaseAuth.instance.signOut();
  await _googleSignIn.signOut();
  await _auth.signOut();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('auth', false);

  uid = null;
  name = null;
  userEmail = null;
  imageUrl = null;

  print("User has successfully signed out of Google account!");
}
