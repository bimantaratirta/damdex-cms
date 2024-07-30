import 'shared_preferences_manager.dart';

Future<Tokens> getTokens() async {
  final access = (await SharedPreferencesManager.readPref("access"));
  final refresh = (await SharedPreferencesManager.readPref("refresh"));
  final tokens = Tokens(access: access, refresh: refresh);
  return tokens;
}

class Tokens {
  Object? access;
  Object? refresh;

  Tokens({required this.access, required this.refresh});
}
