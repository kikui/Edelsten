import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String id;
  String title;
  String stoneId;
  String user;
  String body;
  Timestamp date;
  List<dynamic> like;
  List<dynamic> dislike;
  bool request;

  Comment(String title, String stoneId, String user, String body) {
    this.title = title;
    this.id = id;
    this.stoneId = stoneId;
    this.user = user;
    this.body = body;
    this.like = new List();
    this.dislike = new List();
    this.request = false;
    this.date = Timestamp.now();
  }

  Comment.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot['title'];
    stoneId = snapshot['stoneId'];
    user = snapshot['user'];
    body = snapshot['body'];
    date = snapshot['date'];
    request = snapshot['request'];
    like = new List<dynamic>.from(snapshot['like']);
    dislike = new List<dynamic>.from(snapshot['dislike']);
  }

  @override
  String toString() {
    String result = 'id: ' + id + ' | title: ' + title + ' | stoneId: ' + stoneId + ' | user: ' + user;
    return result;
  }
}