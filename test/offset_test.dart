import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$OffsetField", () {
    test("addition", () {
      expect(OffsetField().addition, const OffsetSumGroup());
    });
    test("multiplication", () {
      expect(OffsetField().multiplication, const OffsetProductGroup());
    });
  });
  group("$OffsetSumGroup", () {
    test("inverse", () {
      expect(OffsetSumGroup().inverse(Offset(1.0, 3.0), Offset(7.0, 11.0)),
          Offset(-6.0, -8.0));
    });
  });
  group("$OffsetProductGroup", () {
    test("inverse", () {
      expect(OffsetProductGroup().inverse(Offset(9.0, 16), Offset(2.0, 8.0)),
          Offset(4.5, 2.0));
    });
  });
  group("$OffsetSumMonoid", () {
    test("identity", () {
      expect(OffsetSumMonoid().identity(), Offset.zero);
    });
    test("operate", () {
      expect(OffsetSumMonoid().operate(Offset(1.0, 3.0), Offset(7.0, 11.0)),
          Offset(8.0, 14.0));
    });
  });
  group("$OffsetProductMonoid", () {
    test("identity", () {
      expect(OffsetProductMonoid().identity(), Offset(1.0, 1.0));
    });
    test("operate", () {
      expect(OffsetProductMonoid().operate(Offset(2.0, 3.0), Offset(7.0, 11.0)),
          Offset(14.0, 33.0));
    });
  });
  group("$OffsetScalarMonoid", () {
    testScalarIdentity(OffsetScalarMonoid(), Offset(3.0, 2.0));
    testScalarMultiplication(
        OffsetScalarMonoid(), Offset(3.0, 5.0), 2.0, Offset(6.0, 10.0));
  });
  test("$OffsetAlgebra", () {
    expect(OffsetAlgebra().addition, const OffsetSumGroup());
    expect(OffsetAlgebra().multiplication, const OffsetProductGroup());
    expect(OffsetAlgebra().scalar, const OffsetScalarMonoid());
  });
}
