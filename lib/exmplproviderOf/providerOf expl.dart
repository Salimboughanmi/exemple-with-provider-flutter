import 'package:eshope/exmplproviderOf/providerOf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class widgeChild extends StatelessWidget {
  const widgeChild({super.key});
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Model>(context);

    return Column(
      children: [
        Center(
          child: Text('${data.text}'),
        ),
        SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: () {
            data.changetext();
          },
          child: Text("clic here"),
          color: Colors.blue,
          textColor: Colors.amber,
        ),
      ],
    );
  }
}
