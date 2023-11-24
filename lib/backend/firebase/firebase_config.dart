import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCvUXToLw-cf1XnYyJXJuQhl6pJNfrqkYk",
            authDomain: "chatty-wkoppk.firebaseapp.com",
            projectId: "chatty-wkoppk",
            storageBucket: "chatty-wkoppk.appspot.com",
            messagingSenderId: "148176219038",
            appId: "1:148176219038:web:59e7376f31f08f22a0848f"));
  } else {
    await Firebase.initializeApp();
  }
}
