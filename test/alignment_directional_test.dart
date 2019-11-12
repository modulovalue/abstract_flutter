import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$AlignmentDirectionalField", () {
    test("addition", () {
      expect(AlignmentDirectionalField().addition,
          const AlignmentDirectionalSumGroup());
    });
    test("addition", () {
      expect(AlignmentDirectionalField().multiplication,
          const AlignmentDirectionalProductGroup());
    });
  });
  group("$AlignmentDirectionalSumGroup", () {
    test("inverse", () {
      expect(
          AlignmentDirectionalSumGroup().inverse(
              AlignmentDirectional(12.0, 9.0), AlignmentDirectional(3.0, 2.0)),
          AlignmentDirectional(9.0, 7.0));
    });
  });
  group("$AlignmentDirectionalProductGroup", () {
    test("inverse", () {
      expect(
          AlignmentDirectionalProductGroup().inverse(
              AlignmentDirectional(12.0, 9.0), AlignmentDirectional(3.0, 2.0)),
          AlignmentDirectional(4.0, 4.5));
    });
  });
  group("$AlignmentDirectionalSumMonoid", () {
    test("identity", () {
      expect(AlignmentDirectionalSumMonoid().identity(),
          AlignmentDirectional(0.0, 0.0));
    });
    test("operate", () {
      expect(
          AlignmentDirectionalSumMonoid().operate(
              AlignmentDirectional(12.0, 9.0), AlignmentDirectional(3.0, 2.0)),
          AlignmentDirectional(15.0, 11.0));
    });
  });
  group("$AlignmentDirectionalProductMonoid", () {
    test("identity", () {
      expect(AlignmentDirectionalProductMonoid().identity(),
          AlignmentDirectional(1.0, 1.0));
    });
    test("operate", () {
      expect(
          AlignmentDirectionalProductMonoid().operate(
              AlignmentDirectional(12.0, 9.0), AlignmentDirectional(3.0, 2.0)),
          AlignmentDirectional(36.0, 18.0));
    });
  });
  group("$AlignmentDirectionalScalarMonoid", () {
    testScalarIdentity(
        AlignmentDirectionalScalarMonoid(), AlignmentDirectional(3.0, 2.0));
    testScalarMultiplication(AlignmentDirectionalScalarMonoid(),
        AlignmentDirectional(3.0, 5.0), 2.0, AlignmentDirectional(6.0, 10.0));
  });
  test("$AlignmentAlgebra", () {
    expect(AlignmentDirectionalAlgebra().addition,
        const AlignmentDirectionalSumGroup());
    expect(AlignmentDirectionalAlgebra().multiplication,
        const AlignmentDirectionalProductGroup());
    expect(AlignmentDirectionalAlgebra().scalar,
        const AlignmentDirectionalScalarMonoid());
  });
}
