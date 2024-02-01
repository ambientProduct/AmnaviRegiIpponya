import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAC4C3I5qXWtwPGdiyusHE_BonhoEiMlOE",
            authDomain: "ipponyatest.firebaseapp.com",
            projectId: "ipponyatest",
            storageBucket: "ipponyatest.appspot.com",
            messagingSenderId: "480916990528",
            appId: "1:480916990528:web:ac7f1d4d9fca321ae1cda5",
            measurementId: "G-7PDP56SH67"));
  } else {
    await Firebase.initializeApp();
  }
}
