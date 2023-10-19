import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:whoever/firebase_options.dart';

final firebaseProvider = StateNotifierProvider<FirebaseNotifier, bool>(
  (ref) => FirebaseNotifier(),
);

class FirebaseNotifier extends StateNotifier<bool> {
  FirebaseNotifier() : super(false) {
    _init();
  }
  late FirebaseApp _firebase;
  FirebaseApp get firebase => _firebase;

/* INSTANCE INIT */
  Future<void> _init() async {
    _firebase = await Firebase.initializeApp();
    // _firebase.options = DefaultFirebaseOptions.currentPlatform;
  }
}
