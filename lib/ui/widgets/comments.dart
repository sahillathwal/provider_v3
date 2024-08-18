import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/models/comment.dart';
import 'package:provider_arc/core/viewmodels/widgets/comments_model.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';
import 'package:provider_arc/ui/shared/ui_helpers.dart';
import 'package:provider_arc/ui/views/base_widget.dart';

class Comments extends StatelessWidget {
  final int postId;
  const Comments(this.postId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommentsModel>(
        onModelReady: (model) => model.fetchComments(postId),
        model: CommentsModel(api: Provider.of(context)),
        builder: (context, model, child) => model.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: model.comments!.length,
                  itemBuilder: (context, index) =>
                      CommentItem(model.comments![index]),
                ),
              ));
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }
}
