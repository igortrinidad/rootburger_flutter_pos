import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rootburger_flutter_pos/login/login_bloc.dart';
import 'package:rootburger_flutter_pos/login/login_page.dart';
import 'package:rootburger_flutter_pos/models/user_model.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    final loginBloc = BlocProvider.getBloc<LoginBloc>();

    return StreamBuilder<UserModel>(
      stream: loginBloc.getUserLogged,
      builder: (context, snapshot) {
        return !snapshot.hasData ? Container() : Container(
          color: Colors.pink,
          child: Center(
            child: Column(
              children: [
                Text("${snapshot.data.fullName}", style: TextStyle(color: Colors.white, fontSize: 16)),

                StreamBuilder(
                  stream: loginBloc.getUserIsLogged,
                  builder: (context, snapshot) => RaisedButton(
                    color: Colors.tealAccent,
                    onPressed: !snapshot.hasData ? null : 
                    () async {
                      try {// This could display a loading spinner of sorts.
                        await loginBloc.makeLogout();
                        Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) =>LoginPage()));
                      } catch (e) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Falha ao deslogar!"),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 2),
                            )
                        );
                      } 
                    }
                  )
                )

              ]
            
            )
          )
        );
      }
    );
      
    
  }

}