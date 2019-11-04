import 'package:abstract_dart/abstract_dart.dart';
import 'package:flutter/material.dart';

class OffsetField implements Field_<Offset> {
  const OffsetField();

  @override
  Group_<Offset> get addition => const OffsetSumGroup();

  @override
  Group_<Offset> get multiplication => const OffsetProductGroup();
}

class OffsetSumGroup extends OffsetSumMonoid implements Group_<Offset> {
  const OffsetSumGroup();

  @override
  Offset inverse(Offset a, Offset b) => a - b;
}

class OffsetProductGroup extends OffsetProductMonoid implements Group_<Offset> {
  const OffsetProductGroup();

  @override
  Offset inverse(Offset a1, Offset a2) => Offset(a1.dx / a2.dx, a1.dy / a2.dy);
}

class OffsetSumMonoid implements Monoid_<Offset> {
  const OffsetSumMonoid();

  @override
  Offset identity() => Offset.zero;

  @override
  Offset operate(Offset a, Offset b) => a + b;
}

class OffsetProductMonoid implements Monoid_<Offset> {
  const OffsetProductMonoid();

  @override
  Offset identity() => const Offset(1.0, 1.0);

  @override
  Offset operate(Offset a1, Offset a2) => Offset(a1.dx * a2.dx, a1.dy * a2.dy);
}
