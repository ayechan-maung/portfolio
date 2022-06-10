class OneSignalSet {
  final oneSignalId = '4414fa14-ebb5-449e-ae6c-a97ca1081bf0';
  bool _requireConsent = true;
  String _debugLabelString = "";
  String? _emailAddress;
  String? _smsNumber;
  String? _externalUserId;
  bool _enableConsentButton = false;

  // Future<void> initPlatformState() async {
  //
  //   // if (!mounted) return;
  //
  //   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  //
  //   OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);
  //
  //   OneSignal.shared
  //       .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
  //     print('NOTIFICATION OPENED HANDLER CALLED WITH: ${result}');
  //       _debugLabelString =
  //       "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
  //   });
  //
  //   OneSignal.shared
  //       .setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
  //     print('FOREGROUND HANDLER CALLED WITH: ${event}');
  //     /// Display Notification, send null to not display
  //     event.complete(null);
  //
  //       _debugLabelString =
  //       "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
  //   });
  //
  //   OneSignal.shared
  //       .setInAppMessageClickedHandler((OSInAppMessageAction action) {
  //       _debugLabelString =
  //       "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}";
  //   });
  //
  //   OneSignal.shared
  //       .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
  //     print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
  //   });
  //
  //   OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
  //     print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
  //   });
  //
  //   OneSignal.shared.setEmailSubscriptionObserver(
  //           (OSEmailSubscriptionStateChanges changes) {
  //         print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
  //       });
  //
  //   OneSignal.shared.setSMSSubscriptionObserver(
  //           (OSSMSSubscriptionStateChanges changes) {
  //         print("SMS SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
  //       });
  //
  //   // NOTE: Replace with your own app ID from https://www.onesignal.com
  //   await OneSignal.shared
  //       .setAppId("5b76e2c9-2950-4f89-ae17-34733cb0c2b7");
  //
  //   bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();
  //
  //     _enableConsentButton = requiresConsent;
  //
  //   // Some examples of how to use In App Messaging public methods with OneSignal SDK
  //   oneSignalInAppMessagingTriggerExamples();
  //
  //   OneSignal.shared.disablePush(false);
  //
  //   // Some examples of how to use Outcome Events public methods with OneSignal SDK
  //   oneSignalOutcomeEventsExamples();
  //
  //   bool userProvidedPrivacyConsent = await OneSignal.shared.userProvidedPrivacyConsent();
  //   print("USER PROVIDED PRIVACY CONSENT: $userProvidedPrivacyConsent");
  // }

  // void _handleGetTags() {
  //   OneSignal.shared.getTags().then((tags) {
  //     if (tags == null) return;
  //
  //     setState((() {
  //       _debugLabelString = "$tags";
  //     }));
  //   }).catchError((error) {
  //     setState(() {
  //       _debugLabelString = "$error";
  //     });
  //   });
  // }

  // void _handleSendTags() {
  //   print("Sending tags");
  //   OneSignal.shared.sendTag("test2", "val2").then((response) {
  //     print("Successfully sent tags with response: $response");
  //   }).catchError((error) {
  //     print("Encountered an error sending tags: $error");
  //   });
  //
  //   print("Sending tags array");
  //   var sendTags = {'test': 'value'};
  //   OneSignal.shared.sendTags(sendTags).then((response) {
  //     print("Successfully sent tags with response: $response");
  //   }).catchError((error) {
  //     print("Encountered an error sending tags: $error");
  //   });
  // }
  //
  // void _handlePromptForPushPermission() {
  //   print("Prompting for Permission");
  //   OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
  //     print("Accepted permission: $accepted");
  //   });
  // }
  //
  // void _handleGetDeviceState() async {
  //   print("Getting DeviceState");
  //   OneSignal.shared.getDeviceState().then((deviceState) {
  //     print("DeviceState: ${deviceState?.jsonRepresentation()}");
  //     this.setState(() {
  //       _debugLabelString = deviceState?.jsonRepresentation() ?? "Device state null";
  //     });
  //   });
  // }
  //
  // void _handleSetEmail() {
  //   if (_emailAddress == null) return;
  //
  //   print("Setting email");
  //
  //   OneSignal.shared.setEmail(email: _emailAddress!).whenComplete(() {
  //     print("Successfully set email");
  //   }).catchError((error) {
  //     print("Failed to set email with error: $error");
  //   });
  // }
  //
  // void _handleLogoutEmail() {
  //   print("Logging out of email");
  //
  //   OneSignal.shared.logoutEmail().then((v) {
  //     print("Successfully logged out of email");
  //   }).catchError((error) {
  //     print("Failed to log out of email: $error");
  //   });
  // }
  //
  // void _handleSetSMSNumber() {
  //   if (_smsNumber == null) return;
  //
  //   print("Setting SMS Number");
  //
  //   OneSignal.shared.setSMSNumber(smsNumber: _smsNumber!).then((response) {
  //     print("Successfully set SMSNumber with response $response");
  //   }).catchError((error) {
  //     print("Failed to set SMS Number with error: $error");
  //   });
  // }
  //
  // void _handleLogoutSMSNumber() {
  //   print("Logging out of smsNumber");
  //
  //   OneSignal.shared.logoutSMSNumber().then((response) {
  //     print("Successfully logoutEmail with response $response");
  //   }).catchError((error) {
  //     print("Failed to log out of SMSNumber: $error");
  //   });
  // }
  //
  // void _handleConsent() {
  //   print("Setting consent to true");
  //   OneSignal.shared.consentGranted(true);
  //
  //   print("Setting state");
  //   this.setState(() {
  //     _enableConsentButton = false;
  //   });
  // }
  //
  // void _handleSetLocationShared() {
  //   print("Setting location shared to true");
  //   OneSignal.shared.setLocationShared(true);
  // }
  //
  // void _handleDeleteTag() {
  //   print("Deleting tag");
  //   OneSignal.shared.deleteTag("test2").then((response) {
  //     print("Successfully deleted tags with response $response");
  //   }).catchError((error) {
  //     print("Encountered error deleting tag: $error");
  //   });
  //
  //   print("Deleting tags array");
  //   OneSignal.shared.deleteTags(['test']).then((response) {
  //     print("Successfully sent tags with response: $response");
  //   }).catchError((error) {
  //     print("Encountered an error sending tags: $error");
  //   });
  // }
  //
  // void _handleSetExternalUserId() {
  //   print("Setting external user ID");
  //   if (_externalUserId == null) return;
  //
  //   OneSignal.shared.setExternalUserId(_externalUserId!).then((results) {
  //     if (results == null) return;
  //
  //     this.setState(() {
  //       _debugLabelString = "External user id set: $results";
  //     });
  //   });
  // }

  // void _handleRemoveExternalUserId() {
  //   OneSignal.shared.removeExternalUserId().then((results) {
  //     if (results == null) return;
  //
  //       _debugLabelString = "External user id removed: $results";
  //   });
  // }
  //
  // void _handleSendNotification() async {
  //   var deviceState = await OneSignal.shared.getDeviceState();
  //
  //   if (deviceState == null || deviceState.userId == null)
  //     return;
  //
  //   var playerId = deviceState.userId;
  //
  //   var imgUrlString =
  //       "http://cdn1-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-2.jpg";
  //
  //   var notification = OSCreateNotification(
  //       playerIds: [playerId],
  //       content: "this is a test from OneSignal's Flutter SDK",
  //       heading: "Test Notification",
  //       iosAttachments: {"id1": imgUrlString},
  //       bigPicture: imgUrlString,
  //       buttons: [
  //         OSActionButton(text: "test1", id: "id1"),
  //         OSActionButton(text: "test2", id: "id2")
  //       ]);
  //
  //   var response = await OneSignal.shared.postNotification(notification);
  //
  //     _debugLabelString = "Sent notification with response: $response";
  // }
  //
  // void _handleSendSilentNotification() async {
  //   var deviceState = await OneSignal.shared.getDeviceState();
  //
  //   if (deviceState == null || deviceState.userId == null)
  //     return;
  //
  //   var playerId = deviceState.userId;
  //
  //   var notification = OSCreateNotification.silentNotification(
  //       playerIds: [playerId], additionalData: {'test': 'value'});
  //
  //   var response = await OneSignal.shared.postNotification(notification);
  //
  //     _debugLabelString = "Sent notification with response: $response";
  // }
  //
  // oneSignalInAppMessagingTriggerExamples() async {
  //   /// Example addTrigger call for IAM
  //   /// This will add 1 trigger so if there are any IAM satisfying it, it
  //   /// will be shown to the user
  //   OneSignal.shared.addTrigger("trigger_1", "one");
  //
  //   /// Example addTriggers call for IAM
  //   /// This will add 2 triggers so if there are any IAM satisfying these, they
  //   /// will be shown to the user
  //   Map<String, Object> triggers = new Map<String, Object>();
  //   triggers["trigger_2"] = "two";
  //   triggers["trigger_3"] = "three";
  //   OneSignal.shared.addTriggers(triggers);
  //
  //   // Removes a trigger by its key so if any future IAM are pulled with
  //   // these triggers they will not be shown until the trigger is added back
  //   OneSignal.shared.removeTriggerForKey("trigger_2");
  //
  //   // Get the value for a trigger by its key
  //   Object triggerValue = await OneSignal.shared.getTriggerValueForKey("trigger_3");
  //   print("'trigger_3' key trigger value: ${triggerValue?.toString()}");
  //
  //   // Create a list and bulk remove triggers based on keys supplied
  //   List<String> keys = ["trigger_1", "trigger_3"];
  //   OneSignal.shared.removeTriggersForKeys(keys);
  //
  //   // Toggle pausing (displaying or not) of IAMs
  //   OneSignal.shared.pauseInAppMessages(false);
  // }
  //
  // oneSignalOutcomeEventsExamples() async {
  //   // Await example for sending outcomes
  //   outcomeAwaitExample();
  //
  //   // Send a normal outcome and get a reply with the name of the outcome
  //   OneSignal.shared.sendOutcome("normal_1");
  //   OneSignal.shared.sendOutcome("normal_2").then((outcomeEvent) {
  //     print(outcomeEvent.jsonRepresentation());
  //   });
  //
  //   // Send a unique outcome and get a reply with the name of the outcome
  //   OneSignal.shared.sendUniqueOutcome("unique_1");
  //   OneSignal.shared.sendUniqueOutcome("unique_2").then((outcomeEvent) {
  //     print(outcomeEvent.jsonRepresentation());
  //   });
  //
  //   // Send an outcome with a value and get a reply with the name of the outcome
  //   OneSignal.shared.sendOutcomeWithValue("value_1", 3.2);
  //   OneSignal.shared.sendOutcomeWithValue("value_2", 3.9).then((outcomeEvent) {
  //     print(outcomeEvent.jsonRepresentation());
  //   });
  // }
  //
  // Future<void> outcomeAwaitExample() async {
  //   var outcomeEvent = await OneSignal.shared.sendOutcome("await_normal_1");
  //   print(outcomeEvent.jsonRepresentation());
  // }

}
