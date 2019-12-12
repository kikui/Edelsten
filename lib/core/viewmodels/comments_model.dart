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
  StreamSubscription<List<Comment>> streamSubscriptionComments;

  void getComments(String uuidStone) {
    streamSubscriptionComments =
        _commentRepo.getComments(uuidStone).listen((List<Comment> listStream) {
      setState(ViewState.Busy);
      listComment = listStream;
      setState(ViewState.Idle);
    });
  }

  // method create comment
  void createComment(String stoneId, String title, String body) {
    setState(ViewState.Busy);
    Comment comment = new Comment(title, stoneId, _auth.user.pseudo, body);
    _commentRepo.addComment(comment);
  }

  // method updateLikeAndDislike
  // statut == 'like' or 'dislike'
  void updateLikeAndDislike(Comment comment, String statut) {
    Comment commentResult = checkaddedAndUpdate(statut, comment);
    _commentRepo.updateComment(commentResult);
  }

  Comment checkaddedAndUpdate(String statut, Comment comment) {
    List<dynamic> listPrimary = List();
    List<dynamic> listSecondary = List();
    var checkAdd = true;
    if (statut == 'like') {
      listPrimary = comment.like;
      listSecondary = comment.dislike;
    } else {
      listPrimary = comment.dislike;
      listSecondary = comment.like;
    }
    for (var i = 0; i < listPrimary.length; i++) {
      if (listPrimary[i] == _auth.user.pseudo) {
        listPrimary.remove(listPrimary[i]);
        checkAdd = false;
      }
    }
    for (var i = 0; i < listSecondary.length; i++) {
      if (listSecondary[i] == _auth.user.pseudo) {
        listSecondary.remove(listSecondary[i]);
      }
    }
    if (checkAdd == true) {
      listPrimary.add(_auth.user.pseudo);
    }
    if (statut == 'like') {
      comment.like = listPrimary;
      comment.dislike = listSecondary;
    } else {
      comment.dislike = listPrimary;
      comment.like = listSecondary;
    }
    return comment;
  }
}
