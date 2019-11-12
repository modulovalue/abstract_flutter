import 'package:abstract_dart/abstract_dart.dart';
import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';

class BorderRadiusField implements Field_<BorderRadius> {
  const BorderRadiusField();

  @override
  Group_<BorderRadius> get addition => const BorderRadiusSumGroup();

  @override
  Group_<BorderRadius> get multiplication => const BorderRadiusProductGroup();
}

class BorderRadiusSumGroup extends BorderRadiusSumMonoid
    implements Group_<BorderRadius> {
  const BorderRadiusSumGroup();

  @override
  BorderRadius inverse(BorderRadius a, BorderRadius b) => a - b;
}

class BorderRadiusProductGroup extends BorderRadiusProductMonoid
    implements Group_<BorderRadius> {
  const BorderRadiusProductGroup();

  @override
  BorderRadius inverse(BorderRadius a1, BorderRadius a2) => BorderRadius.only(
        topLeft: const RadiusProductGroup().inverse(a1.topLeft, a2.topLeft),
        topRight: const RadiusProductGroup().inverse(a1.topRight, a2.topRight),
        bottomLeft:
            const RadiusProductGroup().inverse(a1.bottomLeft, a2.bottomLeft),
        bottomRight:
            const RadiusProductGroup().inverse(a1.bottomRight, a2.bottomRight),
      );
}

class BorderRadiusSumMonoid implements Monoid_<BorderRadius> {
  const BorderRadiusSumMonoid();

  @override
  BorderRadius identity() => const BorderRadius.all(Radius.zero);

  @override
  BorderRadius operate(BorderRadius a, BorderRadius b) => a + b;
}

class BorderRadiusProductMonoid implements Monoid_<BorderRadius> {
  const BorderRadiusProductMonoid();

  @override
  BorderRadius identity() =>
      const BorderRadius.all(Radius.elliptical(1.0, 1.0));

  @override
  BorderRadius operate(BorderRadius a1, BorderRadius a2) => BorderRadius.only(
        topLeft: const RadiusProductGroup().operate(a1.topLeft, a2.topLeft),
        topRight: const RadiusProductGroup().operate(a1.topRight, a2.topRight),
        bottomLeft:
            const RadiusProductGroup().operate(a1.bottomLeft, a2.bottomLeft),
        bottomRight:
            const RadiusProductGroup().operate(a1.bottomRight, a2.bottomRight),
      );
}

class BorderRadiusScalarMonoid implements ScalarMonoid_<BorderRadius, double> {
  const BorderRadiusScalarMonoid();

  @override
  double sIdentity() => 1.0;

  @override
  BorderRadius sOperate(BorderRadius vector, double scalar) => vector * scalar;
}

class BorderRadiusAlgebra implements Algebra_<BorderRadius, double> {
  const BorderRadiusAlgebra();

  @override
  Group_<BorderRadius> get addition => const BorderRadiusSumGroup();

  @override
  Group_<BorderRadius> get multiplication => const BorderRadiusProductGroup();

  @override
  ScalarMonoid_<BorderRadius, double> get scalar =>
      const BorderRadiusScalarMonoid();
}
