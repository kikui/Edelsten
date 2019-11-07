import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:firestore_helpers/firestore_helpers.dart';

class CommentRepository {
  final Firestore dataBase = Firestore.instance; 

  // method getComments(String stoneId) => trié par like && date décroissante 
  Stream<List<Comment>> getComments(String stoneId) {
    try {
      Query collection = dataBase.collection('comments');
      QueryConstraint queryConstraint = new QueryConstraint(field: 'stoneId', isEqualTo: stoneId);
      OrderConstraint orderConstraintLike = new OrderConstraint('like', false);
      OrderConstraint orderConstraintDate = new OrderConstraint('date', true);
      Query query = buildQuery(collection: collection, constraints: [queryConstraint], orderBy: [orderConstraintLike, orderConstraintDate]);
      return getDataFromQuery(
        query: query, 
        mapper: (commentDocumentSnapshot) {
          Comment comment = Comment.fromSnapshot(commentDocumentSnapshot);
          return comment;
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

  // method addComment(Comment comment)
  void addComment(Comment comment) async {
    await dataBase.collection('comments').add(transformCommentToMap(comment));
  }

  // enableRequest(Comment comment)
  void enableRequest(Comment comment) async {
    comment.request = true;
    await dataBase.collection('comments').document(comment.id).setData(transformCommentToMap(comment));
  }

  // disableRequest(Comment comment)
  void disableRequest(Comment comment) async {
    comment.request = false;
    await dataBase.collection('comments').document(comment.id).setData(transformCommentToMap(comment));
  }

  // updateLike(Comment comment, intvalue) // value = 0 || 1 => 1 add like / 0 remove like
  void updateLike(Comment comment, int value) async {
    if(value >= -1 && value <= 1){
      comment.like += value;
      await dataBase.collection('comments').document(comment.id).setData(transformCommentToMap(comment));
    }
  }

  // updateDislike(Comment comment, int value)
  void updateDislike(Comment comment, int value) async {
    if(value >= -1 && value <= 1){
      comment.dislike += value;
      await dataBase.collection('comments').document(comment.id).setData(transformCommentToMap(comment));
    }
  }

  Map<String, dynamic> transformCommentToMap(Comment comment) {
    Map<String, dynamic> commentMap = new Map<String, dynamic>();
    commentMap['title'] = comment.title;
    commentMap['stoneId'] = comment.stoneId;
    commentMap['user'] = comment.user;
    commentMap['body'] = comment.body;
    commentMap['date'] = comment.date;
    commentMap['request'] = comment.request;
    commentMap['like'] = comment.like;
    commentMap['dislike'] = comment.dislike;
    return commentMap;
  }
}