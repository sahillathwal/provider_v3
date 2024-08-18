import 'package:provider_arc/core/models/comment.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/viewmodels/views/base_model.dart';

class CommentsModel extends BaseModel {
  final Api _api;

  CommentsModel({required Api api}) : _api = api;

  List<Comment>? comments;

  Future fetchComments(int postId) async {
    setBusy(true);
    comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }
}
