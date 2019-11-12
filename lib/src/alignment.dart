import 'package:abstract_dart/abstract_dart.dart';
import 'package:flutter/material.dart';

class AlignmentField implements Field_<Alignment> {
  const AlignmentField();

  @override
  Group_<Alignment> get addition => const AlignmentSumGroup();

  @override
  Group_<Alignment> get multiplication => const AlignmentProductGroup();
}

class AlignmentSumGroup extends AlignmentSumMonoid
    implements Group_<Alignment> {
  const AlignmentSumGroup();

  @override
  Alignment inverse(Alignment a, Alignment b) => a - b;
}

class AlignmentProductGroup extends AlignmentProductMonoid
    implements Group_<Alignment> {
  const AlignmentProductGroup();

  @override
  Alignment inverse(Alignment a1, Alignment a2) =>
      Alignment(a1.x / a2.x, a1.y / a2.y);
}

class AlignmentSumMonoid implements Monoid_<Alignment> {
  const AlignmentSumMonoid();

  @override
  Alignment identity() => const Alignment(0.0, 0.0);

  @override
  Alignment operate(Alignment a, Alignment b) => a + b;
}

class AlignmentProductMonoid implements Monoid_<Alignment> {
  const AlignmentProductMonoid();

  @override
  Alignment identity() => const Alignment(1.0, 1.0);

  @override
  Alignment operate(Alignment a1, Alignment a2) =>
      Alignment(a1.x * a2.x, a1.y * a2.y);
}

class AlignmentScalarMonoid implements ScalarMonoid_<Alignment, double> {
  const AlignmentScalarMonoid();

  @override
  double sIdentity() => 1.0;

  @override
  Alignment sOperate(Alignment vector, double scalar) => vector * scalar;
}

class AlignmentAlgebra implements Algebra_<Alignment, double> {
  const AlignmentAlgebra();

  @override
  Group_<Alignment> get addition => const AlignmentSumGroup();

  @override
  Group_<Alignment> get multiplication => const AlignmentProductGroup();

  @override
  ScalarMonoid_<Alignment, double> get scalar => const AlignmentScalarMonoid();
}
