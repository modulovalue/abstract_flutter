import 'package:abstract_dart/abstract_dart.dart';
import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';

class BorderRadiusDirectionalField implements Field_<BorderRadiusDirectional> {
  const BorderRadiusDirectionalField();

  @override
  Group_<BorderRadiusDirectional> get addition =>
      const BorderRadiusDirectionalSumGroup();

  @override
  Group_<BorderRadiusDirectional> get multiplication =>
      const BorderRadiusDirectionalProductGroup();
}

class BorderRadiusDirectionalSumGroup extends BorderRadiusDirectionalSumMonoid
    implements Group_<BorderRadiusDirectional> {
  const BorderRadiusDirectionalSumGroup();

  @override
  BorderRadiusDirectional inverse(
          BorderRadiusDirectional a, BorderRadiusDirectional b) =>
      a - b;
}

class BorderRadiusDirectionalProductGroup
    extends BorderRadiusDirectionalProductMonoid
    implements Group_<BorderRadiusDirectional> {
  const BorderRadiusDirectionalProductGroup();

  @override
  BorderRadiusDirectional inverse(
          BorderRadiusDirectional a1, BorderRadiusDirectional a2) =>
      BorderRadiusDirectional.only(
        topStart: const RadiusProductGroup().inverse(a1.topStart, a2.topStart),
        topEnd: const RadiusProductGroup().inverse(a1.topEnd, a2.topEnd),
        bottomStart:
            const RadiusProductGroup().inverse(a1.bottomStart, a2.bottomStart),
        bottomEnd:
            const RadiusProductGroup().inverse(a1.bottomEnd, a2.bottomEnd),
      );
}

class BorderRadiusDirectionalSumMonoid
    implements Monoid_<BorderRadiusDirectional> {
  const BorderRadiusDirectionalSumMonoid();

  @override
  BorderRadiusDirectional identity() =>
      const BorderRadiusDirectional.all(Radius.zero);

  @override
  BorderRadiusDirectional operate(
          BorderRadiusDirectional a, BorderRadiusDirectional b) =>
      BorderRadiusDirectional.only(
        topStart: const RadiusSumGroup().operate(a.topStart, b.topStart),
        topEnd: const RadiusSumGroup().operate(a.topEnd, b.topEnd),
        bottomStart:
            const RadiusSumGroup().operate(a.bottomStart, b.bottomStart),
        bottomEnd: const RadiusSumGroup().operate(a.bottomEnd, b.bottomEnd),
      );
}

class BorderRadiusDirectionalProductMonoid
    implements Monoid_<BorderRadiusDirectional> {
  const BorderRadiusDirectionalProductMonoid();

  @override
  BorderRadiusDirectional identity() =>
      const BorderRadiusDirectional.all(Radius.elliptical(1.0, 1.0));

  @override
  BorderRadiusDirectional operate(
          BorderRadiusDirectional a1, BorderRadiusDirectional a2) =>
      BorderRadiusDirectional.only(
        topStart: const RadiusProductGroup().operate(a1.topStart, a2.topStart),
        topEnd: const RadiusProductGroup().operate(a1.topEnd, a2.topEnd),
        bottomStart:
            const RadiusProductGroup().operate(a1.bottomStart, a2.bottomStart),
        bottomEnd:
            const RadiusProductGroup().operate(a1.bottomEnd, a2.bottomEnd),
      );
}

class BorderRadiusDirectionalScalarMonoid
    implements ScalarMonoid_<BorderRadiusDirectional, double> {
  const BorderRadiusDirectionalScalarMonoid();

  @override
  double sIdentity() => 1.0;

  @override
  BorderRadiusDirectional sOperate(
          BorderRadiusDirectional vector, double scalar) =>
      vector * scalar;
}

class BorderRadiusDirectionalAlgebra
    implements Algebra_<BorderRadiusDirectional, double> {
  const BorderRadiusDirectionalAlgebra();

  @override
  Group_<BorderRadiusDirectional> get addition =>
      const BorderRadiusDirectionalSumGroup();

  @override
  Group_<BorderRadiusDirectional> get multiplication =>
      const BorderRadiusDirectionalProductGroup();

  @override
  ScalarMonoid_<BorderRadiusDirectional, double> get scalar =>
      const BorderRadiusDirectionalScalarMonoid();
}
