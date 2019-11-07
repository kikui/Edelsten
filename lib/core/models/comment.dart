import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String id;
  String title;
  String stoneId;
  String user;
  String body;
  Timestamp date;
  int like;
  int dislike;
  bool request;

  Comment(String title, String stoneId, String user, String body, Timestamp date) {
    this.title = title;
    this.id = id;
    this.stoneId = stoneId;
    this.user = user;
    this.body = body;
    this.like = 0;
    this.dislike = 0;
    this.request = false;
    this.date = date;
  }

  Comment.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot['title'];
    stoneId = snapshot['stoneId'];
    user = snapshot['user'];
    body = snapshot['body'];
    date = snapshot['date'];
    request = snapshot['request'];
    like = snapshot['like'];
    dislike = snapshot['dislike'];
  }

  @override
  String toString() {
    String result = 'id: ' + id + ' | title: ' + title + ' | stoneId: ' + stoneId + ' | user: ' + user;
    return result;
  }
}