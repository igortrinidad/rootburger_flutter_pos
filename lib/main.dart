import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'login/login_page.dart';
import 'login/login_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      dependencies: [
        
      ],
      blocs: [
        Bloc( (i) => LoginBloc(context)),
      ],
      child: MaterialApp(
        home: LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
      )
    );
  }

}
