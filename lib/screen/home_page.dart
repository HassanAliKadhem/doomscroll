import 'package:flutter/cupertino.dart';
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
  List<String> images = <String>[];

  void loadMoreNews() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          for (var i = 0; i < 20; i++) {
            var (newsText, newsImagePath) = getNewsStory();
            news.add(newsText);
            images.add(newsImagePath);
          }
        });
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadMoreNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == news.length - 1) {
                    loadMoreNews();
                  }
                  return NewsCard(
                      newsText: news[index], imagePath: images[index]);
                },
                childCount: news.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
