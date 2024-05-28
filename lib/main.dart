import 'package:flutter/material.dart';
import 'package:library_manager/screens/AboutScreen.dart';
import 'package:library_manager/screens/books_screen.dart';
import 'package:library_manager/screens/members_screen.dart';

void main() {
  runApp(LibraryManagerApp());
}

class LibraryManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Map<String, String>> books = [
    {
      'title': "WHAT DOSN'T KILL YOU",
      'author': 'TISSA MILLER',
      'image': 'assets/book1.jpg',
    },
    {
      'title': 'I WANTED YOU TO KNOW',
      'author': 'LAURA PEARSON',
      'image': 'assets/book2.jpg',
    },
  ];

  final List<Map<String, String>> members = [
    {'name': 'Member 1'},
    {'name': 'Member 2'},
  ];

  List<Map<String, String>> get _filteredBooks {
    if (_searchQuery.isEmpty) return books;
    return books
        .where((book) => book['title']!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  List<Map<String, String>> get _filteredMembers {
    if (_searchQuery.isEmpty) return members;
    return members
        .where((member) => member['name']!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Manager'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/library.jpeg'),
              SizedBox(height: 20),
              Text(
                'Bienvenue à la Bibliothèque publique!',
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Rechercher...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Livres',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: _filteredBooks
                    .map((book) => ListTile(
                  title: Text(book['title']!),
                  subtitle: Text(book['author']!),
                ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Adhérents',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: _filteredMembers
                    .map((member) => ListTile(
                  title: Text(member['name']!),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'HAIDARI Raghia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Bibliothèque publique',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Livres'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => BooksScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Adhérents'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MembersScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AboutScreen()));
            },
          ),
        ],
      ),
    );
  }
}
