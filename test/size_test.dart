import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$SizeField", () {
    test("addition", () {
      expect(SizeField().addition, const SizeSumGroup());
    });
    test("multiplication", () {
      expect(SizeField().multiplication, const SizeProductGroup());
    });
  });
  group("$SizeSumGroup", () {
    test("inverse", () {
      expect(SizeSumGroup().inverse(Size(1.0, 3.0), Size(7.0, 11.0)),
          Size(-6.0, -8.0));
    });
  });
  group("$SizeProductGroup", () {
    test("inverse", () {
      expect(SizeProductGroup().inverse(Size(9.0, 16), Size(2.0, 8.0)),
          Size(4.5, 2.0));
    });
  });
  group("$SizeSumMonoid", () {
    test("identity", () {
      expect(SizeSumMonoid().identity(), Size.zero);
    });
    test("operate", () {
      expect(SizeSumMonoid().operate(Size(1.0, 3.0), Size(7.0, 11.0)),
          Size(8.0, 14.0));
    });
  });
  group("$SizeProductMonoid", () {
    test("identity", () {
      expect(SizeProductMonoid().identity(), Size(1.0, 1.0));
    });
    test("operate", () {
      expect(SizeProductMonoid().operate(Size(2.0, 3.0), Size(7.0, 11.0)),
          Size(14.0, 33.0));
    });
  });
}
