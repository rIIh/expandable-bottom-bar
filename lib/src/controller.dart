import 'package:flutter/material.dart';

/// A listenable controller for use with [BottomExpandableBar]
class BottomBarController extends ChangeNotifier {
  /// Set to true if sheet should snap to Opened and Closed state
  final bool snap;

  double? _dragLength;

  /// Distance that pointer should travel for fully open or close the sheet
  double? get dragLength => _dragLength;

  set dragLength(double? value) {
    if (_dragLength == value) return;
    assert(value == null || value > 0);
    _dragLength = value;
  }

  /// Creates a [BottomBarController] with the given [vsync] ticker provider
  BottomBarController({
    required TickerProvider vsync,
    this.snap = true,
    double? dragLength,
  })  : _animationController = AnimationController(vsync: vsync),
        _dragLength = dragLength {
    _animationController.addStatusListener((_) => notifyListeners());
  }

  @Deprecated("This is deprecated in favor of `state`, and will be removed in the future")
  Animation<double> get animation => _animationController.view;

  /// Returns the [view] of the internal [AnimationController],
  /// which cannot mutate the state of the [AnimationController]
  Animation<double> get state => _animationController.view;

  final AnimationController _animationController;

  /// Updates the internal [AnimationController] with the
  /// [DragUpdateDetails] of a [GestureDragUpdateCallback]
  void onDrag(DragUpdateDetails details) {
    if (dragLength == null) return;
    _animationController.value -= (details.primaryDelta ?? 0) / (dragLength!);
  }

  /// Updates the animation according to the [DragEndDetails]
  /// details of a [GestureDragEndCallback]
  void onDragEnd(DragEndDetails details) {
    if (dragLength == null) return;
    double minFlingVelocity = 365.0;

    // Let the current animation finish before starting a new one
    if (_animationController.isAnimating) return;

    // Check if the velocity is sufficient to constitute fling
    if (details.velocity.pixelsPerSecond.dy.abs() >= minFlingVelocity) {
      double visualVelocity = -details.velocity.pixelsPerSecond.dy / (dragLength!);

      if (snap) {
        _animationController.fling(velocity: visualVelocity);
      } else {
        // actual scroll physics will be implemented in a future release
        _animationController.animateTo(
          _animationController.value + visualVelocity * 0.16,
          duration: Duration(milliseconds: 410),
          curve: Curves.decelerate,
        );
      }
      return;
    }

    // Check if the controller is already halfway there
    if (snap) {
      if (_animationController.value > 0.5)
        open();
      else
        close();
    }
  }

  /// Closes the panel
  void close({double velocity = 1.0}) {
    _animationController.fling(velocity: -velocity.abs());
  }

  /// Opens the panel if it's currently closed,
  /// or closes the panel if it's currently open
  void swap({double velocity = 1.0}) {
    if (isOpen) {
      close(velocity: velocity);
    } else if (isClosed) {
      open(velocity: velocity);
    }
  }

  /// Opens the panel
  void open({double velocity = 1.0}) {
    _animationController.fling(velocity: velocity.abs());
  }

  /// Whether the panel is fully opened
  bool get isOpen => _animationController.status == AnimationStatus.completed;

  /// Whether the panel is fully closed
  bool get isClosed => _animationController.status == AnimationStatus.dismissed;

  /// Whether the panel is being opened
  bool get isOpening => _animationController.status == AnimationStatus.forward;

  /// Whether the panel is being closed
  bool get isClosing => _animationController.status == AnimationStatus.reverse;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

/// A widget that provides a default bottom bar controller
/// to its children
class DefaultBottomBarController extends StatefulWidget {
  /// The child of the [DefaultBottomBarController] widget
  final Widget child;

  /// Creates a default [BottomBarController] for the given [child] widget
  DefaultBottomBarController({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// Returns the nearest [BottomBarController] of the
  /// given [BuildContext]
  static BottomBarController of(BuildContext context) {
    final _BottomBarControllerScope? scope = context.findAncestorWidgetOfExactType<_BottomBarControllerScope>();
    if (scope != null) {
      return scope.controller;
    } else {
      throw StateError(
        'Unable to find BottomBarController in tree. Ensure you added BottomBarController in widget tree.',
      );
    }
  }

  @override
  _DefaultBottomBarControllerState createState() => _DefaultBottomBarControllerState();
}

class _DefaultBottomBarControllerState extends State<DefaultBottomBarController> with SingleTickerProviderStateMixin {
  late BottomBarController _controller;

  @override
  void initState() {
    _controller = BottomBarController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BottomBarControllerScope(
      controller: _controller,
      enabled: TickerMode.of(context),
      child: widget.child,
    );
  }
}

class _BottomBarControllerScope extends InheritedWidget {
  const _BottomBarControllerScope({
    Key? key,
    this.enabled = true,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  final BottomBarController controller;
  final bool enabled;

  @override
  bool updateShouldNotify(_BottomBarControllerScope old) {
    return enabled != old.enabled || controller != old.controller;
  }
}
