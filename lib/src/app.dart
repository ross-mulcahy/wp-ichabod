import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart' as provider;

import '../wordpress_client.dart';
import 'config.dart';
import 'pages/listView.dart';
import 'view_models/app_key.dart';
import 'widgets/drawerMain.dart';

WordpressClient client = new WordpressClient(_baseUrl, http.Client());
final String _baseUrl = mainApiUrl;

class IchabodHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IchabodHomeState();
}

class IchabodHomeState extends State<IchabodHome>
    with TickerProviderStateMixin {
  var scrollCont =
      ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: provider.Provider.of<Keys>(context, listen: false).appScaffoldKey,
      drawer: DrawerMain(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: true,
      body: Stack(fit: StackFit.expand, children: [
        Container(
          child: FutureBuilder<List<Post>>(
            future: client.listPosts(page: 1, perPage: 10),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? ListViewPosts(posts: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ]),
    );
  }
}
