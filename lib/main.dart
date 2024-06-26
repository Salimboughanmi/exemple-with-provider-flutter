import 'package:flutter/material.dart';
import 'package:learn_provider/exmplproviderOf/providerOf.dart';

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
