import 'package:eshope/exmplproviderOf/providerOf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class widgeChild extends StatelessWidget {
  const widgeChild({super.key});
  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<Model>(context, listen: true); =======> methode 1

    return Column(
      children: [
        Center(
          // child: Text('${data.text}'),  =======> methode 1
          child: Text("${context.watch<Model>().text}"), // =======> methode 2
          //on peut eleminer cet ligne : var data = Provider.of<Model>(context, listen: false);// methode 1
          // et deplacer par   child: Text("${context.read<Model>().text}"),   //methode 2
          // ne fait pas les changement sur UI et read model=(context, listen: false) jst lire

          //autrement
          //on peut eleminer cet ligne  var data = Provider.of<Model>(context, listen: true); //methode 1
          // et deplacer par   child: Text("${context.watch<Model>().text}"), // methode 2
          // faire les changement sur UI et read model=(context, listen: true)
        ),
        SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: () {
            // data.changetext(); =======> methode 1
            context.read<Model>().changetext(); // =======> methode 2
          },
          child: Text("clic here"),
          color: Colors.blue,
          textColor: Colors.amber,
        ),
      ],
    );
  }
}
