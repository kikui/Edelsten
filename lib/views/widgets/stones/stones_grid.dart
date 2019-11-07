import 'package:flutter/material.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/widgets/widgets.dart';

class StonesGridViewWidget extends StatelessWidget {
  const StonesGridViewWidget({@required this.stones});

  final List stones;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: stones?.length,
        itemBuilder: (context, index) => StoneListItem(
              stone: stones[index],
              onTap: () {
                Navigator.pushNamed(context, RoutesNames.stone,
                    arguments: stones[index]);
              },
            ));
  }
}
