import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  group("$BorderRadiusDirectionalField", () {
    test("addition", () {
      expect(BorderRadiusDirectionalField().addition,
          const BorderRadiusDirectionalSumGroup());
    });
    test("addition", () {
      expect(BorderRadiusDirectionalField().multiplication,
          const BorderRadiusDirectionalProductGroup());
    });
  });
  group("$BorderRadiusDirectionalSumGroup", () {
    test("inverse", () {
      expect(
        BorderRadiusDirectionalSumGroup().inverse(
          BorderRadiusDirectional.only(
              topStart: Radius.elliptical(1.0, 3.0),
              topEnd: Radius.elliptical(7.0, 11.0),
              bottomStart: Radius.elliptical(13.0, 17.0),
              bottomEnd: Radius.elliptical(12.0, 23.0)),
          BorderRadiusDirectional.only(
              topStart: Radius.elliptical(1.0, 3.0),
              topEnd: Radius.elliptical(7.0, 11.0),
              bottomStart: Radius.elliptical(13.0, 17.0),
              bottomEnd: Radius.elliptical(12.0, 23.0)),
        ),
        BorderRadiusDirectional.only(
          topStart: Radius.elliptical(0.0, 0.0),
          topEnd: Radius.elliptical(0.0, 0.0),
          bottomStart: Radius.elliptical(0.0, 0.0),
          bottomEnd: Radius.elliptical(0.0, 0.0),
        ),
      );
    });
  });
  group("$BorderRadiusDirectionalProductGroup", () {
    test("inverse", () {
      expect(
        BorderRadiusDirectionalProductGroup().inverse(
          BorderRadiusDirectional.only(
              topStart: Radius.elliptical(1.0, 3.0),
              topEnd: Radius.elliptical(7.0, 11.0),
              bottomStart: Radius.elliptical(13.0, 17.0),
              bottomEnd: Radius.elliptical(12.0, 23.0)),
          BorderRadiusDirectional.only(
              topStart: Radius.elliptical(1.0, 3.0),
              topEnd: Radius.elliptical(7.0, 11.0),
              bottomStart: Radius.elliptical(13.0, 17.0),
              bottomEnd: Radius.elliptical(12.0, 23.0)),
        ),
        BorderRadiusDirectional.only(
          topStart: Radius.elliptical(1.0, 1.0),
          topEnd: Radius.elliptical(1.0, 1.0),
          bottomStart: Radius.elliptical(1.0, 1.0),
          bottomEnd: Radius.elliptical(1.0, 1.0),
        ),
      );
    });
  });
  group("$BorderRadiusDirectionalSumMonoid", () {
    test("identity", () {
      expect(BorderRadiusDirectionalSumMonoid().identity(),
          BorderRadiusDirectional.all(Radius.zero));
    });
    test("operate", () {
      expect(
        BorderRadiusDirectionalSumMonoid().operate(
          BorderRadiusDirectional.only(
              topStart: Radius.elliptical(1.0, 3.0),
              topEnd: Radius.elliptical(7.0, 11.0),
              bottomStart: Radius.elliptical(13.0, 17.0),
              bottomEnd: Radius.elliptical(12.0, 23.0)),
          BorderRadiusDirectional.only(
              topStart: Radius.elliptical(1.0, 3.0),
              topEnd: Radius.elliptical(7.0, 11.0),
              bottomStart: Radius.elliptical(13.0, 17.0),
              bottomEnd: Radius.elliptical(12.0, 23.0)),
        ),
        BorderRadiusDirectional.only(
          topStart: Radius.elliptical(2.0, 6.0),
          topEnd: Radius.elliptical(14.0, 22.0),
          bottomStart: Radius.elliptical(26.0, 34.0),
          bottomEnd: Radius.elliptical(24.0, 46.0),
        ),
      );
    });
  });
  group("$BorderRadiusDirectionalProductMonoid", () {
    test("identity", () {
      expect(BorderRadiusDirectionalProductMonoid().identity(),
          BorderRadiusDirectional.all(Radius.circular(1.0)));
    });
    test("operate", () {
      expect(
        BorderRadiusDirectionalProductMonoid().operate(
          BorderRadiusDirectional.only(
              topStart: Radius.elliptical(1.0, 3.0),
              topEnd: Radius.elliptical(7.0, 11.0),
              bottomStart: Radius.elliptical(13.0, 17.0),
              bottomEnd: Radius.elliptical(12.0, 23.0)),
          BorderRadiusDirectional.only(
              topStart: Radius.elliptical(1.0, 3.0),
              topEnd: Radius.elliptical(7.0, 11.0),
              bottomStart: Radius.elliptical(13.0, 17.0),
              bottomEnd: Radius.elliptical(12.0, 23.0)),
        ),
        BorderRadiusDirectional.only(
          topStart: Radius.elliptical(1.0 * 1.0, 3.0 * 3.0),
          topEnd: Radius.elliptical(7.0 * 7.0, 11.0 * 11.0),
          bottomStart: Radius.elliptical(13.0 * 13.0, 17.0 * 17.0),
          bottomEnd: Radius.elliptical(12.0 * 12.0, 23.0 * 23.0),
        ),
      );
    });
  });
  group("$BorderRadiusDirectionalScalarMonoid", () {
    testScalarIdentity(
      BorderRadiusDirectionalScalarMonoid(),
      BorderRadiusDirectional.only(
          topStart: Radius.elliptical(1.0, 3.0),
          topEnd: Radius.elliptical(7.0, 11.0),
          bottomStart: Radius.elliptical(13.0, 17.0),
          bottomEnd: Radius.elliptical(12.0, 23.0)),
    );
    testScalarMultiplication(
        BorderRadiusDirectionalScalarMonoid(),
        BorderRadiusDirectional.only(
            topStart: Radius.elliptical(1.0, 3.0),
            topEnd: Radius.elliptical(7.0, 11.0),
            bottomStart: Radius.elliptical(13.0, 17.0),
            bottomEnd: Radius.elliptical(12.0, 23.0)),
        2.0,
        BorderRadiusDirectional.only(
                topStart: Radius.elliptical(1.0, 3.0),
                topEnd: Radius.elliptical(7.0, 11.0),
                bottomStart: Radius.elliptical(13.0, 17.0),
                bottomEnd: Radius.elliptical(12.0, 23.0)) *
            2);
  });
  test("$AlignmentAlgebra", () {
    expect(BorderRadiusDirectionalAlgebra().addition,
        const BorderRadiusDirectionalSumGroup());
    expect(BorderRadiusDirectionalAlgebra().multiplication,
        const BorderRadiusDirectionalProductGroup());
    expect(BorderRadiusDirectionalAlgebra().scalar,
        const BorderRadiusDirectionalScalarMonoid());
  });
}
