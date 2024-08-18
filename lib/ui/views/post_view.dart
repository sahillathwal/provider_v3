import 'package:flutter/material.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/viewmodels/widgets/posts_model.dart';
import 'package:provider_arc/ui/views/base_widget.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return const BaseWidget<PostsModel>();
  }
}
