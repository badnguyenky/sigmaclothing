import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyArvKu1hs3gQR3-oE_bTsrg7Y4bosDjgT4",
            authDomain: "sigmaclothing-c180e.firebaseapp.com",
            projectId: "sigmaclothing-c180e",
            storageBucket: "sigmaclothing-c180e.appspot.com",
            messagingSenderId: "949270783530",
            appId: "1:949270783530:web:df4092e8bdafc99e384553",
            measurementId: "G-0R7NT9X6QP"));
  } else {
    await Firebase.initializeApp();
  }
}
