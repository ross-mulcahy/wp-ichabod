

import 'package:flutter/material.dart';
import 'package:ichabod/src/models/post.dart';

import 'package:ichabod/src/widgets/catWidgets.dart';
import 'eachPost.dart';

class PostsCard extends StatefulWidget {
  PostsCard({Key? key, this.post}) : super(key: key);
  final Post? post ; 

  _PostsCardState createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(tag: 'hero${widget.post!.id}', child: hawalImage(widget.post!)),
            ],
          ),
          new Padding(
            padding: EdgeInsets.all(5.0),
            child: new ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IchabodPost(post: widget.post),
                  ),
                );
              },
              title: hawalTitle(widget.post!),
              subtitle: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  hawalAuthor(widget.post!),
                  hawalDate(widget.post!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}