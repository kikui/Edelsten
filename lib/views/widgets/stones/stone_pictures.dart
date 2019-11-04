import 'package:flutter/material.dart';

class PicturesStoneWidget extends StatelessWidget {
  const PicturesStoneWidget({@required this.pictures});

  final List pictures;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: pictures.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5.0,
              child: new Container(
                  child: FittedBox(
                      child: Image.asset('assets/images/${pictures[index]}'),
                      fit: BoxFit.cover)),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ));
  }
}
