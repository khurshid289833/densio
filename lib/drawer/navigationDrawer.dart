import 'package:flutter/material.dart';
import 'package:untitled2/drawer/pageRoutes.dart';
import 'package:untitled2/utils/appString.dart';

import '../main.dart';
import 'createDrawerBodyItem.dart';
import 'createDrawerHeader.dart';

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          SizedBox(
            height: 15,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
            child: Text(
              AppString.deviceMaintainance,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          createDrawerBodyItem(
            icon: Icons.home,
            text: AppString.home,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: AppString.webHooks,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.event_note,
            text: AppString.preferences,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 5, 0),
            child: Text(
              AppString.people,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: AppString.myTeam,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: AppString.billing,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 5, 0),
            child: Text(
              AppString.documentation,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: AppString.startGuide,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: AppString.howItWorks,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: AppString.faq,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: AppString.contactSupport,
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),

          createDrawerBodyItem(
            icon: Icons.logout,
            text: AppString.logout,
            onTap: () {
              sharedPreferences.setBool('isLogin', false);
              Navigator.pushReplacementNamed(context, pageRoutes.login);

            }


          ),
        ],
      ),
    );
  }
}
