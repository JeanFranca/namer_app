

import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    
    if(appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }
    
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${appState.favorites.length} favorites: '),
        ),
        for(var word in appState.favorites)
          ListTile(
            leading: Icon(Icons.delete),
            title: Text(word.asLowerCase),
            onTap: () {
              appState.toggleFavorite(word);
            },
          )
      ]
    );
  }
}
