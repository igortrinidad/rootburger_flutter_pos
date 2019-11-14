import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rootburger_flutter_pos/helpers/custom_dio.dart';
import 'package:rootburger_flutter_pos/models/user_model.dart';
import 'package:rxdart/rxdart.dart';
import 'login_validator.dart';

class LoginBloc extends Object with LoginValidator implements BlocBase {

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
  
    var customDio = CustomDio();
    //Response response = await customDio.getClient().post("/api/auth/login", data: {"login": _emailController.value, "password": _passwordController.value});
    Response response = await customDio.getClient().post("/api/auth/login", data: {"login": "igorlucast@hotmail.com", "password": "password"});

    _isLoadingController.sink.add(false);

    if(response.statusCode == 200) {
      
      _userIsLogged.sink.add(true);
      _userController.sink.add(UserModel.fromJson(response.data["user"]));
      print("<<<<<< USER WAS LOGGED >>>>>>");
        
    } else {
      _userIsLogged.sink.add(false);
      _userController.sink.add(UserModel());
      print("<<<<<< USER WASNT! LOGGED >>>>>>");
    }
    
  }

  Future makeLogout() async {

    _userIsLogged.sink.add(false);
    _userController.sink.add(UserModel());
    print("<<<<<< USER SUCCESSFULLY LOGOUT >>>>>>");

  }


  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}