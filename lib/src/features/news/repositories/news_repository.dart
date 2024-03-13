import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

class NewsRepository {
  final FirebaseFirestore _firestore;
  NewsRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  CollectionReference get _users => _firestore.collection("Users");

  Future<Map<String, dynamic>> getNews() async {
    final response = await get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=eb00901fca0847f999c5fe9ac60f941e'),
    );
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return json;
  }
}
