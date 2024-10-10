import 'dart:convert';
import 'package:book_wallert/ipaddress.dart';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class GetBookService {
  final String apiUrl = '${ip}/api/book/getBook';
  // http://localhost:3000/api/book/getBookWithBookId/27

  Future<BookModel> fetchBook(int bookId) async {
    final response = await http.get(Uri.parse('$apiUrl/$bookId'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      //print(data);
      // print('title ${data[0]["title"].runtimeType}');
      // print('authore ${data[0]["author"].runtimeType}');
      // print('pages ${data[0]["pages"].runtimeType}');
      // print('gener ${data[0]["genre"].runtimeType}');
      // print('isbn10 ${data[0]["ISBN10"].runtimeType}');
      // print('isbn13 ${data[0]["ISBN13"].runtimeType}');
      // print('rating ${data[0]["totalRating"].runtimeType}');
      // print('pub date ${data[0]["publishedDate"].runtimeType}');
      // print('img ${data[0]["imageUrl"].runtimeType}');
      // print('des ${data[0]["description"].runtimeType}');
      // print('res ${data[0]["resource"].runtimeType}');
      return data.map((item) => BookModel.fromJson(item)).toList()[0];
    } else {
      throw Exception('Failed to load book');
    }
  }
}
