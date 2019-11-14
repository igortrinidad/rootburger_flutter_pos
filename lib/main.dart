import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rootburger_flutter_pos/helpers/navigation_service.dart';
import 'package:rootburger_flutter_pos/helpers/scaffold_service.dart';
import 'helpers/router.dart';
import 'login/login_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  
  setupLocator();
  runApp(MyApp());

}

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

    GetIt locator = GetIt.instance;

    return BlocProvider(
      blocs: [
        Bloc( (i) => LoginBloc(context)),
      ],
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: Router.generateRoute,
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
      )
    );
  }

}

void setupLocator() {

  GetIt locator = GetIt.instance;
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ScaffoldService());
  
}
