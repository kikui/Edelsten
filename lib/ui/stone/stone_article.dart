import 'package:edelsten/core/article_repository/article_repository.dart';
import 'package:flutter/material.dart';

class StoneArticle extends StatelessWidget {
  // StoneArticle({Key key}) : super(key: key);
  // List colors = [Colors.green, Colors.orange, Colors.blue];

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: Api().getAllStones(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return SizedBox(
                  height: 200,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    decoration: BoxDecoration(                      
                      borderRadius: new BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/${article.picture}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  article?.title,                                  
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                article?.overview,
                                maxLines: 2,
                                style: TextStyle(color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   child: ButtonBar(
                        //     children: [
                        //       RaisedButton(
                        //         child: Text('Details'),
                        //         onPressed: () {
                        //           Navigator.pushNamed(
                        //             context,
                        //             articleDetails.routeName,
                        //             arguments: ScreenArguments(
                        //               article?.title,
                        //               article?.imageUrl,
                        //               article?.description,
                        //             ),
                        //           );
                        //         },
                        //         color: Colors.blue,
                        //         textColor: Colors.white,
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    )
                    );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      );
}
