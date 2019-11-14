import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rootburger_flutter_pos/helpers/scaffold_service.dart';

import 'login_bloc.dart';


class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    final loginBloc = BlocProvider.getBloc<LoginBloc>();

    GetIt locator = GetIt.instance;

    return Scaffold(
      key: locator<ScaffoldService>().scaffoldKey,
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

                      await loginBloc.makeLogin();
                      
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