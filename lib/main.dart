import 'package:flutter/material.dart';
import 'package:tugasakhir/ui/bangunan.dart';
import 'package:tugasakhir/ui/bangunan.dart';
import 'package:tugasakhir/ui/home.dart';
import 'package:tugasakhir/ui/login.dart';
import 'package:tugasakhir/helpers/db_aset.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Go Asin NTB",
    initialRoute: "/",
    routes: {
      "/": (context) => Dashboard(),
    },
  ));
}
