import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app.dart';
import 'core/bloc_observer.dart';
import 'firebase_options.dart';
import 'core/services/service_locator.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalObserver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [SystemUiOverlay.top]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // const FirebaseOptions(
    //     apiKey: "AIzaSyATxURl449Vcqq2fNHSHE8bBJp4mfnp_2k",
    //     authDomain: "flashcards-5984c.firebaseapp.com",
    //     projectId: "flashcards-5984c",
    //     storageBucket: "flashcards-5984c.appspot.com",
    //     messagingSenderId: "393510478049",
    //     appId: "1:393510478049:web:a3961386adacbb971b57a0"
    // ),
  );
  await sl.init();
  runApp(const App());
}
