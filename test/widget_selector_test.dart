import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rx_widgets/src/widget_selector.dart';

void main() {
  testWidgets("ReactiveSelector - on true", (tester) async {
    StreamController<bool> _controller = StreamController<bool>();

    var widget = MaterialApp(
        home: WidgetSelector(
      stream: _controller.stream,
      onFalse: Text("FALSE"),
      onTrue: Text("TRUE"),
    ));

    _controller.add(true);
    await tester.pumpWidget(widget);
    await tester.pump(Duration.zero);

    final textFinder = find.text("TRUE");

    expect(textFinder, findsOneWidget);

    _controller.close();
  });

  testWidgets("ReactiveSelector - on false", (tester) async {
    StreamController<bool> _controller = StreamController<bool>();

    var widget = MaterialApp(
        home: WidgetSelector(
      stream: _controller.stream,
      onFalse: Text("FALSE"),
      onTrue: Text("TRUE"),
    ));

    _controller.add(false);
    await tester.pumpWidget(widget);
    await tester.pump(Duration.zero);

    final textFinder = find.text("FALSE");

    expect(textFinder, findsOneWidget);

    _controller.close();
  });

  testWidgets("ReactiveSelectorBuilder - on true", (tester) async {
    StreamController<bool> _controller = StreamController<bool>();

    var widget = MaterialApp(
        home: WidgetBuilderSelector(
      stream: _controller.stream,
      onTrue: (_) => Text("TRUE"),
      onFalse: (_) => Text("FALSE"),
    ));

    _controller.add(true);
    await tester.pumpWidget(widget);
    await tester.pump(Duration.zero);

    final textFinder = find.text("TRUE");

    expect(textFinder, findsOneWidget);

    _controller.close();
  });

  testWidgets("ReactiveSelectorBuilder - on false", (tester) async {
    StreamController<bool> _controller = StreamController<bool>();

    var widget = MaterialApp(
        home: WidgetBuilderSelector(
      stream: _controller.stream,
      onTrue: (_) => Text("TRUE"),
      onFalse: (_) => Text("FALSE"),
    ));

    _controller.add(false);
    await tester.pumpWidget(widget);
    await tester.pump(Duration.zero);

    final textFinder = find.text("FALSE");

    expect(textFinder, findsOneWidget);

    _controller.close();
  });
}
