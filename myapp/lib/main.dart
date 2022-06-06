import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void to_zero() {
    setState(() {
      _counter = 0;
    });
  }

  void reduce_one() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // new router to hello world and the _counter by now

            // to zero
            
            // layout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: to_zero,
                    icon: const Icon(Icons.send),
                    label: const Text("清零")
                  ),
                  ElevatedButton.icon(
                    onPressed: reduce_one,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text("减一")
                  ),
                  ElevatedButton.icon(
                    onPressed: (){
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context){
                          return Report(counter: _counter);
                        }),
                      );
                    },
                    icon: const Icon(Icons.local_offer),
                    label: const Text("NEXT")
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Report extends StatefulWidget {
  const Report({required this.counter});

  final int counter;

  @override
  State<StatefulWidget> createState() => MyReport();

}
class MyReport extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("计数报告"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "总计的点击次数为: ",
              style: TextStyle(
                fontFamily: "Menlo",
                fontSize: 23,
              ),
            ),
            Text(
              widget.counter.toString(),
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: "Menlo",
                fontSize: 23,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
