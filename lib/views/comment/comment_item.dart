import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          children: [
            Flexible(
              child: Wrap(
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
            GestureDetector(
              // onTap: model.updateLike(model.listComment[index]),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                      '+' + model.listComment[index].like.length.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {},
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                      '-' + model.listComment[index].dislike.length.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          child: Text(model.listComment[index].body,
              style: TextStyle(color: Colors.white, fontSize: 15)),
        ),
      ]),
    );
  }
}
