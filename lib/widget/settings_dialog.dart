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
          leading: Theme.of(context).brightness == Brightness.dark
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
          title: const Text("Theme Mode"),
          trailing: DropdownButtonHideUnderline(
            child: ValueListenableBuilder(
              valueListenable: themeMode,
              builder: (context, value, child) {
                return DropdownButton(
                  value: value,
                  onChanged: (value) {
                    if (value != null) {
                      themeMode.value = value;
                      saveData();
                    }
                  },
                  items: ThemeMode.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString().split(".")[1]),
                          ))
                      .toList(),
                );
              },
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: showImages,
          builder: (context, show, child) {
            return SwitchListTile.adaptive(
              secondary: const Icon(Icons.image),
              title: const Text("Show Images"),
              value: show,
              onChanged: (value) {
                showImages.value = value;
                saveData();
              },
            );
          },
        ),
      ],
    );
  }
}
