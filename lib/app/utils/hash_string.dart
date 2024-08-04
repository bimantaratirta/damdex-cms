import 'dart:convert';

import 'package:crypto/crypto.dart';

String hashString(String string) {
  String hashedString = "";
  List<int> bytes = utf8.encode(string);
  Digest hash = sha256.convert(bytes);
  hashedString = hash.toString();
  return hashedString;
}
