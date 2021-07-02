import 'package:flutter/material.dart';
import 'package:redo/models/brew.dart';
import 'package:url_launcher/url_launcher.dart';

class BrewTile extends StatelessWidget {
  Future<void> _launched;
  String _launchUrl = "https://www.google.com";
  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch("${brew.instagram}")) {
      final bool nativeAppLaunchedSucceeded = await launch(
        "${brew.instagram}",
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchedSucceeded) {
        await launch("${brew.instagram}", forceSafariVC: true);
      }
    }
  }

  final Brew brew;

  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.amber,
              backgroundImage: AssetImage("images/lead.png"),
            ),
            title: Text(brew.name),
            subtitle: Text("selling ${brew.selling}"),
            onTap: () {
              _launchUniversalLinkIos("${brew.instagram}");
            },
          ),
        ));
  }
}
