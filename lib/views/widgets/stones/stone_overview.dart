import 'package:flutter/material.dart';
import 'package:edelsten/views/widgets/widgets.dart';
import 'package:edelsten/core/models/stone.dart';

class OverviewStoneWidget extends StatelessWidget {
  const OverviewStoneWidget({@required this.stone});

  final Stone stone;

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 20,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: stone.countries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                              stone.countries[index] +
                                  (index < stone.countries.length - 1
                                      ? ', '
                                      : ''),
                              style: TextStyle(color: Colors.white));
                        },
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.brush, color: Colors.white)),
                Expanded(
                    child: Text(stone.ethymology,
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              TitleAndDescription(
                                title: 'Groupe',
                                content: stone.group,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 4,
                      child: Container(
                          child: Column(
                        children: [
                          TitleAndDescription(
                            title: 'Composition chimique',
                            content: stone.chemicalComposition,
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              TitleAndDescription(
                                  title: 'Système Cristallin',
                                  content: stone.cristallineSystem),
                            ],
                          )),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 4,
                      child: Container(
                          child: Column(
                        children: [
                          TitleAndDescription(
                            title: 'Dureté',
                            content: stone.hardness,
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TitleAndDescription(
              title: '',
              content: stone.description,
            ),
          ),
        ],
      ));

  }
}