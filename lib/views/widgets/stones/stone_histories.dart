import 'package:flutter/material.dart';
import 'package:edelsten/views/widgets/widgets.dart';

class HistoriesStoneWidget extends StatelessWidget {
  const HistoriesStoneWidget({@required this.histories});

  final List histories;

  @override
  Widget build(BuildContext context) {
      return Container(
    padding: EdgeInsets.all(10),
    child: ListView.builder(
      itemCount: histories.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            TitleAndDescription(
                title: histories[index].title + ' - ' + histories[index].period,
                content: histories[index].description),
            SizedBox(height: 15),
          ],
        );
      },
    ),
  );

  }
}