import 'package:abstract_dart/abstract_dart.dart';
import 'package:flutter/material.dart';

class AlignmentDirectionalField implements Field_<AlignmentDirectional> {
  const AlignmentDirectionalField();

  @override
  Group_<AlignmentDirectional> get addition =>
      const AlignmentDirectionalSumGroup();

  @override
  Group_<AlignmentDirectional> get multiplication =>
      const AlignmentDirectionalProductGroup();
}

class AlignmentDirectionalSumGroup extends AlignmentDirectionalSumMonoid
    implements Group_<AlignmentDirectional> {
  const AlignmentDirectionalSumGroup();

  @override
  AlignmentDirectional inverse(
          AlignmentDirectional a, AlignmentDirectional b) =>
      AlignmentDirectional(a.start - b.start, a.y - b.y);
}

class AlignmentDirectionalProductGroup extends AlignmentDirectionalProductMonoid
    implements Group_<AlignmentDirectional> {
  const AlignmentDirectionalProductGroup();

  @override
  AlignmentDirectional inverse(
          AlignmentDirectional a1, AlignmentDirectional a2) =>
      AlignmentDirectional(a1.start / a2.start, a1.y / a2.y);
}

class AlignmentDirectionalSumMonoid implements Monoid_<AlignmentDirectional> {
  const AlignmentDirectionalSumMonoid();

  @override
  AlignmentDirectional identity() => const AlignmentDirectional(0.0, 0.0);

  @override
  AlignmentDirectional operate(
          AlignmentDirectional a, AlignmentDirectional b) =>
      AlignmentDirectional(a.start + b.start, a.y + b.y);
}

class AlignmentDirectionalProductMonoid
    implements Monoid_<AlignmentDirectional> {
  const AlignmentDirectionalProductMonoid();

  @override
  AlignmentDirectional identity() => const AlignmentDirectional(1.0, 1.0);

  @override
  AlignmentDirectional operate(
          AlignmentDirectional a1, AlignmentDirectional a2) =>
      AlignmentDirectional(a1.start * a2.start, a1.y * a2.y);
}

class AlignmentDirectionalScalarMonoid
    implements ScalarMonoid_<AlignmentDirectional, double> {
  const AlignmentDirectionalScalarMonoid();

  @override
  double sIdentity() => 1.0;

  @override
  AlignmentDirectional sOperate(AlignmentDirectional vector, double scalar) =>
      vector * scalar;
}

class AlignmentDirectionalAlgebra
    implements Algebra_<AlignmentDirectional, double> {
  const AlignmentDirectionalAlgebra();

  @override
  Group_<AlignmentDirectional> get addition =>
      const AlignmentDirectionalSumGroup();

  @override
  Group_<AlignmentDirectional> get multiplication =>
      const AlignmentDirectionalProductGroup();

  @override
  ScalarMonoid_<AlignmentDirectional, double> get scalar =>
      const AlignmentDirectionalScalarMonoid();
}
