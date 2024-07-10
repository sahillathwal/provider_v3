import 'package:flutter/material.dart';
import 'package:provider_arc/core/models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  const PostListItem({super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0),
                  color: Color.fromARGB(80, 0, 0, 0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.title,
              style:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
            ),
            Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis)
          ],
        ),
      ),
    );
  }
}
