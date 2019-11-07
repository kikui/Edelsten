import 'package:flutter/material.dart';

List comments = [
  {},
  {},
  {},
  {},
];

class CommentsStoneWidget extends StatelessWidget {
  const CommentsStoneWidget({@required this.stoneId});

  final String stoneId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: const Color(0xFF10213B),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Wrap(
                      children: [
                        Text(
                            'Mélissa TOB - Excellent Excellent Excellent Excellent',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 15)),
                        // Text(comments[index]?.user '-' comments[index]?.title, style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18)),
                        Text('06/11/2019',
                            style: TextStyle(
                                color: const Color(0xFF707070),
                                fontStyle: FontStyle.italic,
                                fontSize: 11),
                                textAlign: TextAlign.left,),

                        // Text(comments[index]?.date, style: TextStyle(color: const Color(0xFF707070), fontStyle: FontStyle.italic, fontSize: 11)),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child:
                          Text('+100', style: TextStyle(color: Colors.white)),
                      // child: Text('+'+comments[index]?.like, style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                // child: Text(comments[index]?.body, style: TextStyle(color: Colors.white)),
                child: Text(
                  'Excellente pierres. Tous les renseignements dont on a besoin nous sont fournis pour découvrir cette pierre.',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
