import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/parameters_model.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:edelsten/views/widgets/common/logo.dart';
import 'package:edelsten/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/common/button.dart';

class ParameterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ParametersModel>(
      builder: (context, model, child) => Scaffold(
          body: Center(
              child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [const Color(0xFF021534), const Color(0xFF445269)])),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LogoWidget(),
            Container(
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    model.state == ViewState.Busy ? CircularProgressIndicator() 
                      :  
                      ButtonWidget(
                        color: const Color(0xFF071938),
                        text: 'Deconexion',
                        function: () async {
                          var isDeconnected = await model.logout();
                          if (isDeconnected){
                            Navigator.pushNamed(context, RoutesNames.home);
                          }
                          else{
                            getNotificationWidget(
                              title: "Echec de la deconnection!",
                              isSucced: false,
                              message: "Veuillez réessayer plus tard!" ,
                              context: context,
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        )),
      ))),
    );
  }
}
