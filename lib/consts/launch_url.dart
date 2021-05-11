import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static void launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Can not launch $url";
    }
  }
}
