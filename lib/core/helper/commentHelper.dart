import 'package:edelsten/core/models/comment.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/locator.dart';

class CommentHelper {
  AuthenticationService _auth = locator<AuthenticationService>();

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
    if (checkLikeTrue == false) {
      result[LikeDislikeStatut.Like] = false;
    }
    if (checkDislikeTrue == false) {
      result[LikeDislikeStatut.Dislike] = false;
    }
    return result;
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
    } else {
      comment.dislike = listPrimary;
      comment.like = listSecondary;
    }
    return comment;
  }
}
