import 'package:flutter/cupertino.dart';
import 'package:pixmania/constants/zego_cloud.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class ZegoService {
  ZegoService({required this.ctx});
  BuildContext ctx;

  void onUserLogin() {
    final user = Provider.of<UserProvider>(ctx).getUser;

    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: Statics.appID,
      appSign: Statics.appSign,
      userID: user.uid,
      userName: user.userName as String,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}
