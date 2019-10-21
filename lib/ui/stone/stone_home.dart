import 'package:edelsten/ui/common/common.dart';
import 'package:edelsten/ui/stone/stone.dart';
import 'package:flutter/material.dart';

class StoneHome extends StatelessWidget {
  static const routeName = '/stones';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [const Color(0xFF021534), const Color(0xFF445269)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchWidget(),
              Expanded(
                child: StoneArticle(),
              )
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: BottomNavigationBarWidget(),
        ),
      ],
    ));
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, 10, 0),
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
                    Icon(Icons.search),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(hintText: "Rechercher"),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
