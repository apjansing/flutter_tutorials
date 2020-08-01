import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme_data = ThemeData(
        primaryColor: Colors.indigo, accentColor: Colors.indigoAccent);
    return MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords(),
        theme: theme_data);
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>(); // NEW
  final _smilies = Map<WordPair, int>();

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        final tiles = _saved.map(
          (WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Saved Suggestions'),
          ),
          body: ListView(children: divided),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd)
            return Divider(
              thickness: 4,
            ); // 1 pixel high divider, 4 thiccness

          final index = i ~/ 2; // integer division
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs()
                .take(10)); // if you've reached the end, generate more!
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair); // NEW
    final smileValue = _smilies.containsKey(pair) ? _smilies[pair] : 0;

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      leading: Icon([
        Icons.sentiment_neutral,
        Icons.sentiment_satisfied,
        Icons.sentiment_dissatisfied
      ][smileValue]),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.blue,
      ),
      onLongPress: () {
        setState(() {
          _smilies.update(pair, (v) => (v + 1) % 3, ifAbsent: () => 1);
        });
      },
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
