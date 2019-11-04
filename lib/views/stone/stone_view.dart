import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/stone_model.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:edelsten/views/stone/stone.dart';
import 'package:edelsten/views/stone/stone_histories.dart';
import 'package:edelsten/views/stone/stone_pictures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transparent_image/transparent_image.dart';

class StoneView extends StatefulWidget {
  final String uuidStone;

  const StoneView({this.uuidStone});

  @override
  _StoneViewState createState() => _StoneViewState();
}

class _StoneViewState extends State<StoneView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseView<StoneModel>(
      onModelReady: (model) async {
        model.getStone(widget.uuidStone);
      },
      builder: (context, model, child) => Scaffold(
        body: model.state == ViewState.Busy
            ? Container(child:
             Center(
               child: CircularProgressIndicator(),
             ))
            : SlidingUpPanel(
                backdropEnabled: true,
                maxHeight: size.height - (size.height / 4),
                minHeight: size.height / 2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                panel: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF080b12),
                          const Color(0xFF445269)
                        ]),
                  ),
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: Theme.of(context).accentColor,
                        tabs: [
                          Tab(text: 'Résumé'),
                          Tab(text: 'Histoires'),
                          Tab(text: 'Photos'),
                        ],
                        controller: _tabController,
                        indicatorColor: Theme.of(context).accentColor,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            OverviewStoneWidget(stone: model.stone),
                            HistoriesStoneWidget(
                                histories: model.stone.histories),
                            PicturesStoneWidget(pictures: model.stone.pictures)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                body: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 1,
                      child: new FadeInImage.memoryNetwork(
                        image: model.stone.defaultPicture,
                        placeholder: kTransparentImage,
                        width: size.width,
                        height: size.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0),
                                Theme.of(context).primaryColor,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ])),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 40, left: 20),
                              child: InkWell(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40, right: 20),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    model.stone.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    model.stone.overview,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
