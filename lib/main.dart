import 'package:bloc_example/bloc/counter_bloc.dart';
import 'package:bloc_example/user_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: UserWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc = CounterBloc(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Flutter RxDart'),
      ),
      body: SafeArea(
        child: new Center(
          child: StreamBuilder<int>(
            stream: _counterBloc.counterObservable,
            builder: (_, s){

              return Text(
                "${s.data}",
                style: Theme.of(context).textTheme.display2,
              );
            },
          ),
        ),
      ),
      floatingActionButton: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _counterBloc.increment(),
          ),

          SizedBox(
            height: 16.0,
          ),

          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () => _counterBloc.decrement(),
          ),
        ],
      ),
      
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}


