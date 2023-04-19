import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // pub to load html tags from json api
import 'package:flutter_html/style.dart';
import 'package:ichabod/wordpress_client.dart';
import 'package:html/parser.dart' as html_parser;
import 'dart:convert';
import 'dart:developer';

import 'catWidgets.dart';
import 'hawalnir-date-convertor.dart';

class IchabodPost extends StatelessWidget {
  IchabodPost({Key? key, required var this.post}) : super(key: key);
  final Post? post;

  @override
  Widget build(BuildContext context) {
    debugPrint("ID" + post!.id.toString());

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: FittedBox(child: hawalTitle(post!)),
        backgroundColor: Colors.transparent,
      ),
      body: new Padding(
          padding: EdgeInsets.all(16.0),
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Hero(tag: 'hero${post!.id}', child: hawalImage(post!)),
                    ],
                  ),
                  hawalTitle(post!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      hawalAuthor(post!),
                      hawalDate(post!),
                    ]
                  ),
                  Divider(),
                  contentRendered(post!),
                ],
              ),
            ],
          )),
    );
  }

  Widget mainImage(Post post) {
    return FadeInImage.assetNetwork(
      placeholder: 'https://via.placeholder.com/300.png/09f/fff',
      image: post.featuredMediaUrl == 0
          ? 'src/images/placeholder.png'
          : post.featuredMediaUrl,
    );
  }

  Widget titleRendered(Post post) {
    return Html(
      data: post.title,
      style: {
        "div": Style(fontSize: FontSize(20)),
      },
      shrinkWrap: true,
    );
  }

  Widget contentRendered(Post post) {
    final document = html_parser.parse(post.content);
  
    // Find all the p tags in the document
    final pTags = document.querySelectorAll('p');
    
    // Create an empty string to store the combined p tags
    String combinedPTags = '';
    
    // Loop through the p tags
    for (final pTag in pTags) {
      // Add the p tag to the combined p tags string
      combinedPTags += pTag.text + "<br />";
    }

    
    return Html(
      data: (combinedPTags).toString(),
      style: {
        "div": Style(
          fontSize: FontSize(20),
          margin: const EdgeInsets.only(bottom: 10) 
        ),
        "p": Style(
          fontSize: FontSize(20), 
          margin: const EdgeInsets.only(bottom: 10)  
        ),
      },
      shrinkWrap: true,
    );
  }

  Widget dateMain(Post post) {
    return Text(
      dateConvertor(post.date.toString()),
      textAlign: TextAlign.left,
    );
  }
}
