import 'dart:convert';
import 'package:http/http.dart' as http;

class Quotes {
  Future<String> getQuote() async {
    try {
      final res = await http.get(
        Uri.parse('https://api.quotable.io/random'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['content'];
        content = content.trim();
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }


}