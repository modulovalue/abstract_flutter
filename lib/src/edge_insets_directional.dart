import 'package:abstract_dart/abstract_dart.dart';
import 'package:flutter/material.dart';

class EdgeInsetsDirectionalField implements Field_<EdgeInsetsDirectional> {
  const EdgeInsetsDirectionalField();

  @override
  Group_<EdgeInsetsDirectional> get addition =>
      const EdgeInsetsDirectionalSumGroup();

  @override
  Group_<EdgeInsetsDirectional> get multiplication =>
      const EdgeInsetsDirectionalProductGroup();
}

class EdgeInsetsDirectionalSumGroup extends EdgeInsetsDirectionalSumMonoid
    implements Group_<EdgeInsetsDirectional> {
  const EdgeInsetsDirectionalSumGroup();

  @override
  EdgeInsetsDirectional inverse(
          EdgeInsetsDirectional a, EdgeInsetsDirectional b) =>
      a - b;
}

class EdgeInsetsDirectionalProductGroup
    extends EdgeInsetsDirectionalProductMonoid
    implements Group_<EdgeInsetsDirectional> {
  const EdgeInsetsDirectionalProductGroup();

  @override
  EdgeInsetsDirectional inverse(
          EdgeInsetsDirectional a1, EdgeInsetsDirectional a2) =>
      EdgeInsetsDirectional.only(
        top: a1.top / a2.top,
        bottom: a1.bottom / a2.bottom,
        start: a1.start / a2.start,
        end: a1.end / a2.end,
      );
}

class EdgeInsetsDirectionalSumMonoid implements Monoid_<EdgeInsetsDirectional> {
  const EdgeInsetsDirectionalSumMonoid();

  @override
  EdgeInsetsDirectional identity() => EdgeInsetsDirectional.zero;

  @override
  EdgeInsetsDirectional operate(
          EdgeInsetsDirectional a, EdgeInsetsDirectional b) =>
      a + b;
}

class EdgeInsetsDirectionalProductMonoid
    implements Monoid_<EdgeInsetsDirectional> {
  const EdgeInsetsDirectionalProductMonoid();

  @override
  EdgeInsetsDirectional identity() =>
      const EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0);

  @override
  EdgeInsetsDirectional operate(
          EdgeInsetsDirectional a1, EdgeInsetsDirectional a2) =>
      EdgeInsetsDirectional.only(
        top: a1.top * a2.top,
        bottom: a1.bottom * a2.bottom,
        start: a1.start * a2.start,
        end: a1.end * a2.end,
      );
}

class EdgeInsetsDirectionalScalarMonoid
    implements ScalarMonoid_<EdgeInsetsDirectional, double> {
  const EdgeInsetsDirectionalScalarMonoid();

  @override
  double sIdentity() => 1.0;

  @override
  EdgeInsetsDirectional sOperate(EdgeInsetsDirectional vector, double scalar) =>
      vector * scalar;
}

class EdgeInsetsDirectionalAlgebra
    implements Algebra_<EdgeInsetsDirectional, double> {
  const EdgeInsetsDirectionalAlgebra();

  @override
  Group_<EdgeInsetsDirectional> get addition =>
      const EdgeInsetsDirectionalSumGroup();

  @override
  Group_<EdgeInsetsDirectional> get multiplication =>
      const EdgeInsetsDirectionalProductGroup();

  @override
  ScalarMonoid_<EdgeInsetsDirectional, double> get scalar =>
      const EdgeInsetsDirectionalScalarMonoid();
}
