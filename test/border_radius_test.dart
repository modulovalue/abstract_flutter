import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$BorderRadiusField", () {
    test("addition", () {
      expect(BorderRadiusField().addition, const BorderRadiusSumGroup());
    });
    test("addition", () {
      expect(
          BorderRadiusField().multiplication, const BorderRadiusProductGroup());
    });
  });
  group("$BorderRadiusSumGroup", () {
    test("inverse", () {
      expect(
        BorderRadiusSumGroup().inverse(
          BorderRadius.only(
              topLeft: Radius.elliptical(1.0, 3.0),
              topRight: Radius.elliptical(7.0, 11.0),
              bottomLeft: Radius.elliptical(13.0, 17.0),
              bottomRight: Radius.elliptical(12.0, 23.0)),
          BorderRadius.only(
              topLeft: Radius.elliptical(1.0, 3.0),
              topRight: Radius.elliptical(7.0, 11.0),
              bottomLeft: Radius.elliptical(13.0, 17.0),
              bottomRight: Radius.elliptical(12.0, 23.0)),
        ),
        BorderRadius.only(
          topLeft: Radius.elliptical(0.0, 0.0),
          topRight: Radius.elliptical(0.0, 0.0),
          bottomLeft: Radius.elliptical(0.0, 0.0),
          bottomRight: Radius.elliptical(0.0, 0.0),
        ),
      );
    });
  });
  group("$BorderRadiusProductGroup", () {
    test("inverse", () {
      expect(
        BorderRadiusProductGroup().inverse(
          BorderRadius.only(
              topLeft: Radius.elliptical(1.0, 3.0),
              topRight: Radius.elliptical(7.0, 11.0),
              bottomLeft: Radius.elliptical(13.0, 17.0),
              bottomRight: Radius.elliptical(12.0, 23.0)),
          BorderRadius.only(
              topLeft: Radius.elliptical(1.0, 3.0),
              topRight: Radius.elliptical(7.0, 11.0),
              bottomLeft: Radius.elliptical(13.0, 17.0),
              bottomRight: Radius.elliptical(12.0, 23.0)),
        ),
        BorderRadius.only(
          topLeft: Radius.elliptical(1.0, 1.0),
          topRight: Radius.elliptical(1.0, 1.0),
          bottomLeft: Radius.elliptical(1.0, 1.0),
          bottomRight: Radius.elliptical(1.0, 1.0),
        ),
      );
    });
  });
  group("$BorderRadiusSumMonoid", () {
    test("identity", () {
      expect(BorderRadiusSumMonoid().identity(), BorderRadius.all(Radius.zero));
    });
    test("operate", () {
      expect(
        BorderRadiusSumMonoid().operate(
          BorderRadius.only(
              topLeft: Radius.elliptical(1.0, 3.0),
              topRight: Radius.elliptical(7.0, 11.0),
              bottomLeft: Radius.elliptical(13.0, 17.0),
              bottomRight: Radius.elliptical(12.0, 23.0)),
          BorderRadius.only(
              topLeft: Radius.elliptical(1.0, 3.0),
              topRight: Radius.elliptical(7.0, 11.0),
              bottomLeft: Radius.elliptical(13.0, 17.0),
              bottomRight: Radius.elliptical(12.0, 23.0)),
        ),
        BorderRadius.only(
          topLeft: Radius.elliptical(2.0, 6.0),
          topRight: Radius.elliptical(14.0, 22.0),
          bottomLeft: Radius.elliptical(26.0, 34.0),
          bottomRight: Radius.elliptical(24.0, 46.0),
        ),
      );
    });
  });
  group("$BorderRadiusProductMonoid", () {
    test("identity", () {
      expect(BorderRadiusProductMonoid().identity(),
          BorderRadius.all(Radius.circular(1.0)));
    });
    test("operate", () {
      expect(
        BorderRadiusProductMonoid().operate(
          BorderRadius.only(
              topLeft: Radius.elliptical(1.0, 3.0),
              topRight: Radius.elliptical(7.0, 11.0),
              bottomLeft: Radius.elliptical(13.0, 17.0),
              bottomRight: Radius.elliptical(12.0, 23.0)),
          BorderRadius.only(
              topLeft: Radius.elliptical(1.0, 3.0),
              topRight: Radius.elliptical(7.0, 11.0),
              bottomLeft: Radius.elliptical(13.0, 17.0),
              bottomRight: Radius.elliptical(12.0, 23.0)),
        ),
        BorderRadius.only(
          topLeft: Radius.elliptical(1.0 * 1.0, 3.0 * 3.0),
          topRight: Radius.elliptical(7.0 * 7.0, 11.0 * 11.0),
          bottomLeft: Radius.elliptical(13.0 * 13.0, 17.0 * 17.0),
          bottomRight: Radius.elliptical(12.0 * 12.0, 23.0 * 23.0),
        ),
      );
    });
  });
  group("$BorderRadiusScalarMonoid", () {
    testScalarIdentity(BorderRadiusScalarMonoid(), BorderRadius.only(
        topLeft: Radius.elliptical(1.0, 3.0),
        topRight: Radius.elliptical(7.0, 11.0),
        bottomLeft: Radius.elliptical(13.0, 17.0),
        bottomRight: Radius.elliptical(12.0, 23.0)));
    testScalarMultiplication(
        BorderRadiusScalarMonoid(), BorderRadius.only(
        topLeft: Radius.elliptical(1.0, 3.0),
        topRight: Radius.elliptical(7.0, 11.0),
        bottomLeft: Radius.elliptical(13.0, 17.0),
        bottomRight: Radius.elliptical(12.0, 23.0)), 2.0, BorderRadius.only(
        topLeft: Radius.elliptical(1.0, 3.0),
        topRight: Radius.elliptical(7.0, 11.0),
        bottomLeft: Radius.elliptical(13.0, 17.0),
        bottomRight: Radius.elliptical(12.0, 23.0)) * 2);
  });
  test("$BorderRadiusAlgebra", () {
    expect(BorderRadiusAlgebra().addition, const BorderRadiusSumGroup());
    expect(
        BorderRadiusAlgebra().multiplication, const BorderRadiusProductGroup());
    expect(BorderRadiusAlgebra().scalar, const BorderRadiusScalarMonoid());
  });
}
