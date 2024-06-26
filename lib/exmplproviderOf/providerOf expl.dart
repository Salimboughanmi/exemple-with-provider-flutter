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

// DOCUMENTATION

/* 
En Flutter, le widget StreamBuilder est souvent utilisé pour réagir aux modifications d'un Stream. Deux méthodes courantes utilisées dans ce contexte sont context.watch() et context.read(), mais elles sont utilisées avec le package provider plutôt qu'avec StreamBuilder. Voici la différence entre les deux :

context.watch<T>()
Description : Cette méthode permet d'accéder à une instance de T et de reconstruire le widget lorsque cette instance change.
Utilisation : Utilisée lorsque vous souhaitez que le widget soit reconstruit chaque fois que la donnée observée (T) change.

context.read<T>()
Description : Cette méthode permet d'accéder à une instance de T sans écouter les changements.
Utilisation : Utilisée lorsque vous avez besoin d'accéder à l'instance de T uniquement une fois, sans reconstruire le widget lorsque la donnée change.


Comparaison
Reconstructions :
context.watch<T>() provoque la reconstruction du widget lorsque T change.
context.read<T>() n'affecte pas les reconstructions, il ne fait qu'accéder à l'instance de T une seule fois.
Utilisation typique :
context.watch<T>() est utilisé dans les widgets qui doivent être mis à jour dynamiquement en fonction des changements de données.
context.read<T>() est utilisé dans les cas où les données sont nécessaires pour une action ponctuelle ou lorsqu'un changement de ces données ne doit pas affecter le widget actuel.
En résumé, choisissez context.watch<T>() si vous avez besoin que le widget se reconstruise en réponse aux changements de données, et context.read<T>() si vous avez simplement besoin d'accéder aux données une fois sans que le widget se reconstruise en cas de changements.

Si vous avez des exemples spécifiques ou des cas d'utilisation particuliers en tête, n'hésitez pas à les partager pour que je puisse vous fournir des informations encore plus précises.

 */