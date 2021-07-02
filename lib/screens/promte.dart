import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlDemo extends StatefulWidget {
  const LaunchUrlDemo({Key key}) : super(key: key);
  final String title = "Launch Url";

  @override
  _LaunchUrlDemoState createState() => _LaunchUrlDemoState();
}

class _LaunchUrlDemoState extends State<LaunchUrlDemo> {
  Future<void> _launched;
  String phoneNumber = "";
  String _launchUrl = "https://www.google.com";

  // Future<void> _launchInBrowser(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: true,
  //       universalLinksOnly: false,
  //       headers: <String, String>{"header_key": "header_value"},
  //     );
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  // Future<void> _launchInApp(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: true,
  //       universalLinksOnly: true,
  //       headers: <String, String>{"header_key": "header_value"},
  //     );
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(
        "https://instagram.com/easysell.254?utm_medium=copy_link")) {
      final bool nativeAppLaunchedSucceeded = await launch(
        "https://instagram.com/easysell.254?utm_medium=copy_link",
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchedSucceeded) {
        await launch("https://instagram.com/easysell.254?utm_medium=copy_link",
            forceSafariVC: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // RaisedButton(
            //   child: const Text("Launch in Browser"),
            //   onPressed: () {
            //     _launchInBrowser(_launchUrl);
            //   },
            // ),
            // RaisedButton(
            //   child: const Text("Launch in App"),
            //   onPressed: () {
            //     _launchInApp(_launchUrl);
            //   },
            // ),
            RaisedButton(
              child: const Text("Launch universal link"),
              onPressed: () {
                _launchUniversalLinkIos(
                    "https://instagram.com/easysell.254?utm_medium=copy_link");
              },
            ),
            FutureBuilder(
              future: _launched,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
