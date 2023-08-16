import 'dart:math';

import 'package:flutter/material.dart';

Random random = Random();

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsItem});
  final String newsItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 300,
            child: FlutterLogo(
              size: 300,
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
                Text((random.nextInt(100) * (random.nextInt(11) + 5))
                    .toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
