import 'dart:convert';
import 'dart:developer';

import 'package:clean_arch_practice1/core/errors/exception.dart';
import 'package:clean_arch_practice1/features/feature1/data/models/post_model.dart';
import 'package:http/http.dart' as http;

const String url = "https://jsonplaceholder.typicode.com/posts";

abstract class PostRemoteData {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataImpl implements PostRemoteData {
  final http.Client client;

  PostRemoteDataImpl({required this.client});
  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final jsonResponse = jsonDecode(response.body) as List;
      return jsonResponse
          .map((post) => PostModel.fromJson(post as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
