import 'package:example/theme.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.dark(),
      home: DefaultBottomBarController(
        child: ExamplePage(),
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      //
      // Set [extendBody] to true for bottom app bar overlap body content
      extendBody: true,
      appBar: AppBar(
        title: Text("Panel Showcase"),
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
      //
      // Lets use docked FAB for handling state of sheet
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        //
        // Set onVerticalDrag event to drag handlers of controller for swipe effect
        onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
        onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
        child: FloatingActionButton.extended(
          label: AnimatedBuilder(
            animation: DefaultBottomBarController.of(context).state,
            builder: (context, child) => Text(
              DefaultBottomBarController.of(context).isOpen
                  ? "Pull down"
                  : "Pull up",
            ),
          ),
          elevation: 2,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          //
          //Set onPressed event to swap state of bottom bar
          onPressed: () => DefaultBottomBarController.of(context).swap(),
        ),
      ),
      //
      // Actual expandable bottom bar
      bottomNavigationBar: BottomExpandableAppBar(
        horizontalMargin: 16,
        shape: AutomaticNotchedShape(
            RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
        expandedBackColor: Theme.of(context).backgroundColor,
        expandedBody: Center(
          child: Text("Hello world!"),
        ),
        bottomAppBarBody: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Text(
                  "Foo",
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                child: Text(
                  "Bar",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Card(
          color: Theme.of(context).bottomAppBarColor,
          child: Text(
            index.toString(),
          ),
        ),
      ),
    );
  }
}
