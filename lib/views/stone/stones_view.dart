import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/models/user.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:edelsten/views/parameter_view.dart';
import 'package:flutter/material.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/views/in_coming_view.dart';
import 'package:edelsten/views/widgets/widgets.dart';
import 'package:edelsten/views/stone/stone.dart';
import 'package:provider/provider.dart';

class StonesView extends StatefulWidget {
  StonesView({Key key}) : super(key: key);

  @override
  _StonesViewState createState() => _StonesViewState();
}

class _StonesViewState extends State<StonesView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _page = <Widget>[
    StonesListView(),
    InComingView(),
    StonesFavoritesView(),
    ParameterView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page[_selectedIndex],
      ),
      bottomNavigationBar: Provider.of<User>(context) == null ? null :
       BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Pierres'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Notes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoris'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Paramètres'))
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class StonesListView extends StatelessWidget {
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
                        child:
                            StonesListViewWidget(stones: model.stoneToShow()),
                      )
              ],
            ),
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