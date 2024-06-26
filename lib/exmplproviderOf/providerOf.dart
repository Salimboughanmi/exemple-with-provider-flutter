import 'package:eshope/exmplproviderOf/providerOf%20expl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

////////////////////////////////////////////////////////// provider of

class ExempleProvider_of extends StatefulWidget {
  const ExempleProvider_of({super.key});

  @override
  State<ExempleProvider_of> createState() => _ExempleProvider_ofState();
}

class _ExempleProvider_ofState extends State<ExempleProvider_of> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Model(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('exemple with provider of'),
          ),
          body: widgeChild(),
        ));
  }
}

class Model extends ChangeNotifier {
  var text = "heloo";

  changetext() {
    text = "salim";
    notifyListeners();
  }
}
