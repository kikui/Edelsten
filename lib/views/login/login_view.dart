import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:edelsten/views/common/common.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
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
                          ]),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          LogoWidget(),
                          SizedBox(
                            height: 200,
                          ),
                          Container(
                            child: IntrinsicWidth(
                              child: Column(
                                children: [
                                  fillableField(
                                      'Pseudo', model.textController, false),
                                  fillableField('Mot de passe',
                                      model.passWordController, true),
                                  model.state == ViewState.Busy
                                      ? CircularProgressIndicator()
                                      : Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                side: BorderSide(
                                                    color: const Color(
                                                        0xFF071938))),
                                            onPressed: () async {
                                              var loginSuccess =
                                                  await model.login();
                                              if (loginSuccess) {
                                                // Navigate to the home view
                                                Navigator.pushNamed(context,
                                                    RoutesNames.stones);
                                              }
                                            },
                                            color: const Color(0xFF071938),
                                            textColor: Colors.white,
                                            padding: EdgeInsets.only(
                                                top: 20,
                                                right: 100,
                                                bottom: 20,
                                                left: 100),
                                            child: Text("Se connecter",
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                        ),
                                  Container(
                                    child: InkWell(
                                      child: Text(
                                        "Mot de passe oublié ?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(0xFFABAFB2),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget fillableField(String fieldText, TextEditingController fieldController,
      bool obscureText) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: fieldText,
          contentPadding:
              const EdgeInsets.only(left: 100, bottom: 20, top: 20, right: 100),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
        ),
        controller: fieldController,
        obscureText: obscureText,
      ),
    );
  }
}
