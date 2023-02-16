// Default
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool hideActionProfile;
  final bool actionReturnButton;
  const AppBarWidget({Key? key, required this.title, required this.hideActionProfile, required this.actionReturnButton}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(60);

}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {

    if (widget.hideActionProfile) {
      return AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: widget.actionReturnButton
      );
    } else {
      return AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: widget.actionReturnButton,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "profile_screen");
              },
              icon: const Icon(Icons.account_circle)
          )
        ],
      );
    }
  }
}