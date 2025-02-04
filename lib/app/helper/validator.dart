class Validator {
  static const String _emailRegExpString =
      r'^[a-zA-Z0-9+._%+-]{1,256}@[a-zA-Z0-9-]{0,64}(\.[a-zA-Z0-9-]{2,25})+$';
  static final _emailRegex = RegExp(_emailRegExpString, caseSensitive: false);
  static bool isValidEmail(String email) => _emailRegex.hasMatch(email);
}
