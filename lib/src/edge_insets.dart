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
