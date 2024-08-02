import "shared_preferences_manager.dart";

Future<String> getSessionId() async {
  final Object? data = await SharedPreferencesManager.readPref('sessionId');
  final String sessionId = data.toString();
  return sessionId;
}
