import 'package:url_launcher/url_launcher.dart';

class Method {
  //For launching normal link
  launchURL(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $link';
    }
  }

  //For launching email
  launchEmail() async {
    if (await canLaunchUrl(Uri.parse("mailto:sajid.ed@gmail.com"))) {
      await launchUrl(Uri.parse("mailto:sajid.ed@gmail.com"));
    } else {
      throw 'Could not launch';
    }
  }
}
