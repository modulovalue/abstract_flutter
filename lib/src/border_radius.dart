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
        topStart: const RadiusProductGroup().operate(a.topStart, b.topStart),
        topEnd: const RadiusProductGroup().operate(a.topEnd, b.topEnd),
        bottomStart:
            const RadiusProductGroup().operate(a.bottomStart, b.bottomStart),
        bottomEnd: const RadiusProductGroup().operate(a.bottomEnd, b.bottomEnd),
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
