class Comment{
  final String title;
  final String articleId;
  final String userId;
  final String body;
  final DateTime date;
  int like;
  int dislike;
  bool request;

  Comment(this.title, this.articleId, this.userId, this.body, this.date, this.like, this.dislike, this.request);

  //+1 ajout d'un like
  //-1 lorsque l'on enlève son like
  void likeIncrease(int value){
    this.like += value;
  }

  void dislikeIncrease(int value){
    this.dislike += value;
  }

}