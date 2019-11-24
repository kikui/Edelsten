import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/viewmodels/stone_item_model.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:edelsten/core/models/user.dart';

class StoneListItem extends StatelessWidget {
  final model;
  final Stone stone;
  final Function onTap;

  StoneListItem({this.model, this.stone, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
            height: 200,
            child: Container(
              margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(stone.defaultPicture),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            stone?.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Text(
                          stone?.overview,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Provider.of<User>(context) == null ? 
                    Text('') :
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () async {
                          model.updateFavory(stone.id);
                        },
                        child: Icon(
                          model.stateFavory[int.parse(stone.id)] ? Icons.favorite : Icons.favorite_border,
                          color: model.stateFavory[int.parse(stone.id)] ? Colors.red : Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                ],
              ),
            )),
      );
  }
}
