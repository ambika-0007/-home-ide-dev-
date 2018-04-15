import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/data.dart';
import 'model/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Container> _buildGridCards() {
    List<Product> products = getAllProducts();

    if (products == null || products.isEmpty) {
      return const <Container>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = new NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return new Container(
        width: 160.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new AspectRatio(
              aspectRatio: 18 / 11,
              child: new Image.asset(
                'assets/${product.id}-1.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // TODO(larche): Make headline6 when available
                    new Text(
                      product.name,
                      style: theme.textTheme.title,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    // TODO(larche): Make subtitle2 when available
                    new Text(
                      formatter.format(product.price),
                      style: theme.textTheme.body2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  void _buttonPress() {
    print('Button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        leading: new IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _buttonPress,
        ),
        title: const Text('SHRINE'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.search),
            onPressed: _buttonPress,
          ),
          new IconButton(
            icon: const Icon(Icons.tune),
            onPressed: _buttonPress,
          ),
        ],
      ),
      body: new Center(
          child: new ListView(
        scrollDirection: Axis.horizontal,
        children: _buildGridCards(),
      )),
    );
  }
}
