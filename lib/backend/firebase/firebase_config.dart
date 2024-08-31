import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBFah3AChco4NmnhFZ2ICC9jRbU_WW0KZE",
            authDomain: "factorapp-5cc7a.firebaseapp.com",
            projectId: "factorapp-5cc7a",
            storageBucket: "factorapp-5cc7a.appspot.com",
            messagingSenderId: "502449802235",
            appId: "1:502449802235:web:dc72a9061e81374263d95e",
            measurementId: "G-7QH4W7Z6WN"));
  } else {
    await Firebase.initializeApp();
  }
}
