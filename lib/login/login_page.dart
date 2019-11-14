import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import '../home/home_page.dart';

import 'login_bloc.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    final loginBloc = BlocProvider.getBloc<LoginBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              StreamBuilder<String>(
                stream: loginBloc.email,
                builder: (context, snapshot) => Text("${snapshot.data}"),
              ),

              SizedBox(
                height: 20.0,
              ),

              
              StreamBuilder<String>(
                stream: loginBloc.email,
                builder: (context, snapshot) => TextFormField(
                  initialValue: snapshot.data,
                  onChanged: loginBloc.emailChanged,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Insira seu email",
                      labelText: "Email",
                      errorText: snapshot.error),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              StreamBuilder<String>(
                stream: loginBloc.password,
                builder: (context, snapshot) => TextField(
                  onChanged: loginBloc.passwordChanged,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Insira o password",
                    labelText: "Password",
                    errorText: snapshot.error),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              StreamBuilder<bool>(
                stream: loginBloc.validate,
                builder: (context, snapshot) => RaisedButton(
                  color: Colors.tealAccent,
                  onPressed: snapshot.hasData
                    ? () async {

                      try {// This could display a loading spinner of sorts.
                        await loginBloc.makeLogin();
                        Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => HomePage()));
                      } catch (e) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Falha ao Entrar!"),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 2),
                              )
                          );
                      }  
                    }
                    : null,
                  child: Text("Entrar"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}