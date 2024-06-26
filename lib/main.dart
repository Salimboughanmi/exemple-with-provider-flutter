import 'package:eshope/exmplproviderOf/providerOf.dart';
import 'package:eshope/testone.dart';
import 'package:eshope/testtwo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: TestOne(),
      //  home: TestTwo(),
      home: ExempleProvider_of(),
    );
  }
}
