import 'package:flutter/material.dart';
import '../base_view.dart';
import 'package:edelsten/views/widgets/widgets.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/core/view_state.dart';

class StonesFavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<StonesModel>(
      onModelReady: (model) async {
        await model.getFavoritesStones();
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SearchWidget(
                model: model,
              ),
              model.state == ViewState.Busy
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: StonesListViewWidget(stones: model.stoneToShow()),)
            ]),
          ),
        ],
      )),
    );
  }
}
