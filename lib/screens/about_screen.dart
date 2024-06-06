import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: Text('Данное приложение разработано на flutter. В дальнейшем в приложение будут добавлаены новые функции!'),
      ),
    );
  }
}