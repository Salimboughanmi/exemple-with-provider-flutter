import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestOne extends StatefulWidget {
  const TestOne({super.key});

  @override
  State<TestOne> createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("providers"),
            backgroundColor: Colors.amber,
          ),
          body: Consumer<Model>(
            builder: (context, value, child) => Column(
              children: [
                Center(
                  child: Text("${value.name}"),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    value.changeName();
                  },
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: const Text(
                    "do something",
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "welcome";
  changeName() {
    name = "salim";
    notifyListeners(); // do rebuild to consumer
  }
}
