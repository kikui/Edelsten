import 'dart:async';

import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/repositories/comment_repository.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';

class CommentModel extends BaseModel {
  CommentRepository _commentRepo = locator<CommentRepository>();
  AuthenticationService _auth = locator<AuthenticationService>();
  List<Comment> listComment;
  User user;
  StreamSubscription<List<Comment>> streamSubscriptionComments;
  StreamSubscription<User> streamSubscriptionUser;

  void initCommentModel(String uuidStone) {
    setState(ViewState.Busy);
    streamSubscriptionComments = _commentRepo.getComments(uuidStone).listen((List<Comment> listStream) {
      listComment = listStream;
    });
    streamSubscriptionUser = _auth.userController.stream.listen((User userFromStream) {
        user = userFromStream;
      });
    setState(ViewState.Idle);
  }

  // method create comment
  void createComment(String stoneId, String title, String body) async {
    setState(ViewState.Busy);
    Comment comment = new Comment(title, stoneId, user.pseudo, body);
    await _commentRepo.addComment(comment);
  }

  // method updateLike
  void updateLike(Comment comment) async {
    var checkAddLike = true;
    listComment.forEach((e) => {
      e.like.forEach((f) => {
        if(f == user.pseudo){
          comment.like.remove(f),
          checkAddLike = false,
        }
      })
    });
    if(checkAddLike == true) {
      comment.like.add(user.pseudo);
    }
    await _commentRepo.updateComment(comment);
  }

  // method updateDislike
    void updateDislike(Comment comment) async {
    var checkAddDislike = true;
    listComment.forEach((e) => {
      e.dislike.forEach((f) => {
        if(f == user.pseudo){
          comment.dislike.remove(f),
          checkAddDislike = false,
        }
      })
    });
    if(checkAddDislike == true) {
      comment.dislike.add(user.pseudo);
    }
    await _commentRepo.updateComment(comment);
  }
}