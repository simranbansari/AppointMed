import 'package:flutter/material.dart';
import '../constants.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileTabState();
  }
}

class ProfileTabState extends State<ProfileTab> {
  // Title of the page: 'Profile'
  Widget title() {
    return Text(
      'Profile',
      textAlign: TextAlign.left,
      style: headingText1,
    );
  }

  // Returns user's photo, name and member status
  Widget profileCover(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        "SIM SIM",
        textAlign: TextAlign.left,
        style: headingText3,
      ),
      margin: EdgeInsets.only(left: 15.0),
    );
  }

  // User's e-mail and phone #
  Widget contactInfo() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Text('Contact Info', style: headingText2),
                  )),
            ],
          ),
          Divider(thickness: 1.0, indent: 17.0, endIndent: 18.0, height: 0.0),
          Container(margin: EdgeInsets.only(bottom: 20.0)),
          contactInfoRow(Icons.phonelink_ring, "6472226023"),
          Container(margin: EdgeInsets.only(bottom: 10.0)),
          contactInfoRow(Icons.mail_outline, "simsim@AppointMed.ca"),
          Container(margin: EdgeInsets.only(bottom: 10.0)),
          contactInfoRow(Icons.credit_card, "5739 - 283 - 823 - KS"),
        ]);
  }

  Widget contactInfoRow(IconData iconType, String info) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            //margin: EdgeInsets.only(left: 15.0),
            child: Icon(
              iconType,
              color: Color(0xFF555555),
              size: 30.0,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Text(
            info,
            style: bodyText,
          ),
        ),
      ],
    );
  }

  Widget signOutButton() {
    return OutlineButton(
      borderSide: BorderSide(
        color: appThemeColor,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
      ),
      child: Text(
        'SIGN OUT',
        style: TextStyle(
          color: appThemeColor,
          fontSize: 18.0,
          fontFamily: appFont,
        ),
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 40.0, left: 15.0),
            child: title(),
          ),
          Container(margin: EdgeInsets.only(bottom: 40.0)),
          profileCover(context),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03)),
          contactInfo(),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1)),
          signOutButton(),
        ],
      ),
    );
  }
}
