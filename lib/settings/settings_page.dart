import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rootburger_flutter_pos/helpers/custom_dio.dart';

class SettingsPage extends StatefulWidget{
  @override
  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {

Future<Map> _getStores() async {

    var customDio = CustomDio();
    Response response = await customDio.getClient().get("/api/flutter/store/getList");

    print(response.statusCode);
    print(response.data);

    if(response.statusCode == 200) {
      
      print("<<<<<< STORES LISTS >>>>>>");
      return response.data["stores"];
        
    } else {
      return new Map();
    }
      
  }

  @override
  void initState() {
    super.initState();
    _getStores().then((map){
      print(map);
    });

  }

  @override
  Widget build(BuildContext context){
    return Container();
  }

}