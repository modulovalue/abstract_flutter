import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$AlignmentField", () {
    test("addition", () {
      expect(AlignmentField().addition, const AlignmentSumGroup());
    });
    test("addition", () {
      expect(AlignmentField().multiplication, const AlignmentProductGroup());
    });
  });
  group("$AlignmentField", () {
    test("inverse", () {
      expect(
          AlignmentSumGroup()
              .inverse(Alignment(12.0, 9.0), Alignment(3.0, 2.0)),
          Alignment(9.0, 7.0));
    });
  });
  group("$AlignmentProductGroup", () {
    test("inverse", () {
      expect(
          AlignmentProductGroup()
              .inverse(Alignment(12.0, 9.0), Alignment(3.0, 2.0)),
          Alignment(4.0, 4.5));
    });
  });
  group("$AlignmentSumMonoid", () {
    test("identity", () {
      expect(AlignmentSumMonoid().identity(), Alignment(0.0, 0.0));
    });
    test("operate", () {
      expect(
          AlignmentSumMonoid()
              .operate(Alignment(12.0, 9.0), Alignment(3.0, 2.0)),
          Alignment(15.0, 11.0));
    });
  });
  group("$AlignmentProductMonoid", () {
    test("identity", () {
      expect(AlignmentProductMonoid().identity(), Alignment(1.0, 1.0));
    });
    test("operate", () {
      expect(
          AlignmentProductMonoid()
              .operate(Alignment(12.0, 9.0), Alignment(3.0, 2.0)),
          Alignment(36.0, 18.0));
    });
  });
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
}
