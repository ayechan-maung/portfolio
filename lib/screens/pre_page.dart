import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:portfolio/consts/app_consts.dart';
import 'package:portfolio/consts/notification.dart';
import 'package:portfolio/screens/splash_screen.dart';
import 'package:portfolio/views/skill/skills.dart';

class PrePage extends StatefulWidget {
  @override
  _PrePageState createState() => _PrePageState();
}

class _PrePageState extends State<PrePage> {
  String oneSignalId = '5b76e2c9-2950-4f89-ae17-34733cb0c2b7';
  OneSignal og = OneSignal.shared;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  BranchContentMetaData metadata = BranchContentMetaData();
  late BranchUniversalObject buo;
  BranchLinkProperties lp = BranchLinkProperties();
  BranchEvent? eventStandart;
  late BranchEvent eventCustom;

  StreamSubscription<Map>? streamSubscription;
  StreamController<String> controllerData = StreamController<String>();
  StreamController<String> controllerInitSession = StreamController<String>();
  StreamController<String> controllerUrl = StreamController<String>();

  @override
  void initState() {
    super.initState();
    // initNotification();
    // OneSignalSet().initPlatformState();
    // OneSignalUtils().initOneSignal(context);
    OneSignal.shared.setAppId(oneSignalId);
    FlutterBranchSdk.validateSDKIntegration();
    listenDynamicLinks();
    initDeepLinkData();
  }

  initNotification() async {
    var status = await (OneSignal.shared.getDeviceState() as FutureOr<OSDeviceState>);
    // var userId = status.userId;
    // if(userId != null){
    print('user id==> ' + status.userId.toString());
    // }
  }

  void listenDynamicLinks() async {
    streamSubscription = FlutterBranchSdk.initSession().listen((data) {
      print('listenDynamicLinks - DeepLink Data: $data');
      controllerData.sink.add((data.toString()));
      if (data.containsKey('+clicked_branch_link') &&
          data['+clicked_branch_link'] == true) {
        print(
            '------------------------------------Link clicked----------------------------------------------');
        print('Custom string: ${data['custom_string']}');
        print('Custom number: ${data['custom_number']}');
        print('Custom bool: ${data['custom_bool']}');
        print('Custom list number: ${data['custom_list_number']}');
        print(
            '------------------------------------------------------------------------------------------------');
      }
      if (data['key'] == "eduAndSkills") {
        print(data.toString());
        print('will go to ----->');
        print(data['order_number']);
        Get.to(Skills());
      }
    }, onError: (error) {
      PlatformException platformException = error as PlatformException;
      print(
          'InitSession error: ${platformException.code} - ${platformException.message}');
      controllerInitSession.add(
          'InitSession error: ${platformException.code} - ${platformException.message}');
    });
  }

  void initDeepLinkData() {
    metadata =
        BranchContentMetaData().addCustomMetadata('custom_string', 'abc');
    //--optional Custom Metadata
    /*
    metadata.contentSchema = BranchContentSchema.COMMERCE_PRODUCT;
    metadata.price = 50.99;
    metadata.currencyType = BranchCurrencyType.BRL;
    metadata.quantity = 50;
    metadata.sku = 'sku';
    metadata.productName = 'productName';
    metadata.productBrand = 'productBrand';
    metadata.productCategory = BranchProductCategory.ELECTRONICS;
    metadata.productVariant = 'productVariant';
    metadata.condition = BranchCondition.NEW;
    metadata.rating = 100;
    metadata.ratingAverage = 50;
    metadata.ratingMax = 100;
    metadata.ratingCount = 2;
    metadata.setAddress(
        street: 'street',
        city: 'city',
        region: 'ES',
        country: 'Brazil',
        postalCode: '99999-987');
    metadata.setLocation(31.4521685, -114.7352207);
*/

    buo = BranchUniversalObject(
        canonicalIdentifier: 'flutter/branch',
        //canonicalUrl: '',
        title: 'View My Skills',
        imageUrl:
            'https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg',
        contentDescription: 'My Skills from portfolio',
        contentMetadata: BranchContentMetaData(),
        // ..addCustomMetadata('custom_string', 'abc')
        // ..addCustomMetadata('custom_number', 12345)
        // ..addCustomMetadata('custom_bool', true)
        // ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
        // ..addCustomMetadata('custom_list_string', ['a', 'b', 'c']),
        keywords: ['Plugin', 'Branch', 'Flutter'],
        publiclyIndex: true,
        locallyIndex: true,
        expirationDateInMilliSec:
            DateTime.now().add(Duration(days: 365)).millisecondsSinceEpoch);

    //parameter canonicalUrl
    //If your content lives both on the web and in the app, make sure you set its canonical URL
    // (i.e. the URL of this piece of content on the web) when building any BUO.
    // By doing so, we’ll attribute clicks on the links that you generate back to their original web page,
    // even if the user goes to the app instead of your website! This will help your SEO efforts.

    FlutterBranchSdk.registerView(buo: buo);

    lp = BranchLinkProperties(
        channel: 'My Detail',
        feature: 'sharing',
        //alias: 'flutterplugin' //define link url,
        stage: 'new share',
        campaign: 'xxxxx',
        tags: ['one', 'two', 'three']);
    lp.addControlParam('\$uri_redirect_mode', '1');

    //parameter alias
    //Instead of our standard encoded short url, you can specify the vanity alias.
    // For example, instead of a random string of characters/integers, you can set the vanity alias as *.app.link/devonaustin.
    // Aliases are enforced to be unique** and immutable per domain, and per link - they cannot be reused unless deleted.

    eventStandart = BranchEvent.standardEvent(BranchStandardEvent.ADD_TO_CART);
    //--optional Event data
    /*
    eventStandart!.transactionID = '12344555';
    eventStandart!.currency = BranchCurrencyType.BRL;
    eventStandart!.revenue = 1.5;
    eventStandart!.shipping = 10.2;
    eventStandart!.tax = 12.3;
    eventStandart!.coupon = 'test_coupon';
    eventStandart!.affiliation = 'test_affiliation';
    eventStandart!.eventDescription = 'Event_description';
    eventStandart!.searchQuery = 'item 123';
    eventStandart!.adType = BranchEventAdType.BANNER;
    eventStandart!.addCustomData(
        'Custom_Event_Property_Key1', 'Custom_Event_Property_val1');
    eventStandart!.addCustomData(
        'Custom_Event_Property_Key2', 'Custom_Event_Property_val2');
     */
    eventCustom = BranchEvent.customEvent('Custom_event');
    eventCustom.addCustomData(
        'Custom_Event_Property_Key1', 'Custom_Event_Property_val1');
    eventCustom.addCustomData(
        'Custom_Event_Property_Key2', 'Custom_Event_Property_val2');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
          fontFamily: 'Open Sans',
          primaryColor: Color(0xFFB0BEC5),
          accentColor: Color(0xFF455A64),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.blue[800], fontSize: 16),
            bodyText2: TextStyle(color: Colors.blue[800], fontSize: 16),
          ),
          iconTheme: IconThemeData(color: Colors.blue[800]),
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.blue[900]),
              backgroundColor: Color(0xFFECEFF1),
              titleTextStyle: TextStyle(color: Colors.blue[800]),
              titleSpacing: 1.1)),
      home: DefaultTextStyle(
          style: TextStyle(color: Colors.blue[800], fontSize: 16),
          child: SplashScreen()),
    );
  }

  void generateLink() async {
    BranchResponse response =
        await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);
    if (response.success) {
      controllerUrl.sink.add('${response.result}');
    } else {
      controllerUrl.sink
          .add('Error : ${response.errorCode} - ${response.errorMessage}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    controllerData.close();
    controllerUrl.close();
    controllerInitSession.close();
    streamSubscription?.cancel();
  }
}
