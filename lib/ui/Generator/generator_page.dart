

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:namer_app/ui/HistoryList/history_list.dart';
import 'package:namer_app/ui/BigCard/big_card.dart';
import 'package:namer_app/main.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    icon = Icons.favorite_border;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(appState.history.isNotEmpty)
            Expanded(
              flex: 3,
              child: HistoryListView()
            ),
          if(appState.history.isEmpty)
            Spacer(flex: 3),
          SizedBox(height: 10),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite(pair);
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  appState.clearHistory();
                },
                icon: Icon(Icons.clear_all),
                label: Text('Clear'),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  appState.getNext();
                },
                icon: Icon(Icons.navigate_next),
                label: Text('Next'),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
