import 'package:abstract_dart/abstract_dart.dart';
import 'package:abstract_flutter/src/offset.dart';
import 'package:flutter/material.dart';

class VelocityField implements Field_<Velocity> {
  const VelocityField();

  @override
  Group_<Velocity> get addition => const VelocitySumGroup();

  @override
  Group_<Velocity> get multiplication => const VelocityProductGroup();
}

class VelocitySumGroup extends VelocitySumMonoid implements Group_<Velocity> {
  const VelocitySumGroup();

  @override
  Velocity inverse(Velocity a, Velocity b) => a - b;
}

class VelocityProductGroup extends VelocityProductMonoid
    implements Group_<Velocity> {
  const VelocityProductGroup();

  @override
  Velocity inverse(Velocity a, Velocity b) => Velocity(
      pixelsPerSecond: const OffsetProductGroup()
          .inverse(a.pixelsPerSecond, b.pixelsPerSecond));
}

class VelocitySumMonoid implements Monoid_<Velocity> {
  const VelocitySumMonoid();

  @override
  Velocity identity() => Velocity.zero;

  @override
  Velocity operate(Velocity a, Velocity b) => a + b;
}

class VelocityProductMonoid implements Monoid_<Velocity> {
  const VelocityProductMonoid();

  @override
  Velocity identity() => const Velocity(pixelsPerSecond: Offset(1.0, 1.0));

  @override
  Velocity operate(Velocity a, Velocity b) => Velocity(
      pixelsPerSecond: const OffsetProductMonoid()
          .operate(a.pixelsPerSecond, b.pixelsPerSecond));
}
