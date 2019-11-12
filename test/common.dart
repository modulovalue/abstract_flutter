import 'package:abstract_dart/abstract_dart.dart';
import 'package:flutter_test/flutter_test.dart';

void testScalarIdentity<K, F>(ScalarMonoid_<K, F> scalarMonoid_, K element) {
  test("scalar identity", () {
    expect(scalarMonoid_.sOperate(element, scalarMonoid_.sIdentity()), element);
  });
}

void testScalarMultiplication<K, F>(
    ScalarMonoid_<K, F> scalarMonoid_, K elementA, F scalar, F result) {
  test("scalar multiplication", () {
    expect(scalarMonoid_.sOperate(elementA, scalar), result);
  });
}
