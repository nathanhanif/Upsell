import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redo/layout/carousel.dart';
import 'package:redo/screens/dialog.dart';
import 'package:redo/screens/promte.dart';
import 'package:redo/screens/home/brew_list.dart';
import 'package:redo/screens/home/brew_tile.dart';
import 'package:redo/screens/home/home.dart';
import 'package:redo/screens/home/settings_form.dart';
import 'package:redo/services/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class Bod extends StatefulWidget {
  @override
  _BodState createState() => _BodState();
}

class _BodState extends State<Bod> {
  final AuthService _auth = AuthService();
  Future<void> _launched;
  String phoneNumber = "";

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldnt Open Dailer";
    }
  }

  String _launchUrl = "https://www.google.com";

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
    void _showSettingsPanel() {
      showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: SettingsForm());
          });
    }

    ;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          title: Text(
            "Easy Sell",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          backgroundColor: Colors.deepOrange,
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.search),
            //   //padding: EdgeInsets.only(right: 5),
            //   onPressed: () {},
            // ),
            // IconButton(
            //     icon: Icon(
            //       Icons.notifications,
            //     ),
            //     padding: EdgeInsets.only(right: 0),
            //     onPressed: () {}),
            IconButton(
              icon: Icon(Icons.logout),
              // label: Text("logout"),
              padding: EdgeInsets.only(right: 0),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ]),
      drawer: Container(
          width: 170,
          child: Drawer(
              child: Column(children: <Widget>[
            Container(
                width: 260,
                height: 140,
                // color: Colors.deepOrangeAccent,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    // shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/Upsell logo PNG2w.png"),
                        fit: BoxFit.fitWidth))),
            //child: Center(

            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.deepOrangeAccent,
              ),
              title: Text("Home"),
              onTap: () {
                Future push = Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Bod()));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.deepOrangeAccent,
              ),
              title: Text("Update Profile"),
              onTap: () => _showSettingsPanel(),
            ),

            ListTile(
                leading: Icon(
                  Icons.call,
                  color: Colors.deepOrangeAccent,
                ),
                title: Text("Contact us"),
                onTap: () {
                  setState(() {
                    _launched = _makePhoneCall("tel: +254705013411");
                  });
                }),

            ListTile(
              leading: Icon(
                Icons.camera_alt_sharp,
                color: Colors.deepOrangeAccent,
              ),
              title: Text("EasySell Instagram"),
              onTap: () {
                _launchUniversalLinkIos(
                    "https://instagram.com/easysell.254?utm_medium=copy_link");
              },
            ),

            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.deepOrangeAccent,
              ),
              title: Text(
                "About",
              ),
              onTap: () {
                Future push = Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dlog()));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.deepOrangeAccent,
              ),
              title: Text(
                "Logout",
              ),
              onTap: () async {
                await _auth.signOut();
              },
            ),
          ]))),
      body: Stack(
        children: [
          Positioned(
            right: 5,
            top: 8,
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/swatch.jpg"),
                        fit: BoxFit.fill),
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 125,
                width: 350,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => _showSettingsPanel(),
                    ),
                    Positioned(
                      top: 25,
                      left: 10,
                      child: Text(
                        "MY",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            fontFamily: 'fonts/Montserrat-Bold.otf'),
                      ),
                    ),
                    Positioned(
                        top: 45,
                        left: 10,
                        child: Text(
                          "BUSINESS",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 25.0,
                              fontFamily: 'fonts/Montserrat-Bold.otf'),
                        )),
                    Positioned(
                        top: 75,
                        left: 10,
                        child: Text(
                          "Dashboard",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 35.0,
                              fontFamily: 'fonts/Montserrat-Bold.otf'),
                        )),
                  ],
                )),
          ),
          Positioned(
            left: 5,
            top: 143,
            child: Container(
              height: 130,
              child: Text('                    Deals Of The Week',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                      color: Colors.deepPurple,
                      fontFamily: 'fonts/MontserratAlternates-Light.otf')),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 170),
            child: ListView(
              children: <Widget>[
                CarouselSlider(
                  height: 220,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1200),
                  viewportFraction: 0.8,
                  items: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("images/pic1.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("images/pic2.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("images/pic3.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("images/pic4.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Stack(children: [
              Positioned(
                  left: 10,
                  top: 385,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/buy.jpg"),
                            fit: BoxFit.cover)),
                    height: 75,
                    width: 340,
                    child: GestureDetector(
                      onTap: () {
                        Future push = Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),

                    //color: Colors.white,
                  )),
              Positioned(
                  left: 10,
                  top: 465,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/selling.jpg"),
                            fit: BoxFit.cover)),
                    height: 75,
                    width: 340,
                    child: GestureDetector(
                      onTap: () => _showSettingsPanel(),
                    ),

                    // color: Colors.white,
                  )),
              Positioned(
                  left: 10,
                  top: 545,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/prom.jpg"),
                            fit: BoxFit.cover)),
                    height: 75,
                    width: 340,
                    child: GestureDetector(
                      onTap: () {
                        _launchUniversalLinkIos(
                            "https://instagram.com/easysell.254?utm_medium=copy_link");
                      },
                    ),
                    //color: Colors.white,
                  )),
              // Positioned(
              //     right: 95,
              //     top: 480,
              //     child: Container(
              //       decoration: BoxDecoration(
              //           image: DecorationImage(
              //               image: AssetImage("images/cont.jpg"),
              //               fit: BoxFit.cover)),
              //       height: 135,
              //       width: 80,
              //       //color: Colors.white,
              //     )),
            ]),
          )
        ],
      ),
    );
  }
}
