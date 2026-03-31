import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenableBuilder2<A, B> extends StatelessWidget {
  const ValueListenableBuilder2({
    super.key,
    required this.first,
    this.second,
    required this.builder,
    required this.builder2,
    this.child,
  });

  final ValueListenable<A> first;
  final ValueListenable<B>? second;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder2;
  final Widget Function(BuildContext context, A a, Widget? child) builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: first,
    builder: (_, a, __) {
      return second == null
          ? builder(context, a, child)
          : ValueListenableBuilder(
              valueListenable: second!,
              builder: (context, b, __) {
                return builder2(context, a, b, child);
              },
            );
    },
  );
}
