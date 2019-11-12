import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$VelocityField", () {
    test("addition", () {
      expect(VelocityField().addition, const VelocitySumGroup());
    });
    test("multiplication", () {
      expect(VelocityField().multiplication, const VelocityProductGroup());
    });
  });
  group("$VelocitySumGroup", () {
    test("inverse", () {
      expect(
          VelocitySumGroup().inverse(
              Velocity(pixelsPerSecond: Offset(1.0, 3.0)),
              Velocity(pixelsPerSecond: Offset(7.0, 11.0))),
          Velocity(pixelsPerSecond: Offset(-6.0, -8.0)));
    });
  });
  group("$VelocityProductGroup", () {
    test("inverse", () {
      expect(
          VelocityProductGroup().inverse(
              Velocity(pixelsPerSecond: Offset(9.0, 16)),
              Velocity(pixelsPerSecond: Offset(2.0, 8.0))),
          Velocity(pixelsPerSecond: Offset(4.5, 2.0)));
    });
  });
  group("$VelocitySumMonoid", () {
    test("identity", () {
      expect(VelocitySumMonoid().identity(), Velocity.zero);
    });
    test("operate", () {
      expect(
          VelocitySumMonoid().operate(
              Velocity(pixelsPerSecond: Offset(1.0, 3.0)),
              Velocity(pixelsPerSecond: Offset(7.0, 11.0))),
          Velocity(pixelsPerSecond: Offset(8.0, 14.0)));
    });
  });
  group("$VelocityProductMonoid", () {
    test("identity", () {
      expect(VelocityProductMonoid().identity(),
          Velocity(pixelsPerSecond: Offset(1.0, 1.0)));
    });
    test("operate", () {
      expect(
          VelocityProductMonoid().operate(
              Velocity(pixelsPerSecond: Offset(2.0, 3.0)),
              Velocity(pixelsPerSecond: Offset(7.0, 11.0))),
          Velocity(pixelsPerSecond: Offset(14.0, 33.0)));
    });
  });
  group("$VelocityScalarMonoid", () {
    testScalarIdentity(VelocityScalarMonoid(), Velocity(pixelsPerSecond: Offset(3.0, 2.0)));
    testScalarMultiplication(
        VelocityScalarMonoid(), Velocity(pixelsPerSecond: Offset(3.0, 5.0)), 2.0, Velocity(pixelsPerSecond: Offset(6.0, 10.0)));
  });
  test("$VelocityAlgebra", () {
    expect(VelocityAlgebra().addition, const VelocitySumGroup());
    expect(VelocityAlgebra().multiplication, const VelocityProductGroup());
    expect(VelocityAlgebra().scalar, const VelocityScalarMonoid());
  });
}
