# ExpandableBottomAppBar

[![pub package](https://img.shields.io/pub/v/expandable_bottom_bar)](https://pub.dev/packages/expandable_bottom_bar)

Animatable bottom app bar with expandable sheet

## Preview

![preview](https://github.com/rIIh/expandable-bottom-bar/raw/master/media/showcase.gif)

## Getting Started

Add the plugin:

```yaml
dependencies:
  ...
  expandable_bottom_bar: any
```

## Basic Usage

Adding the widget

```dart
bottomNavigationBar: BottomExpandableAppBar(
        // Provide the bar controller in build method or default controller as ancestor in a tree 
        controller: bbc,
        expandedHeight: expandedHeight.value,
        horizontalMargin: 16,
        expandedBackColor: Theme.of(context).backgroundColor,
        // Your bottom sheet code here
        expandedBody: Center(
          child: Text("Hello world!"),
        ),
        // Your bottom app bar code here
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
      )
```

## Customization (Optional)

### BottomExpandableAppBar

**horizontalMargin** - distance of sheet's sides from edge<br/>
**bottomOffset** - distance of top sheet's edge from top appbar's edge in closed state<br/>
**shape** - notch shape for FAB<br/>
**appBarHeight** - if you need change app bar height<br/>

**bottomAppBarColor** - background color of appbar container<br/>
or
**appBarDecoration** - decoration of appbar container<br/>

**expandedBackColor** - background color of sheet container<br/>
or
**expandedDecoration** - decoration of sheet container<br/>

## Controls

### BottomAppBarController

#### Settings

**snap** - if true sheet will snap to opened and closed state<br/>
**dragLength** - distance that pointer should travel for fully open/close the sheet<br/>

#### Callbacks

*Should have dragLength defined*<br/>
**onDrag** - use that with GestureDetector for swipe control<br/>
**onDragEnd** - use that with GestureDetector for swipe control<br/>

**open** - switch the sheet to closed state<br/>
**close** - switch the sheet to opened state<br/>
**swap** - if sheet is opened closes the sheet and vice versa<br/>
