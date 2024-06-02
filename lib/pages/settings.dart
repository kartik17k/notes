import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/theme/theme.dart';
import 'package:notes/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Darkmode"),

            //switch
            CupertinoSwitch(
                value: Provider.of<themeProvider>(context ,listen: false).isdarkMode,
                onChanged: (value) => Provider.of<themeProvider>(context ,listen: false).toggleTheme())
          ],


        ),
      ),
    );
  }
}
