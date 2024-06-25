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
              Consumer<ChangeModel>(
                builder:
                    (BuildContext context, ChangeModel value, Widget? child) {
                  return Text(value.name);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<ChangeModel>(
                  builder: (builder, value, child) => Text(value.lastName)),
              SizedBox(
                height: 10,
              ),
              Consumer<ChangeModel>(
                builder:
                    (BuildContext context, ChangeModel value, Widget? child) =>
                        ElevatedButton(
                  onPressed: () {
                    value.ChangeName();
                  },
                  child: Text("show name"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer(
                builder:
                    (BuildContext context, ChangeModel value, Widget? child) =>
                        ElevatedButton(
                  onPressed: () {
                    value.ChangeLastName();
                  },
                  child: Text("show last name"),
                ),
              ),
            ],
          ),
        ));
  }
}

class ChangeModel with ChangeNotifier {
  String name = "your name";
  String lastName = "your last name";

  ChangeName() {
    name = "my name is salim";
    notifyListeners();
  }

  ChangeLastName() {
    lastName = "my last name is boughanmi";
    notifyListeners();
  }
}
