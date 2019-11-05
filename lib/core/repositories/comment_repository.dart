import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:firestore_helpers/firestore_helpers.dart';

class CommentRepository {
  final Firestore dataBase = Firestore.instance; 

  // method getComments(String stoneId) => trié par like && date décroissante 
  Future<List<Comment>> getComments(String stoneId) async {
    List<Comment> listComment = new List<Comment>();
    Comment comment;
    Query collection = dataBase.collection('comments');
    QueryConstraint queryConstraint = new QueryConstraint(field: 'stoneId', isEqualTo: stoneId);
    OrderConstraint orderConstraintLike = new OrderConstraint('like', false);
    OrderConstraint orderConstraintDate = new OrderConstraint('date', true);
    Query query = buildQuery(collection: collection, constraints: [queryConstraint], orderBy: [orderConstraintLike, orderConstraintDate]);
    // Query commentQueryWhere = dataBase.collection('comments').where('stoneId', isEqualTo: stoneId);
    // Query commentQueryOrderby = commentQueryWhere.orderBy('like').orderBy('date', descending: true);
    QuerySnapshot commentQuerySnapshot = await query.getDocuments();
    List<DocumentSnapshot> commentListDocumentSnapshot = commentQuerySnapshot.documents;
    commentListDocumentSnapshot.forEach((e) => {
      comment = Comment.fromSnapshot(e),
      listComment.add(comment)
    });
    return listComment;
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
  // updateDislike(Comment comment, int value)

  Map<String, dynamic> transformCommentToMap(Comment comment) {
    Map<String, dynamic> commentMap = new Map<String, dynamic>();
    commentMap['title'] = comment.title;
    commentMap['stoneId'] = comment.stoneId;
    commentMap['user'] = comment.user;
    commentMap['body'] = comment.body;
    commentMap['data'] = comment.date;
    commentMap['request'] = comment.request;
    commentMap['like'] = comment.like;
    commentMap['dislike'] = comment.dislike;
    return commentMap;
  }
}