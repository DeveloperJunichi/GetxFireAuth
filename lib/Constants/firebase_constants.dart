import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// Firebaseインスタンスを作成する
FirebaseAuth auth = FirebaseAuth.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
