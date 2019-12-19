import 'dart:async';

import 'package:edelsten/core/helper/commentHelper.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/repositories/comment_repository.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';
import 'package:edelsten/core/models/numLikeDislike.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentModel extends BaseModel {
  CommentRepository _commentRepo = locator<CommentRepository>();
  AuthenticationService _auth = locator<AuthenticationService>();
  CommentHelper _commentHelper = CommentHelper();
  StreamSubscription<List<Comment>> streamSubscriptionComments;

  TextEditingController messageBarController = TextEditingController();
  List<Comment> listComment;

  Map<String, Map<LikeDislikeStatut, bool>> _stateMyLikeDislikeComment =
      new Map();
  Map<String, Map<LikeDislikeStatut, bool>> get stateMyLikeDislikeComment =>
      _stateMyLikeDislikeComment;

  void setStateMyLikeDislikeComment() {
    _stateMyLikeDislikeComment.clear();
    listComment.forEach((e) => {
          _stateMyLikeDislikeComment[e.id] =
              _commentHelper.isMyLikeDislikeComment(e)
        });
    notifyListeners();
  }

  void getComments(String uuidStone) {
    setState(ViewState.Busy);
    streamSubscriptionComments =
        _commentRepo.getComments(uuidStone).listen((List<Comment> listStream) {
      listComment = listStream;
      if (_auth.user != null) {
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
    messageBarController.clear();
  }

  // method updateLikeAndDislike
  void updateLikeAndDislike(Comment comment, LikeDislikeStatut statut) {
    Comment commentResult = _commentHelper.checkaddedAndUpdate(statut, comment);
    _commentRepo.updateComment(commentResult);
  }

  @override
  void dispose() {
    messageBarController.dispose();
    streamSubscriptionComments.cancel();
    super.dispose();
  }
}
