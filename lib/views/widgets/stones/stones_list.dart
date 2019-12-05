import 'package:flutter/material.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/widgets/widgets.dart';

class StonesListViewWidget extends StatelessWidget {
  const StonesListViewWidget({@required this.stones, @required this.model});

  final List stones;
  final dynamic model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: stones?.length,
        itemBuilder: (context, index) => StoneListItem(
              model: model,
              stone: stones[index],
              onTap: () {
                Navigator.pushNamed(context, RoutesNames.stone,
                    arguments: stones[index]).then((_) => {model.setStateFavory()});
              },
            ));
  }
}