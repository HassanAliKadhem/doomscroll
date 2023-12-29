import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<ThemeMode> themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);
ValueNotifier<bool> showImages = ValueNotifier<bool>(true);

Map<int, ThemeMode> _themes = ThemeMode.values.asMap();

late final SharedPreferences preferences;

void loadData() async {
  preferences = await SharedPreferences.getInstance();
  themeMode.value =
      _themes[preferences.getInt("themeMode") ?? 0] ?? ThemeMode.system;
  showImages.value = preferences.getBool("showImages") ?? true;
}

void saveData() {
  preferences.setInt(
      "themeMode",
      _themes.keys.firstWhere(
        (e) => _themes[e] == themeMode.value,
        orElse: () => 0,
      ));
  preferences.setBool("showImages", showImages.value);
}
