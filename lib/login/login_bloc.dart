import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:get_it/get_it.dart';
import 'package:rootburger_flutter_pos/helpers/custom_dio.dart';
import 'package:rootburger_flutter_pos/helpers/navigation_service.dart';
import 'package:rootburger_flutter_pos/helpers/scaffold_service.dart';
import 'package:rootburger_flutter_pos/home/home_page.dart';
import 'package:rootburger_flutter_pos/models/user_model.dart';
import 'package:rxdart/rxdart.dart';
import 'login_validator.dart';

class LoginBloc extends Object with LoginValidator implements BlocBase {

  GetIt locator = GetIt.instance;

  final _isLoadingController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get getIsLoading => _isLoadingController.stream;

  final _emailController = BehaviorSubject<String>.seeded("igorlucast@hotmail.com");
  Function(String) get emailChanged => _emailController.sink.add;
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get outEmail => _emailController.stream;

  final _passwordController = BehaviorSubject<String>();
  Function(String) get passwordChanged => _passwordController.sink.add;
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<String> get outPassword => _passwordController.stream;
  

  Stream<bool> get validate => Observable.combineLatest2(email, password, (e, p) => true);

  final _userController = BehaviorSubject<UserModel>.seeded(UserModel());
  Stream<UserModel> get getUserLogged => _userController.stream;

  final _userIsLogged = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get getUserIsLogged => _userIsLogged.stream;

  final BuildContext context;

  LoginBloc(this.context);

  @override
  void dispose() {
    _isLoadingController.close();
    _emailController.close();
    _passwordController.close();
    _userController.close();
    _userIsLogged.close();
  }

  Future<void> makeLogin() async {
    
    print(_emailController.value);
    
    var customDio = CustomDio();
    
    try {

      Response response = await customDio.getClient().post("/api/auth/login", data: {"login": _emailController.value, "password": _passwordController.value});
      _userIsLogged.sink.add(true);
      _userController.sink.add(UserModel.fromJson(response.data["user"]));
      print("<<<<<< USER WAS LOGGED >>>>>>");
      locator<NavigationService>().navigateTo('/');

    } catch (e) {

      print(e);
      _isLoadingController.sink.add(false);
      _userIsLogged.sink.add(false);
      _userController.sink.add(UserModel());
      print("<<<<<< USER WASNT! LOGGED >>>>>>");

      locator<ScaffoldService>().scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Falha ao Entrar!"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          )
      );
        
    }
    
  }

  Future makeLogout() async {

    _userIsLogged.sink.add(false);
    _userController.sink.add(UserModel());
    print("<<<<<< USER SUCCESSFULLY LOGOUT >>>>>>");

  }


  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}