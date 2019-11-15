import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/base_view.dart';
import 'package:edelsten/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddCommentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterModel>(
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
                          InputFieldWidget(
                            fieldText: 'Email', 
                            fieldController: model.emailController, 
                            obscureText: false),
                          InputFieldWidget(
                            fieldText: 'Pseudo', 
                            fieldController: model.usernameController, 
                            obscureText: false),
                          InputFieldWidget(
                            fieldText: 'Mot de passe', 
                            fieldController: model.passwordController,
                            obscureText: true),
                          InputFieldWidget(
                            fieldText: 'Confirmation du mot de passe', 
                            fieldController: model.passwordCheckerController,
                            obscureText: true),
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
                                      var registerSucess = await model.register();
                                      if (!registerSucess) {
                                        getNotificationWidget(
                                          message: model.errorMessage,
                                          isSucced: false,
                                          title: 'Inscription échouée',
                                          context: context);
                                      }
                                      //Si le register est OK
                                      else{
                                        Navigator.pushNamed(context, RoutesNames.stones);
                                      }
                                    },
                                    color: const Color(0xFF071938),
                                    textColor: Colors.white,
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        right: 100,
                                        bottom: 20,
                                        left: 100),
                                    child: Text("S\'inscrire", style: TextStyle(fontSize: 20)),
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
}
