import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/image_model.dart';

class ImageDetailScreen extends StatelessWidget {
  final ImageModel image;

  ImageDetailScreen({required this.image});

  Future<Database> initializeDB() async {
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

  Future<void> addToFavorites(ImageModel image) async {
    final Database db = await initializeDB();
    await db.insert('favorites', {
      'id': image.id,
      'url': image.url,
      'category': image.category,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.network(image.url),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () async {
                await addToFavorites(image);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added to favorites'),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
