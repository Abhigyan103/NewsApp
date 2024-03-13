import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/common_widgets/my_app_bar.dart';
import 'package:news_app/src/features/news/controllers/news_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});
  static List<Color> listColors = [
    Color.fromARGB(121, 0, 0, 0),
    const Color.fromARGB(255, 23, 23, 23)
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(newsControllerProvider.notifier).getNews();
    return Scaffold(
      appBar: MyAppBar(context, title: 'Cureent News'),
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> news = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse(news['articles'][index]['url']),
                        mode: LaunchMode.externalApplication);
                  },
                  leading: Image.network(
                    news['articles'][index]['urlToImage'] ??
                        'https://img.freepik.com/free-photo/textured-background-white-tone_53876-128610.jpg',
                    width: 100,
                  ),
                  tileColor: listColors[index % 2],
                  title: Text(news['articles'][index]['title']),
                );
              },
              itemCount: (news['articles'] as List).length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
