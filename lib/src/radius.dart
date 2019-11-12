import 'package:abstract_dart/abstract_dart.dart';
import 'package:flutter/material.dart';

class RadiusField implements Field_<Radius> {
  const RadiusField();

  @override
  Group_<Radius> get addition => const RadiusSumGroup();

  @override
  Group_<Radius> get multiplication => const RadiusProductGroup();
}

class RadiusSumGroup extends RadiusSumMonoid implements Group_<Radius> {
  const RadiusSumGroup();

  @override
  Radius inverse(Radius a, Radius b) => a - b;
}

class RadiusProductGroup extends RadiusProductMonoid implements Group_<Radius> {
  const RadiusProductGroup();

  @override
  Radius inverse(Radius a, Radius b) => Radius.elliptical(a.x / b.x, a.y / b.y);
}

class RadiusSumMonoid implements Monoid_<Radius> {
  const RadiusSumMonoid();

  @override
  Radius identity() => Radius.zero;

  @override
  Radius operate(Radius a, Radius b) => a + b;
}

class RadiusProductMonoid implements Monoid_<Radius> {
  const RadiusProductMonoid();

  @override
  Radius identity() => const Radius.circular(1.0);

  @override
  Radius operate(Radius a, Radius b) => Radius.elliptical(a.x * b.x, a.y * b.y);
}

class RadiusScalarMonoid implements ScalarMonoid_<Radius, double> {
  const RadiusScalarMonoid();

  @override
  double sIdentity() => 1.0;

  @override
  Radius sOperate(Radius vector, double scalar) => vector * scalar;
}

class RadiusAlgebra implements Algebra_<Radius, double> {
  const RadiusAlgebra();

  @override
  Group_<Radius> get addition => const RadiusSumGroup();

  @override
  Group_<Radius> get multiplication => const RadiusProductGroup();

  @override
  ScalarMonoid_<Radius, double> get scalar => const RadiusScalarMonoid();
}
