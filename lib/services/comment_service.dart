import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/comment.dart'; // Sesuaikan path import model kamu

class ApiComment {
  // Contoh fungsi untuk mengambil komentar berdasarkan postId
  Future<List<Comment>> fetchComments(int postId) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$postId'),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Comment.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat komentar (Status: ${response.statusCode})');
    }
  }
}