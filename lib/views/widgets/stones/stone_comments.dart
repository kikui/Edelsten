import 'package:edelsten/core/viewmodels/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:edelsten/core/view_state.dart';

// List comments = [
//   {},
//   {},
//   {},
//   {},
// ];

class CommentsStoneWidget extends StatelessWidget {
  const CommentsStoneWidget({@required this.stoneId});

  final String stoneId;

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentModel>(
      onModelReady: (model) {
        model.getComments(stoneId);
      },
      builder: (context, model, child) => model.state == ViewState.Busy ||
              model.listComment == null
          ? Center(
                child: CircularProgressIndicator(),
              )
          : Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: model.listComment.length,
                itemBuilder: (BuildContext context, int index) {
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
                                Text(model.listComment[index].user + '-' + model.listComment[index].title, style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18)),                        
                                Text(model.listComment[index].date.toDate().toString(), style: TextStyle(color: const Color(0xFF707070), fontStyle: FontStyle.italic, fontSize: 11)),
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
                                child: Text('+' + model.listComment[index].like.length.toString(), style: TextStyle(color: Colors.white)),
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
                                child: Text('-'+model.listComment[index].dislike.length.toString(), style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Text(model.listComment[index].body, style: TextStyle(color: Colors.white)),
                      ),
                      
                    ]),
                  );
                },
              ),
            ),
    );
  }
}
