import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterDark.dark(ThemeData.dark()),
      home: DefaultBottomBarController(
        child: Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  BottomBarController controller;

  @override
  void initState() {
    super.initState();
    controller = BottomBarController(vsync: this, dragLength: 550, snap: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,

        //Set to true for bottom appbar overlap body content
        extendBody: true,
        // appBar: AppBar(
        //   title: Text("Panel Showcase"),
        //   backgroundColor: Theme.of(context).bottomAppBarColor,
        // ),

        // Lets use docked FAB for handling state of sheet
        floatingActionButton: GestureDetector(
          // Set onVerticalDrag event to drag handlers of controller for swipe effect
          onVerticalDragUpdate: controller.onDrag,
          onVerticalDragEnd: controller.onDragEnd,
          child: FloatingActionButton.extended(
            label: Text("Pull up"),
            elevation: 2,
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,

            //Set onPressed event to swap state of bottom bar
            onPressed: () => controller.swap(),
          ),
        ),
        body: Container(
            child: GridView.builder(
          itemBuilder: (context, ind) => Card(
            child: Center(child: Text("Card $ind")),
          ),
          padding: EdgeInsets.all(16.0),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        )),

        // Actual expandable bottom bar
        // bottomNavigationBar: PreferredSize(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(controller.dragLength),
          // Size.fromHeight(controller.state.value * controller.dragLength),
          child: BottomExpandableAppBar(
            // Provide the bar controller in build method or default controller as ancestor in a tree
            controller: controller,
            expandedHeight: controller.dragLength,
            horizontalMargin: 16,
            attachSide: Side.Top,
            expandedBackColor: Theme.of(context).backgroundColor,
            // Your bottom sheet code here
            expandedBody: Center(
              child: Text("Hello world!"),
            ),
            // shape: AutomaticNotchedShape(
            //     RoundedRectangleBorder(),
            //     StadiumBorder(
            //         side: BorderSide())), // Your bottom app bar code here
            bottomAppBarBody: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Hello",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      "World",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
