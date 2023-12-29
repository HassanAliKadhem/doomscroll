import 'dart:math';

import 'package:flutter/material.dart';

import '../data/settings.dart';

Random random = Random();

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsText, required this.imagePath});
  final String newsText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: showImages,
              builder: (context, show, child) {
                if (show) {
                  return Image.asset(imagePath, fit: BoxFit.cover);
                } else {
                  return const FlutterLogo();
                }
              },
            ),
          ),
          ListTile(
            title: Text(newsText),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(Icons.thumb_up_rounded),
                Text(random.nextInt(1000).toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
