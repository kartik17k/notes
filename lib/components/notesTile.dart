import 'package:flutter/material.dart';

class notesTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const notesTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 12,right: 15,left: 15),
      child: ListTile(
        title: Text(text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            IconButton(
                onPressed: onEditPressed,
                icon: Icon(Icons.edit)),

            IconButton(
                onPressed: onDeletePressed,
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
