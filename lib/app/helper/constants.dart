import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static Constants get = Constants._();
  //general string
  String appName = 'MyCaliana - Operator';

  //color
  Color primaryColor = Color(0xFF149CF7);

  //image
  String logo = 'assets/images/logo.png';

  //array
  List<Map<String, dynamic>> listFitur = [
    {
      'id': 1,
      'nama': 'Semua Fitur',
    },
    {
      'id': 2,
      'nama': 'Version Management System',
    },
    {
      'id': 3,
      'nama': 'Access Control System',
    },
  ];
}
