import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC_fnFowwAQWZfZFxhlpG1XfRu7nELdaZA",
            authDomain: "i-m-grateful.firebaseapp.com",
            projectId: "i-m-grateful",
            storageBucket: "i-m-grateful.appspot.com",
            messagingSenderId: "253994998931",
            appId: "1:253994998931:web:de584746c6c585ffb64166",
            measurementId: "G-47NKJQX7CF"));
  } else {
    await Firebase.initializeApp();
  }
}
