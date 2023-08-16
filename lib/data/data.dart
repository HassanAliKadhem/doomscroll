import 'dart:math';

import 'countries.dart';

List<String> tragedy = [
  "A terrorist attack was carried by religious extremists",
  "A hurricaine has caused massive damage",
  "A bridge has collapsed killing many",
  "A violent coup has ended democracy",
];
int tragedyLength = tragedy.length;

Random random = Random();

String getNewsStory() {
  return "${tragedy[random.nextInt(tragedyLength)]} in ${countries[random.nextInt(countriesLength)]}";
}
