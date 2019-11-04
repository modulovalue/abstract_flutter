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
