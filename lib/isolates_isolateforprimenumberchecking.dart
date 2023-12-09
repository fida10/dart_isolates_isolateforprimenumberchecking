/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:async';
import 'dart:isolate';

export 'src/isolates_isolateforprimenumberchecking_base.dart';

/*
Practice Question 1: Isolate for Prime Number Checking

Task:

Create a function isPrimeInIsolate that takes an integer and 
checks if it is a prime number in a separate isolate. 
The function should return a Future<bool> indicating whether the number is prime.
 */

Future<dynamic> isPrimeInIsolate(int input) async {
  final receivePort = ReceivePort();
  final completer = Completer();

  final isolateForPrime =
      await Isolate.spawn(_isPrime, [receivePort.sendPort, input]);

  completer.complete(await receivePort.first);
  receivePort.close();
  isolateForPrime.kill();

  return completer.future;
}

_isPrime(List<Object> input) {
  final numberToCheck = input[1] as int;
  bool isPrime = true;
  if (numberToCheck == 1) {
    isPrime = false;
  } else {
    for (var i = 2; i < (numberToCheck ~/ 2) + 1; i++) {
      if (numberToCheck % i == 0) {
        isPrime = false;
        break;
      }
    }
  }

  Isolate.exit(input[0] as SendPort, isPrime);
}
