/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestTwo extends StatefulWidget {
  const TestTwo({super.key});

  @override
  State<TestTwo> createState() => _TestTwoState();
}

class _TestTwoState extends State<TestTwo> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChangeModel(),
        child: Scaffold(
          body: ListView(
            children: [
              Consumer<ChangeModel>(
                builder:
                    (BuildContext context, ChangeModel value, Widget? child) {
                  print("affiche nom");
                  return Text(value.name);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<ChangeModel>(builder: (builder, value, child) {
                print("affiche prenom");

                return Text(value.lastName);
              }),
              SizedBox(
                height: 10,
              ),
              Consumer<ChangeModel>(builder:
                  (BuildContext context, ChangeModel value, Widget? child) {
                print("btn1");

                return ElevatedButton(
                  onPressed: () {
                    value.ShowName();
                  },
                  child: Text("show name"),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Consumer<ChangeModel>(builder:
                  (BuildContext context, ChangeModel value, Widget? child) {
                print("btn2");
                return ElevatedButton(
                  onPressed: () {
                    value.ShowLastName();
                  },
                  child: Text("show last name"),
                );
              }),
            ],
          ),
        ));
  }
}

class ChangeModel with ChangeNotifier {
  String name = "your name";
  String lastName = "your last name";

  ShowName() {
    name = "my name is salim";
    notifyListeners();
  }

  ShowLastName() {
    lastName = "my last name is boughanmi";
    notifyListeners();
  }
} */
// quand nous avons clique sur boutton 1 tt les consumer de la page faire rebuild malgré je veux faire rebuild just la partie de btn 1
// donc pour la perfermonce de l'app nous avons utuliser (selector ) just pour rebuild une partie dans l'application

//*****************************************************exemple avec selector */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestTwo extends StatefulWidget {
  const TestTwo({super.key});

  @override
  State<TestTwo> createState() => _TestTwoState();
}

class _TestTwoState extends State<TestTwo> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChangeModel(),
        child: Scaffold(
          body: ListView(
            children: [
              Selector<ChangeModel, int>(
                selector: (context, Modelvalue) => Modelvalue.getMyName,
                builder: (context, value, child) {
                  print("selector nom");
                  return Text('${value}');
                },
              ),
              SizedBox(
                height: 10,
              ),
              Selector<ChangeModel, String>(
                  selector: (context, modelValue) => modelValue.getMyLastName,
                  builder: (builder, value, child) {
                    print("affiche prenom");

                    return Text(value);
                  }),
              SizedBox(
                height: 10,
              ),
              Consumer<ChangeModel>(builder:
                  (BuildContext context, ChangeModel value, Widget? child) {
                return ElevatedButton(
                  onPressed: () {
                    value.ShowName();
                  },
                  child: Text("show name"),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Consumer<ChangeModel>(builder:
                  (BuildContext context, ChangeModel value, Widget? child) {
                return ElevatedButton(
                  onPressed: () {
                    value.ShowLastName();
                  },
                  child: Text("show last name"),
                );
              }),
            ],
          ),
        ));
  }
}

class ChangeModel with ChangeNotifier {
  var name = 1;
  var lastName = "your last name";

  get getMyName => name;
  get getMyLastName => lastName;

  ShowName() {
    name++;
    notifyListeners();
  }

  ShowLastName() {
    lastName = "my last name is boughanmi";
    notifyListeners();
  }
}
//selector une fois wigdet fait un rebuild c tt , fait rebuld en cas de modification expl compteur 