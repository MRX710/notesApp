import 'package:flutter/material.dart';
import './post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;

  const PostList(this.listItems, {super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listItems.length,
        itemBuilder: (context, index) {
          var post = widget.listItems[index];
          return Card(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text(post.body),
                subtitle: Text(post.author),
              )),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    // style: TextStyle(fontSize: 20),
                    child: Text(
                      post.likes.toString(),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () => like(post.likePost),
                      color: post.userLiked ? Colors.green : Colors.black)
                ],
              )
            ],
          ));
        });
  }
}
