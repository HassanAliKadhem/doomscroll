import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widget/about_dialog.dart';
import '../widget/news_card.dart';
import '../widget/settings_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> news = <String>[];

  void loadMoreNews() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          for (var i = 0; i < 20; i++) {
            news.add(getNewsStory());
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        scrolledUnderElevation: 2,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const SettingsDialog(),
              );
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const DoomAboutDialog(),
              );
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: news.length + 1,
        itemBuilder: (context, index) {
          if (index == news.length) {
            loadMoreNews();
            return const LinearProgressIndicator();
          } else {
            return NewsCard(newsItem: news[index]);
          }
        },
      ),
    );
  }
}
