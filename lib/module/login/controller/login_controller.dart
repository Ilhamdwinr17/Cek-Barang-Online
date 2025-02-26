import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:get/get.dart' as getx;
import 'package:mvc_demo/core.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  // final SupabaseClient supabaseClient = SupabaseService.instance.client;

  @override
  void initState() {
    super.initState();
    instance = this;
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String email = "";
  String password = "";

  doEmailLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(const MainNavigationView());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showInfoDialog("Wrong email or password");
    } catch (e) {
      print(e);
      showInfoDialog("An unexpected error occurred");
    }
  }

  doGoogleLogin() async {
    //fire_login_google
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: $userCredential");
      //TODO: on login success
      //------------------
      Get.offAll(const MainNavigationView());
    } catch (_) {
      print(_);
    }
  }

  void showInfoDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  doAnonymousLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      Get.offAll(const MainNavigationView());
    } on Exception catch (err) {
      print(err);
    }
  }
}
