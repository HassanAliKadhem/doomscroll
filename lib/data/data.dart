import 'dart:math';

import 'countries.dart';
import 'tragedies.dart';

Random random = Random();
String lastTragedy = "";
String lastCountry = "";

(String, String) getNewsStory() {
  var (tragedyText, tragedyImagePath) = tragedy[random.nextInt(tragedyLength)];
  while (tragedyText == lastTragedy) {
    (tragedyText, tragedyImagePath) = tragedy[random.nextInt(tragedyLength)];
  }
  lastTragedy = tragedyText;

  var country = countries[random.nextInt(countriesLength)];
  while (country == lastCountry) {
    country = countries[random.nextInt(countriesLength)];
  }
  lastCountry = country;

  return ("$tragedyText in $country", tragedyImagePath);
}
