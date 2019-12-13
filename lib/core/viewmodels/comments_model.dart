import 'dart:async';

import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/repositories/comment_repository.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';

// this code part is in progress in another branch
class CommentModel extends BaseModel {
  CommentRepository _commentRepo = locator<CommentRepository>();
  AuthenticationService _auth = locator<AuthenticationService>();
  List<Comment> listComment;
  User user;
  StreamSubscription<List<Comment>> streamSubscriptionComments;
  StreamSubscription<User> streamSubscriptionUser;

  void getComments(String uuidStone) {
    streamSubscriptionComments = _commentRepo.getComments(uuidStone).listen((List<Comment> listStream) {
      setState(ViewState.Busy);
      listComment = listStream;
      setState(ViewState.Idle);
    });
    // streamSubscriptionUser = _auth.userController.stream.listen((User userFromStream) {
    //     user = userFromStream;
    //   });
  }

  // method create comment
  void createComment(String stoneId, String title, String body) {
    setState(ViewState.Busy);
    Comment comment = new Comment(title, stoneId, user.pseudo, body);
    _commentRepo.addComment(comment);
  }

  // method updateLike
  void updateLike(Comment comment) {
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
    _commentRepo.updateComment(comment);
  }

  // method updateDislike
    void updateDislike(Comment comment) {
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
    _commentRepo.updateComment(comment);
  }
}