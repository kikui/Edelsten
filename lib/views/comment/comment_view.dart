import 'package:edelsten/core/viewmodels/comments_model.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/widgets/common/common.dart';
import 'package:flutter/material.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/views/comment/comment_item.dart';
import 'package:provider/provider.dart';
import 'package:edelsten/core/models/user.dart';

class CommentsView extends StatefulWidget {
  final String uuidStone;
  const CommentsView({this.uuidStone});

  @override
  _CommentsViewState createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<CommentModel>(
        onModelReady: (model) {
          model.getComments(widget.uuidStone);
        },
        builder: (context, model, child) => Scaffold(
                body: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      const Color(0xFF021534),
                      const Color(0xFF445269)
                    ])),
                child:
                    model.state == ViewState.Busy || model.listComment == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Stack(children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: ListView.builder(
                                itemCount: model.listComment.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CommentItemWidget(
                                      model: model, index: index);
                                },
                              ),
                            ),
                            Provider.of<User>(context) == null
                                ? Container()
                                : Positioned(
                                    bottom: 20,
                                    right: 20,
                                    child: FloatButton(
                                      route: RoutesNames.inComing,
                                      icon: Icons.add,
                                      color: Color.fromRGBO(158, 158, 158, 0.5),
                                      argument: '',
                                    ),
                                  )
                          ]),
              ),
            )));
  }
}
