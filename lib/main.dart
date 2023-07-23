import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/widgets/login_widgets/colors.dart';
import 'package:pixmania/screens/splash_screen.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/models/model.dart';
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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          )
        ],
        child: MaterialApp(
            home: const SplashScreen(),
            theme: ThemeData(
              textTheme: GoogleFonts.latoTextTheme(),
              scaffoldBackgroundColor: scafoldBg,
              primarySwatch: Colors.teal,
              // primaryColor: Colors.greenAccent
            )),
      ),
    );
  }
}
