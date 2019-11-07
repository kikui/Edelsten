import 'package:edelsten/core/models/stone.dart';
import 'package:flutter/material.dart';

class StoneListItem extends StatelessWidget {
  final Stone stone;
  final Function onTap;

  StoneListItem({this.stone, this.onTap});
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
              ],
            ),
          )),
    );
  }
}