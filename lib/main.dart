import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/screens/splash_screen.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/user%20model/model.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PixMania());
}

class PixMania extends StatelessWidget {
  const PixMania({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthServices().userLog,
      initialData: null,
      child: MaterialApp(
          home: SplashScreen(),
          theme: ThemeData(
              scaffoldBackgroundColor: Color.fromARGB(255, 221, 247, 236),
              primarySwatch: Colors.teal,
              primaryColor: Colors.greenAccent)),
    );
  }
}
