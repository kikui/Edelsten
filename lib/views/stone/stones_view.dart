import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/viewmodels/stones_model.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/common/common.dart';
import 'package:edelsten/views/stone/stone.dart';
import 'package:flutter/material.dart';
import '../base_view.dart';

class StonesView extends StatelessWidget {
  static const routeName = RoutesNames.stones;
  @override
  Widget build(BuildContext context) {
    return BaseView<StonesModel>(
      onModelReady: (model) async {
        await model.getstones();
      },
      builder: (context, model, child) => Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  const Color(0xFF021534),
                  const Color(0xFF445269)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SearchWidget(),
                Expanded(
                  child: stonesListView(model.stones),
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
      )),
    );
  }
}

Widget stonesListView(List<Stone> stones) => ListView.builder(
    itemCount: stones?.length,
    itemBuilder: (context, index) => StoneListItem(
          stone: stones[index],
          onTap: ()  {
            Navigator.pushNamed(context, RoutesNames.stone, arguments: stones[index]);
          },
        ));

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
                image: AssetImage('assets/images/${stone.picture}'),
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
