import 'package:isolates_isolateforprimenumberchecking/isolates_isolateforprimenumberchecking.dart';
import 'package:test/test.dart';

void main() {
  test('isPrimeInIsolate identifies prime numbers', () async {
    expect(await isPrimeInIsolate(7), isTrue);
    expect(await isPrimeInIsolate(11), isTrue);
  });

  test('isPrimeInIsolate identifies non-prime numbers', () async {
    expect(await isPrimeInIsolate(4), isFalse);
    expect(await isPrimeInIsolate(9), isFalse);
  });

  test('isPrimeInIsolate handles edge cases', () async {
    expect(await isPrimeInIsolate(1), isFalse);
    expect(await isPrimeInIsolate(2), isTrue);
  });
}
