import 'package:edelsten/core/viewmodels/comments_model.dart';
import 'package:edelsten/routes/routes_names.dart';
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
    var listViewKeyboardHeigth = MediaQuery.of(context).viewInsets.bottom;
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
                child: model.state == ViewState.Busy ||
                        model.listComment == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 40, left: 20),
                                child: InkWell(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Provider.of<User>(context) == null
                                  ? Text('')
                                  : Container(
                                      margin:
                                          EdgeInsets.only(top: 40, right: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, RoutesNames.inComing);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ))
                            ],
                          ),
                          Container(
                            height: Provider.of<User>(context) == null
                                ? MediaQuery.of(context).size.height - 70
                                : MediaQuery.of(context).size.height - 70 - 48 - listViewKeyboardHeigth,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListView.builder(
                                itemCount: model.listComment.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CommentItemWidget(
                                      model: model, index: index);
                                },
                              ),
                            ),
                          ),
                          Provider.of<User>(context) == null
                              ? Container()
                              : Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: TextField(
                                                    controller: model
                                                        .messageBarController,
                                                    decoration: new InputDecoration(
                                                        hintText:
                                                            ' Envois ton message ici ;)')),
                                              ),
                                              IconButton(
                                                  icon: Icon(Icons.send),
                                                  onPressed: () {
                                                    model.messageBarController
                                                                .text ==
                                                            ''
                                                        ? model
                                                            .messageBarController
                                                            .clear()
                                                        : model.createComment(
                                                            widget.uuidStone,
                                                            '',
                                                            model
                                                                .messageBarController
                                                                .text);
                                                  }),
                                            ],
                                          )),
                                    ),
                                  ],
                                )
                        ],
                      )),
              ),
            )));
  }
}
