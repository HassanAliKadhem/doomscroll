import 'package:flutter/material.dart';

import '../data/settings.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Settings"),
      children: [
        ListTile(
          title: const Text("Theme Mode"),
          trailing: ValueListenableBuilder(
              valueListenable: themeMode,
              builder: (context, value, child) {
                return DropdownButton(
                  value: value,
                  onChanged: (value) => themeMode.value = value!,
                  items: ThemeMode.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString().split(".")[1]),
                          ))
                      .toList(),
                );
              }),
        ),
      ],
    );
  }
}