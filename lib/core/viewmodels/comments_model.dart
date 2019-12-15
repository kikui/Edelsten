import 'dart:async';

import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/repositories/comment_repository.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';
import 'package:edelsten/core/models/numLikeDislike';

class CommentModel extends BaseModel {
  CommentRepository _commentRepo = locator<CommentRepository>();
  AuthenticationService _auth = locator<AuthenticationService>();
  List<Comment> listComment;
  StreamSubscription<List<Comment>> streamSubscriptionComments;

  Map<String, Map<LikeDislikeStatut, bool>> _stateMyLikeDislikeComment =
      new Map();
  Map<String, Map<LikeDislikeStatut, bool>> get stateMyLikeDislikeComment =>
      _stateMyLikeDislikeComment;

  void setStateMyLikeDislikeComment() {
    _stateMyLikeDislikeComment.clear();
    listComment
        .forEach((e) => {_stateMyLikeDislikeComment[e.id] = isMyLikeDislikeComment(e)});
    notifyListeners();
  }

  Map<LikeDislikeStatut, bool> isMyLikeDislikeComment(Comment comment) {
    Map<LikeDislikeStatut, bool> result = new Map();
    var checkLikeTrue = false;
    var checkDislikeTrue = false;
    for (var item in comment.like) {
      if (item == _auth.user.pseudo) {
        checkLikeTrue = true;
        result[LikeDislikeStatut.Like] = true;
      }
    }
    for (var item in comment.dislike) {
      if (item == _auth.user.pseudo) {
        checkDislikeTrue = true;
        result[LikeDislikeStatut.Dislike] = true;
      }
    }
    if(checkLikeTrue == false) {
      result[LikeDislikeStatut.Like] = false;
    }
    if(checkDislikeTrue == false) {
      result[LikeDislikeStatut.Dislike] = false;
    }
    return result;
  }

  void getComments(String uuidStone) {
    setState(ViewState.Busy);
    streamSubscriptionComments =
        _commentRepo.getComments(uuidStone).listen((List<Comment> listStream) {
      listComment = listStream;
      if(_auth.user != null) {
        setStateMyLikeDislikeComment();
      }
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
  void updateLikeAndDislike(Comment comment, LikeDislikeStatut statut) {
    Comment commentResult = checkaddedAndUpdate(statut, comment);
    _commentRepo.updateComment(commentResult);
  }

  Comment checkaddedAndUpdate(LikeDislikeStatut statut, Comment comment) {
    List<dynamic> listPrimary = List();
    List<dynamic> listSecondary = List();
    var checkAdd = true;
    if (statut == LikeDislikeStatut.Like) {
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
    if (statut == LikeDislikeStatut.Like) {
      comment.like = listPrimary;
      comment.dislike = listSecondary;
      // if (checkAdd == true) {
      //   _stateMyLikeDislikeComment[comment.id][LikeDislikeStatut.Like] = true;
      // } else {
      //   _stateMyLikeDislikeComment[comment.id][LikeDislikeStatut.Like] = false;
      // }
    } else {
      comment.dislike = listPrimary;
      comment.like = listSecondary;
      // if (checkAdd == true) {
      //   _stateMyLikeDislikeComment[comment.id][LikeDislikeStatut.Dislike] =
      //       true;
      // } else {
      //   _stateMyLikeDislikeComment[comment.id][LikeDislikeStatut.Dislike] =
      //       false;
      // }
    }
    //notifyListeners();
    return comment;
  }
}
