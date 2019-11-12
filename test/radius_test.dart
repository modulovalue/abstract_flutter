import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$RadiusField", () {
    test("addition", () {
      expect(RadiusField().addition, const RadiusSumGroup());
    });
    test("multiplication", () {
      expect(RadiusField().multiplication, const RadiusProductGroup());
    });
  });
  group("$RadiusSumGroup", () {
    test("inverse", () {
      expect(
          RadiusSumGroup().inverse(
              Radius.elliptical(3.0, 5.0), Radius.elliptical(7.0, 11.0)),
          Radius.elliptical(-4.0, -6.0));
    });
  });
  group("$RadiusProductGroup", () {
    test("inverse", () {
      expect(
          RadiusProductGroup()
              .inverse(Radius.elliptical(6.0, 18), Radius.elliptical(2.0, 9.0)),
          Radius.elliptical(3.0, 2.0));
    });
  });
  group("$RadiusSumMonoid", () {
    test("identity", () {
      expect(RadiusSumMonoid().identity(), Radius.zero);
    });
    test("operate", () {
      expect(
        RadiusSumMonoid().operate(
            Radius.elliptical(3.0, 5.0), Radius.elliptical(11.0, 13.0)),
        Radius.elliptical(14.0, 18.0),
      );
    });
  });
  group("$RadiusProductMonoid", () {
    test("identity", () {
      expect(RadiusProductMonoid().identity(), Radius.elliptical(1.0, 1.0));
    });
    test("operate", () {
      expect(
        RadiusProductMonoid().operate(
            Radius.elliptical(3.0, 5.0), Radius.elliptical(11.0, 13.0)),
        Radius.elliptical(33.0, 65.0),
      );
    });
  });
  group("$RadiusScalarMonoid", () {
    testScalarIdentity(RadiusScalarMonoid(), Radius.elliptical(3.0, 2.0));
    testScalarMultiplication(
        RadiusScalarMonoid(), Radius.elliptical(3.0, 5.0), 2.0, Radius.elliptical(6.0, 10.0));
  });
  test("$RadiusAlgebra", () {
    expect(RadiusAlgebra().addition, const RadiusSumGroup());
    expect(RadiusAlgebra().multiplication, const RadiusProductGroup());
    expect(RadiusAlgebra().scalar, const RadiusScalarMonoid());
  });
}
