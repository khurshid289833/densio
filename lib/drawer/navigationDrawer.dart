import 'package:flutter/material.dart';
import 'package:untitled2/drawer/pageRoutes.dart';

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
SizedBox(height: 15,),
Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
            child: Text("DEVICE MAINTAINANCE",style: TextStyle(color: Colors.black54),),
          ),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Webhooks',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),

          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Preferences',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 5, 0),
            child: Text("PEOPLE",style: TextStyle(color: Colors.black54),),
          ),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'My Team',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Billing',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 5, 0),
            child: Text("DOCUMENTATION",style: TextStyle(color: Colors.black54),),
          ),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Start Guide',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'How it works',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'FAQ',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Contact Support',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.webhook),
          ),
        ],
      ),
    );
  }
}