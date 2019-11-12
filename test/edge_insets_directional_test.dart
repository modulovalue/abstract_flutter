import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$EdgeInsetsDirectionalField", () {
    test("addition", () {
      expect(EdgeInsetsDirectionalField().addition,
          const EdgeInsetsDirectionalSumGroup());
    });
    test("multiplication", () {
      expect(EdgeInsetsDirectionalField().multiplication,
          const EdgeInsetsDirectionalProductGroup());
    });
  });
  group("$EdgeInsetsDirectionalSumGroup", () {
    test("inverse", () {
      expect(
        EdgeInsetsDirectionalSumGroup().inverse(
            EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            ),
            EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            )),
        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
      );
    });
  });
  group("$EdgeInsetsDirectionalProductGroup", () {
    test("inverse", () {
      expect(
        EdgeInsetsDirectionalProductGroup().inverse(
            EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            ),
            EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            )),
        EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0),
      );
    });
  });
  group("$EdgeInsetsDirectionalSumMonoid", () {
    test("identity", () {
      expect(EdgeInsetsDirectionalSumMonoid().identity(),
          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0));
    });
    test("operate", () {
      expect(
        EdgeInsetsDirectionalSumMonoid().operate(
            EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            ),
            EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            )),
        EdgeInsetsDirectional.only(
          top: 2.0,
          bottom: 6.0,
          start: 14.0,
          end: 22.0,
        ),
      );
    });
  });
  group("$EdgeInsetsDirectionalProductMonoid", () {
    test("identity", () {
      expect(EdgeInsetsDirectionalProductMonoid().identity(),
          EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0));
    });
    test("operate", () {
      expect(
        EdgeInsetsDirectionalProductMonoid().operate(
            EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            ),
            EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            )),
        EdgeInsetsDirectional.only(
          top: 1.0 * 1.0,
          bottom: 3.0 * 3.0,
          start: 7.0 * 7.0,
          end: 11.0 * 11.0,
        ),
      );
    });
  });
  group("$EdgeInsetsDirectionalScalarMonoid", () {
    testScalarIdentity(
        EdgeInsetsDirectionalScalarMonoid(),
        EdgeInsetsDirectional.only(
          top: 1.0,
          bottom: 3.0,
          start: 7.0,
          end: 11.0,
        ));
    testScalarMultiplication(
        EdgeInsetsDirectionalScalarMonoid(),
        EdgeInsetsDirectional.only(
          top: 1.0,
          bottom: 3.0,
          start: 7.0,
          end: 11.0,
        ),
        2.0,
        EdgeInsetsDirectional.only(
              top: 1.0,
              bottom: 3.0,
              start: 7.0,
              end: 11.0,
            ) *
            2);
  });
  test("$EdgeInsetsDirectionalAlgebra", () {
    expect(EdgeInsetsDirectionalAlgebra().addition,
        const EdgeInsetsDirectionalSumGroup());
    expect(EdgeInsetsDirectionalAlgebra().multiplication,
        const EdgeInsetsDirectionalProductGroup());
    expect(EdgeInsetsDirectionalAlgebra().scalar,
        const EdgeInsetsDirectionalScalarMonoid());
  });
}
