class OneSignalUtils {
  final oneSignalId = '4414fa14-ebb5-449e-ae6c-a97ca1081bf0';

  Future selectNotification(String payload) async {
    //Handle notification tapped logic here
    print("On Notification Local Tap: " + payload);
    // if(Platform.isAndroid){
    //     Map<String, dynamic> map =
    //       json.decode(result.notification.payload.rawPayload['custom']);

    //   print("Click to Open Notification ${map['a']}");

    //   if (map['a']['type'] == "Chat") {
    //     UserDoc userDoc = UserDoc(
    //         sId: map['a']['senderId'] == UserConsts.userId
    //             ? map['a']['receiverId']
    //             : map['a']['senderId'],
    //         profile: Profile(
    //             fullName: map['a']['title'],
    //             url: map['a']['senderId'] == UserConsts.userId
    //                 ? map['a']['receiverUrl']
    //                 : map['a']['senderUrl']));
    //     Get.to(ChatPage(userDoc));
    // }
  }

  // Future initOneSignal(BuildContext context) async {
  //   var instance = OneSignal.shared;
  //   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  //
  //   await OneSignal.shared.setAppId('5b76e2c9-2950-4f89-ae17-34733cb0c2b7');
  //   await instance.setRequiresUserPrivacyConsent(true);
  //   await OneSignal.shared.consentGranted(true);
  //   await OneSignal.shared
  //       .promptUserForPushNotificationPermission(fallbackToSettings: true);
  //   // OneSignal.shared.setNotificationOpenedHandler(_onOpenedNotification);
  //   OneSignal.shared
  //       .promptUserForPushNotificationPermission(fallbackToSettings: true);
  //   OneSignal.shared
  //       .setSubscriptionObserver((OSSubscriptionStateChanges handler) {
  //     print("Onesignal USER_ID in observer ${handler.to.userId}");
  //   });
  //   OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {});
  //   // var status = await OneSignal.shared.getPermissionSubscriptionState();
  //   // String oneSignalId = status.subscriptionStatus.userId;
  // }

  // void _onGettingNotification(
  //     OSNotification notification, BuildContext context) async {
  //   print("_onGettingNotification::");
  //   print(notification.payload.rawPayload['custom']);
  //   if (Platform.isAndroid) {
  //     Map<String, dynamic> map =
  //     json.decode(notification.payload.rawPayload['custom']);
  //
  //     UserDoc userDoc = UserDoc(
  //         sId: map['a']['senderId'] == UserConsts.userId
  //             ? map['a']['receiverId']
  //             : map['a']['senderId'],
  //         profile: Profile(
  //             fullName: map['a']['title'],
  //             url: map['a']['senderId'] == UserConsts.userId
  //                 ? map['a']['receiverUrl']
  //                 : map['a']['senderUrl']));
  //
  //     Locally locally = Locally(
  //       context: context,
  //       payload: 'test',
  //       pageRoute: MaterialPageRoute(
  //           builder: (context) => ChatPage(
  //             userDoc,
  //             id: map['a']['chatId'],
  //           )),
  //       appIcon: 'drawable/ic_launcher',
  //     );
  //     locally.show(title: map['a']['title'], message: map['a']['body']);
  //   }
  //   FlutterAppBadger.updateBadgeCount(1);
  // }

  // void _onOpenedNotification(OSNotificationOpenedResult result) async {
  //   if (Platform.isAndroid) {
  //     Map<String, dynamic> map =
  //     json.decode(result.notification.payload.rawPayload['custom']);
  //
  //     print("Click to Open Notification ${map['a']}");
  //
  //     if (map['a']['type'] == "Chat") {
  //       UserDoc userDoc = UserDoc(
  //           sId: map['a']['senderId'] == UserConsts.userId
  //               ? map['a']['receiverId']
  //               : map['a']['senderId'],
  //           profile: Profile(
  //               fullName: map['a']['title'],
  //               url: map['a']['senderId'] == UserConsts.userId
  //                   ? map['a']['receiverUrl']
  //                   : map['a']['senderUrl']));
  //       Get.to(ChatPage(userDoc, id: map['a']['chatId']));
  //     } else {
  //       if (map['a'].containsKey("propertyId")) {
  //         fetchSingleProperty(map['a']['propertyId']).then((value) {
  //           Get.to(DetailPage(content: value))
  //               .then((value) => Get.offAll(RootPage()));
  //         }).catchError((e) {
  //           AppConst.isOpenByNotification = false;
  //           Get.offAll(RootPage());
  //         });
  //       } else {
  //         Get.offAll(NotificationDetailPage(map['a']['title'], "new message",
  //             url: map['a']['url'] ?? "", videoLink: map['a']['videoLink'] ??"",isOpenByNotification: true));
  //       }
  //     }
  //   } else {
  //     if (result.notification.payload.rawPayload['custom']['a']
  //         .containsKey("propertyId")) {
  //       fetchSingleProperty(result.notification.payload.rawPayload['custom']
  //       ['a']['propertyId'])
  //           .then((value) {
  //         Get.to(DetailPage(content: value))
  //             .then((value) => Get.offAll(RootPage()));
  //       }).catchError((e) {
  //         AppConst.isOpenByNotification = false;
  //         Get.offAll(RootPage());
  //       });
  //     } else {
  //       Get.offAll(NotificationDetailPage(
  //         result.notification.payload.rawPayload['custom']['a']['title'],
  //         result.notification.payload.rawPayload['custom']['a']['body'], videoLink:result.notification.payload.rawPayload['custom']['a']['videoLink'] ,url:result.notification.payload.rawPayload['custom']['a']['url'] ,));
  //     }
  //   }
  // }

}
