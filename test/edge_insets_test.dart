import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$EdgeInsetsField", () {
    test("addition", () {
      expect(EdgeInsetsField().addition, const EdgeInsetsSumGroup());
    });
    test("multiplication", () {
      expect(EdgeInsetsField().multiplication, const EdgeInsetsProductGroup());
    });
  });
  group("$EdgeInsetsSumGroup", () {
    test("inverse", () {
      expect(
        EdgeInsetsSumGroup().inverse(
            EdgeInsets.only(
              top: 1.0,
              bottom: 3.0,
              left: 7.0,
              right: 11.0,
            ),
            EdgeInsets.only(
              top: 1.0,
              bottom: 3.0,
              left: 7.0,
              right: 11.0,
            )),
        EdgeInsets.all(0.0),
      );
    });
  });
  group("$EdgeInsetsProductGroup", () {
    test("inverse", () {
      expect(
        EdgeInsetsProductGroup().inverse(
            EdgeInsets.only(
              top: 1.0,
              bottom: 3.0,
              left: 7.0,
              right: 11.0,
            ),
            EdgeInsets.only(
              top: 1.0,
              bottom: 3.0,
              left: 7.0,
              right: 11.0,
            )),
        EdgeInsets.all(1.0),
      );
    });
  });
  group("$EdgeInsetsSumMonoid", () {
    test("identity", () {
      expect(EdgeInsetsSumMonoid().identity(), EdgeInsets.all(0.0));
    });
    test("operate", () {
      expect(
        EdgeInsetsSumMonoid().operate(
            EdgeInsets.only(
              top: 1.0,
              bottom: 3.0,
              left: 7.0,
              right: 11.0,
            ),
            EdgeInsets.only(
              top: 1.0,
              bottom: 3.0,
              left: 7.0,
              right: 11.0,
            )),
        EdgeInsets.only(
          top: 2.0,
          bottom: 6.0,
          left: 14.0,
          right: 22.0,
        ),
      );
    });
  });
  group("$EdgeInsetsProductMonoid", () {
    test("identity", () {
      expect(EdgeInsetsProductMonoid().identity(), EdgeInsets.all(1.0));
    });
    test("operate", () {
      expect(
        EdgeInsetsProductMonoid().operate(
            EdgeInsets.only(
              top: 1.0,
              bottom: 3.0,
              left: 7.0,
              right: 11.0,
            ),
            EdgeInsets.only(
              top: 1.0,
              bottom: 3.0,
              left: 7.0,
              right: 11.0,
            )),
        EdgeInsets.only(
          top: 1.0 * 1.0,
          bottom: 3.0 * 3.0,
          left: 7.0 * 7.0,
          right: 11.0 * 11.0,
        ),
      );
    });
  });
  group("$EdgeInsetsScalarMonoid", () {
    testScalarIdentity(EdgeInsetsScalarMonoid(), EdgeInsets.only(
      top: 1.0,
      bottom: 3.0,
      left: 7.0,
      right: 11.0,
    ));
    testScalarMultiplication(
        EdgeInsetsScalarMonoid(), EdgeInsets.only(
      top: 1.0,
      bottom: 3.0,
      left: 7.0,
      right: 11.0,
    ), 2.0, EdgeInsets.only(
      top: 1.0,
      bottom: 3.0,
      left: 7.0,
      right: 11.0,
    ) * 2);
  });
  test("$EdgeInsetsAlgebra", () {
    expect(EdgeInsetsAlgebra().addition, const EdgeInsetsSumGroup());
    expect(EdgeInsetsAlgebra().multiplication, const EdgeInsetsProductGroup());
    expect(EdgeInsetsAlgebra().scalar, const EdgeInsetsScalarMonoid());
  });
}
