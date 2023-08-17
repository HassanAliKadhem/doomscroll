import 'dart:math';

import 'package:flutter/material.dart';

import '../data/settings.dart';

Random random = Random();

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsItem, required this.imagePath});
  final String newsItem;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: showImages,
              builder: (context, show, child) {
                if (show) {
                  return Image.asset(imagePath);
                } else {
                  return const FlutterLogo();
                }
              },
            ),
          ),
          ListTile(
            title: Text(newsItem),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(Icons.thumb_up),
                Text(random.nextInt(1000).toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
