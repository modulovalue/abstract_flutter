import 'package:abstract_flutter/abstract_flutter.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

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
}
