import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/news_repository.dart';

final newsControllerProvider =
    StateNotifierProvider<NewsController, bool>((ref) {
  final newsRepository = NewsRepository(firestore: FirebaseFirestore.instance);
  return NewsController(
    newsRepository: newsRepository,
    ref: ref,
  );
});

class NewsController extends StateNotifier<bool> {
  final NewsRepository _newsRepository;
  final Ref _ref;
  NewsController({required NewsRepository newsRepository, required Ref ref})
      : _newsRepository = newsRepository,
        _ref = ref,
        super(false);
  Future<Map<String, dynamic>?> getNews() async {
    try {
      Map<String, dynamic> newsJson = await _newsRepository.getNews();
      return newsJson;
    } catch (e) {
      return null;
    }
  }
}
