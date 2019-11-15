import 'package:edelsten/core/viewmodels/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:edelsten/core/view_state.dart';

class CommentsView extends StatefulWidget {
  final String stoneId;
  const CommentsView({this.stoneId});

  @override
  _CommentsViewState createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentModel>(
      onModelReady: (model) {
        model.getComments(widget.stoneId);
      },
      builder: (context, model, child) => model.state == ViewState.Busy ||
              model.listComment == null
          ? Center(
                child: CircularProgressIndicator(),
              )
          : Container(
            // contenue de la page commentaire, à s'inspirer du fichier views/widgets/stones/stone_comments.dart
          ),
    );
  }
}
