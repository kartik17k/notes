import 'package:flutter/material.dart';

class drawerTile extends StatelessWidget {
  final String text;
  final Widget leading;
  final void Function()? onTap;
  drawerTile({
    super.key,
    required this.text,
    required this.leading,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0),
      child: ListTile(
        title: Text(
          text,
          // style: TextStyle(
          //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // ),

        ),
        leading: leading,
        onTap: onTap,

      ),
    );
  }
}
