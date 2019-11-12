import 'package:abstract_dart/abstract_dart.dart';
import 'package:flutter/material.dart';

class EdgeInsetsField implements Field_<EdgeInsets> {
  const EdgeInsetsField();

  @override
  Group_<EdgeInsets> get addition => const EdgeInsetsSumGroup();

  @override
  Group_<EdgeInsets> get multiplication => const EdgeInsetsProductGroup();
}

class EdgeInsetsSumGroup extends EdgeInsetsSumMonoid
    implements Group_<EdgeInsets> {
  const EdgeInsetsSumGroup();

  @override
  EdgeInsets inverse(EdgeInsets a, EdgeInsets b) => a - b;
}

class EdgeInsetsProductGroup extends EdgeInsetsProductMonoid
    implements Group_<EdgeInsets> {
  const EdgeInsetsProductGroup();

  @override
  EdgeInsets inverse(EdgeInsets a1, EdgeInsets a2) => EdgeInsets.only(
        top: a1.top / a2.top,
        bottom: a1.bottom / a2.bottom,
        left: a1.left / a2.left,
        right: a1.right / a2.right,
      );
}

class EdgeInsetsSumMonoid implements Monoid_<EdgeInsets> {
  const EdgeInsetsSumMonoid();

  @override
  EdgeInsets identity() => const EdgeInsets.all(0.0);

  @override
  EdgeInsets operate(EdgeInsets a, EdgeInsets b) => a + b;
}

class EdgeInsetsProductMonoid implements Monoid_<EdgeInsets> {
  const EdgeInsetsProductMonoid();

  @override
  EdgeInsets identity() => const EdgeInsets.all(1.0);

  @override
  EdgeInsets operate(EdgeInsets a1, EdgeInsets a2) => EdgeInsets.only(
        top: a1.top * a2.top,
        bottom: a1.bottom * a2.bottom,
        left: a1.left * a2.left,
        right: a1.right * a2.right,
      );
}

class EdgeInsetsScalarMonoid implements ScalarMonoid_<EdgeInsets, double> {
  const EdgeInsetsScalarMonoid();

  @override
  double sIdentity() => 1.0;

  @override
  EdgeInsets sOperate(EdgeInsets vector, double scalar) => vector * scalar;
}

class EdgeInsetsAlgebra implements Algebra_<EdgeInsets, double> {
  const EdgeInsetsAlgebra();

  @override
  Group_<EdgeInsets> get addition => const EdgeInsetsSumGroup();

  @override
  Group_<EdgeInsets> get multiplication => const EdgeInsetsProductGroup();

  @override
  ScalarMonoid_<EdgeInsets, double> get scalar =>
      const EdgeInsetsScalarMonoid();
}
