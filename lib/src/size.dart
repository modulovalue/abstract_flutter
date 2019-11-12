import 'package:abstract_dart/abstract_dart.dart';
import 'package:flutter/material.dart';

class SizeField implements Field_<Size> {
  const SizeField();

  @override
  Group_<Size> get addition => const SizeSumGroup();

  @override
  Group_<Size> get multiplication => const SizeProductGroup();
}

class SizeSumGroup extends SizeSumMonoid implements Group_<Size> {
  const SizeSumGroup();

  @override
  Size inverse(Size a, Size b) => Size(a.width - b.width, a.height - b.height);
}

class SizeProductGroup extends SizeProductMonoid implements Group_<Size> {
  const SizeProductGroup();

  @override
  Size inverse(Size a1, Size a2) =>
      Size(a1.width / a2.width, a1.height / a2.height);
}

class SizeSumMonoid implements Monoid_<Size> {
  const SizeSumMonoid();

  @override
  Size identity() => Size.zero;

  @override
  Size operate(Size a, Size b) => Size(a.width + b.width, a.height + b.height);
}

class SizeProductMonoid implements Monoid_<Size> {
  const SizeProductMonoid();

  @override
  Size identity() => const Size(1.0, 1.0);

  @override
  Size operate(Size a1, Size a2) =>
      Size(a1.width * a2.width, a1.height * a2.height);
}

class SizeScalarMonoid implements ScalarMonoid_<Size, double> {
  const SizeScalarMonoid();

  @override
  double sIdentity() => 1.0;

  @override
  Size sOperate(Size vector, double scalar) => vector * scalar;
}

class SizeAlgebra implements Algebra_<Size, double> {
  const SizeAlgebra();

  @override
  Group_<Size> get addition => const SizeSumGroup();

  @override
  Group_<Size> get multiplication => const SizeProductGroup();

  @override
  ScalarMonoid_<Size, double> get scalar => const SizeScalarMonoid();
}
