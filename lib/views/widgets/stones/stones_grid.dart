import 'package:flutter/material.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/widgets/widgets.dart';

class StonesGridViewWidget extends StatelessWidget {
  const StonesGridViewWidget({@required this.stones, @required this.model});

  final List stones;
  final dynamic model;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
