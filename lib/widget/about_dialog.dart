import 'package:flutter/material.dart';

class DoomAboutDialog extends StatelessWidget {
  const DoomAboutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AboutDialog(
      applicationVersion: "1.0.1",
      children: [
        ListTile(
          title: Text("Made by"),
          subtitle: Text("Hasan Kadhem"),
          leading: Icon(Icons.person),
        ),
        ListTile(
          title: Text("Made using"),
          subtitle: Text("Flutter"),
          leading: FlutterLogo(),
        ),
      ],
    );
  }
}