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


// la deference entre provider et change notifyprovider

/* 
En Flutter, le package provider est couramment utilisé pour gérer l'état des applications. Deux des classes les plus utilisées dans ce package sont Provider et ChangeNotifierProvider. Voici la différence entre elles :
Provider
Description : Provider est la classe de base du package provider. Elle permet d'injecter n'importe quel objet dans l'arborescence de widgets sans nécessiter de gestion spécifique de l'état.
Utilisation : Utilisée pour fournir des objets qui ne nécessitent pas de notifications de changement, c'est-à-dire des objets immuables ou des objets qui ne changent pas fréquemment.

ChangeNotifierProvider
Description : ChangeNotifierProvider est une extension de Provider spécifiquement conçue pour les objets qui implémentent l'interface ChangeNotifier. ChangeNotifier est une classe qui fournit un mécanisme simple pour notifier les auditeurs des changements d'état.
Utilisation : Utilisée pour fournir des objets qui nécessitent des notifications de changement, c'est-à-dire des objets dont l'état change et qui doivent informer les widgets dépendants de ces changements.
 
 Comparaison
Provider :
Utilisé pour fournir des objets simples, statiques ou immuables.
Ne gère pas la notification des changements d'état.
ChangeNotifierProvider :
Utilisé pour fournir des objets qui implémentent ChangeNotifier.
Permet de notifier automatiquement les widgets dépendants lorsque l'état change.
En résumé, utilisez Provider pour les objets statiques ou immuables et ChangeNotifierProvider pour les objets dynamiques qui doivent notifier les widgets lorsque leur état change.
 */