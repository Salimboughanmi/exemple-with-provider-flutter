import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Multiprovider extends StatelessWidget {
  const Multiprovider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('multi provider'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return MyModel();
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              return SetColor();
            },
          )
        ],
        child: Column(
          children: [
            Container(
              child: Consumer2<MyModel, SetColor>(
                builder: (context, data, setbg, child) {
                  return Text(
                    data.showsomething,
                    style: TextStyle(
                      color: setbg.bkone,
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Consumer2<MyModel, SetColor>(
                builder: (context, data, bgcolor, child) {
                  return MaterialButton(
                    onPressed: () {
                      data.dosomethingOne();
                      bgcolor.changeColor1();
                    },
                    color: Colors.blue,
                    child: Text("do something one"),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Consumer2<MyModel, SetColor>(
                builder: (context, data, bgcol, child) {
                  return MaterialButton(
                    onPressed: () {
                      data.dosomethingTwo();
                      bgcol.changeColor2();
                    },
                    color: Colors.blue,
                    child: Text("do something two"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  var showsomething = " Show something ...";

  dosomethingOne() {
    showsomething = " provider YES ONE";
    notifyListeners();
  }

  dosomethingTwo() {
    showsomething = " provider YES TWOOOOOOOO";
    notifyListeners();
  }
}

class SetColor extends ChangeNotifier {
  Color bkone = const Color.fromARGB(255, 3, 3, 3);
  //Color setcolor = Color.fromARGB(255, 23, 145, 84);
  //Color setcolor2 = Color.fromARGB(255, 241, 6, 76);

  changeColor1() {
    bkone = Colors.yellow;
    notifyListeners();
  }

  changeColor2() {
    bkone = Colors.red;
    notifyListeners();
  }
}
 
 
/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Multiprovider extends StatelessWidget {
  const Multiprovider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('multi provider'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return MyModel();
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              return SetColor();
            },
          ),
        ],
        child: Column(
          children: [
            Container(
              child: Consumer<MyModel>(
                builder: (context, data, child) {
                  return Text(data.showsomething);
                },
              ),
            ),
            Container(
              child: Consumer2<MyModel, SetColor>(
                builder: (context, data, colorProvider, child) {
                  return MaterialButton(
                    onPressed: () {
                      data.dosomethingOne();
                      colorProvider.changeColor1();
                    },
                    color: colorProvider.button1Color,
                    textColor: Colors.black,
                    child: Text("do something one"),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Consumer2<MyModel, SetColor>(
                builder: (context, data, colorProvider, child) {
                  return MaterialButton(
                    onPressed: () {
                      data.dosomethingTwo();
                      colorProvider.changeColor2();
                    },
                    color: colorProvider.button2Color,
                    textColor: Colors.black,
                    child: Text("do something two"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  var showsomething = " Show something ...";

  dosomethingOne() {
    showsomething = " provider YES ONE";
    notifyListeners();
  }

  dosomethingTwo() {
    showsomething = " provider YES TWOOOOOOOO";
    notifyListeners();
  }
}

class SetColor extends ChangeNotifier {
  Color button1Color = Colors.yellow;
  Color button2Color = Colors.yellow;

  void changeColor1() {
    button1Color = Color.fromARGB(255, 23, 145, 84);
    notifyListeners();
  }

  void changeColor2() {
    button2Color = Color.fromARGB(255, 46, 13, 85);
    notifyListeners();
  }
}
 */
/* 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Multiprovider extends StatelessWidget {
  const Multiprovider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('multi provider'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return MyModel();
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              return SetColor();
            },
          ),
        ],
        child: Consumer<SetColor>(
          builder: (context, colorProvider, child) {
            return Container(
              color: colorProvider.backgroundColor,
              child: Column(
                children: [
                  Container(
                    child: Consumer<MyModel>(
                      builder: (context, data, child) {
                        return Text(data.showsomething);
                      },
                    ),
                  ),
                  Container(
                    child: Consumer2<MyModel, SetColor>(
                      builder: (context, data, colorProvider, child) {
                        return MaterialButton(
                          onPressed: () {
                            data.dosomethingOne();
                            colorProvider.changeColor1();
                          },
                          color: colorProvider.button1Color,
                          textColor: Colors.black,
                          child: Text("do something one"),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Consumer2<MyModel, SetColor>(
                      builder: (context, data, colorProvider, child) {
                        return MaterialButton(
                          onPressed: () {
                            data.dosomethingTwo();
                            colorProvider.changeColor2();
                          },
                          color: colorProvider.button2Color,
                          textColor: Colors.black,
                          child: Text("do something two"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  var showsomething = " Show something ...";

  dosomethingOne() {
    showsomething = " provider YES ONE";
    notifyListeners();
  }

  dosomethingTwo() {
    showsomething = " provider YES TWOOOOOOOO";
    notifyListeners();
  }
}

class SetColor extends ChangeNotifier {
  Color button1Color = Colors.yellow;
  Color button2Color = Colors.yellow;
  Color backgroundColor = Colors.white;

  void changeColor1() {
    button1Color = Color.fromARGB(255, 23, 145, 84);
    backgroundColor = button1Color;
    notifyListeners();
  }

  void changeColor2() {
    button2Color = Color.fromARGB(255, 46, 13, 85);
    backgroundColor = button2Color;
    notifyListeners();
  }
}
 */