import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/image_model.dart';
import 'image_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Database database;
  List<ImageModel> favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    database = await _initializeDB();
    final List<Map<String, dynamic>> maps = await database.query('favorites');

    setState(() {
      favorites = List.generate(maps.length, (i) {
        return ImageModel(
          id: maps[i]['id'],
          url: maps[i]['url'],
          category: maps[i]['category'],
        );
      });
    });
  }

  Future<Database> _initializeDB() async {
    String path = join(await getDatabasesPath(), 'favorites.db');
    return openDatabase(
      path,
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE favorites(id TEXT PRIMARY KEY, url TEXT, category TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> _removeFromFavorites(String id) async {
    await database.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Images')),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final image = favorites[index];
          return ListTile(
            leading: Image.network(image.url),
            title: Text(image.category),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await _removeFromFavorites(image.id);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Removed from favorites'),
                ));
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailScreen(image: image),
                ),
              );
            },
          );
        },
      ),
    );
  }
}