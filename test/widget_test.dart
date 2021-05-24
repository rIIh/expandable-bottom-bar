import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TickerProviderMock extends Mock implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback? onTick) => super.noSuchMethod(
        Invocation.method(
          #createTicker,
          [onTick],
        ),
        returnValue: Ticker((_) {}),
      );
}

void main() {
  late TickerProviderMock tickerProviderMock;

  setUp(() {
    tickerProviderMock = TickerProviderMock();
  });

  test('Creates successfully', () {
    when(tickerProviderMock.createTicker(any)).thenReturn(Ticker((_) {}));
    BottomExpandableAppBar();
    BottomBarController(vsync: tickerProviderMock);
  });
}
