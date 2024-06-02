import 'package:flutter/material.dart';
import 'package:notes/components/drawerTile.dart';
import 'package:notes/pages/settings.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(

        children: [
          //icon
          DrawerHeader(child: Icon(Icons.note)),
          //home
          drawerTile(
              text: 'Home',
              leading: Icon(Icons.home),
              onTap: () => Navigator.pop(context),
          ),
          //setting
          drawerTile(
              text: 'Settings',
              leading: Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => settings()));
              }
          )
        ],
      ),
    );
  }
}
