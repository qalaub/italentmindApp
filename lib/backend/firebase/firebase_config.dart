import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBdSD1V_nmsQYUyBg_iyfNoXW3ttmRAMxU",
            authDomain: "italentmind-3b9f7.firebaseapp.com",
            projectId: "italentmind-3b9f7",
            storageBucket: "italentmind-3b9f7.appspot.com",
            messagingSenderId: "643567490094",
            appId: "1:643567490094:web:2c0ccaff3d7beb71d8fbbf"));
  } else {
    await Firebase.initializeApp();
  }
}
