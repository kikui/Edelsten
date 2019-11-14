import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final dynamic model; //StonesModel or FavoritesModel

  SearchWidget({@required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: model.searchIconPressed,
        child: Container(
          margin: EdgeInsets.only(left: 45, right: 45, top: 50),
          child: Row(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            icon: model.searchIcon,
                            onPressed: () {
                              model.searchIconPressed();
                            }),
                        Flexible(
                          child: model.searchBar,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
