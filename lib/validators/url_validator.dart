import 'package:passwd/models/validator.dart';

class URLValidator implements Validator {
  String input;

  URLValidator({this.input}) : assert(input != null);

  @override
  bool validate(String input) {
    try {
      Uri.parse(input);

      return true;
    } catch (e) {
      // It throws a [FormatException] when the URL is not valid
      return false;
    }
  }
}
