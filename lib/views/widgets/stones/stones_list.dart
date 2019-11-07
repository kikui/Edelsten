import 'package:flutter/material.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/widgets/widgets.dart';

class StonesListViewWidget extends StatelessWidget {
  const StonesListViewWidget({@required this.stones});

  final List stones;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: stones?.length,
        itemBuilder: (context, index) => StoneListItem(
              stone: stones[index],
              displayFavorite: true,
              onTap: () {
                Navigator.pushNamed(context, RoutesNames.stone,
                    arguments: stones[index]);
              },
            ));
  }
}