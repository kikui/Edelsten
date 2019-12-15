import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:edelsten/core/models/user.dart';
import 'package:edelsten/core/models/numLikeDislike';

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({@required this.model, @required this.index});
  final dynamic model;
  final int index;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color(0xFF10213B),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                      model.listComment[index].user +
                          ' - ' +
                          model.listComment[index].title,
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 18)),
                  Text(model.listComment[index].date.toDate().toString(),
                      style: TextStyle(
                          color: const Color(0xFF707070),
                          fontStyle: FontStyle.italic,
                          fontSize: 11)),
                ],
              ),
            ),
            Flexible(
              child: Wrap(
                children: <Widget>[
                  GestureDetector(
                    onTap: Provider.of<User>(context) == null
                        ? null
                        : () {
                            model.updateLikeAndDislike(model.listComment[index],
                                LikeDislikeStatut.Like);
                          },
                    child: Container(
                      width: 50,
                      child: Center(
                          child: Row(
                        children: <Widget>[
                          Icon(Icons.thumb_up, color: Provider.of<User>(context) == null
                              ? Colors.grey
                              : model.stateMyLikeDislikeComment[model.listComment[index].id][LikeDislikeStatut.Like] == false ? Colors.grey : Colors.redAccent),
                          Text(
                              ' ' +
                                  model.listComment[index].like.length
                                      .toString(),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                        ],
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: Provider.of<User>(context) == null
                        ? null
                        : () {
                            model.updateLikeAndDislike(model.listComment[index],
                                LikeDislikeStatut.Dislike);
                          },
                    child: Container(
                      width: 50,
                      child: Center(
                          child: Row(
                        children: <Widget>[
                          Icon(Icons.thumb_down, color: Provider.of<User>(context) == null
                              ? Colors.grey
                              : model.stateMyLikeDislikeComment[model.listComment[index].id][LikeDislikeStatut.Dislike] == false ? Colors.grey : Colors.redAccent),
                          Text(
                              ' ' +
                                  model.listComment[index].dislike.length
                                      .toString(),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          child: Text(model.listComment[index].body,
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.left),
        ),
      ]),
    );
  }
}
