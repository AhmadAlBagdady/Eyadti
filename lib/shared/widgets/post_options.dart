import 'package:flutter/material.dart';

class PostOptions extends StatelessWidget {
  const PostOptions({Key? key, required this.deleteFunc, required this.editFunc}) : super(key: key);
final Function() deleteFunc;
final Function() editFunc;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
         PopupMenuItem(
          child: ListTile(
            onTap: deleteFunc,
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
         PopupMenuItem(
          child: ListTile(
            onTap: editFunc,
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
      ],
    );
  }
}
