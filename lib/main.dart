import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/screens/splash_screen.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/models/model.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //for call zego
  final navigatorKey = GlobalKey<NavigatorState>();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ZegoUIKit().initLog().then((value) {
    ///  Call the `useSystemCallingUI` method
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(PixMania(navigatorKey: navigatorKey));
  });
  // runApp(PixMania(
  //   navigatorKey: navigatorKey,
  // ));
}

class PixMania extends StatefulWidget {
  const PixMania({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<PixMania> createState() => _PixManiaState();
}

class _PixManiaState extends State<PixMania> {
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
            navigatorKey: widget.navigatorKey,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            theme: ThemeData(
              textTheme: GoogleFonts.latoTextTheme(),
              scaffoldBackgroundColor: scafoldBg,
              primarySwatch: Colors.teal,
            )),
      ),
    );
  }
}
