import 'package:fastsell/screen/home.dart';
import 'package:fastsell/screen/login.dart';
import 'package:fastsell/model/profile.dart';
import 'package:flutter/material.dart';

class Resetpw extends StatefulWidget {
  const Resetpw({super.key});

  @override
  State<Resetpw> createState() => _Resetpw();
}

class _Resetpw extends State<Resetpw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password?"),
      ),
    );
  }
}
