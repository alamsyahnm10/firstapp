import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: HomePageWidget()));
}

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key = const Key("any_key")}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue ,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100,
              height: 100,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: 100,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Image.network(
                'https://picsum.photos/seed/62/600',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Text(
                      'Hello World'
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Text(
                      'fsgfgfdhgfhgfhjghjgjgjjkhjkbjkbjvhvgcghcghghchgvhjvhjvhjvhjvjhvjvjhv',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CobaApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coba",
      home: Scaffold(
        appBar: AppBar(title: Text("Coba")),
        body: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.yellow,
                child: Text("Ini nanti diisi gambar"),
              ),
            ),
            Expanded(
              flex: 6, 
              child: Column(
                children: [
                  Expanded(child: 
                    Row(children: [
                    Expanded(flex: 5, child: Container(color: Colors.green)),
                    Expanded(flex: 5, child: Container(color: Colors.red))
                  ])),
                  Expanded(child: Container(color: Colors.blue,)),
              ],)
            )
          ],
          )
      )
    );
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: _buildSuggestions(),
      );
    }

    Widget _buildSuggestions() {
      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
    }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}