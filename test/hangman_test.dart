import 'dart:io';

@Timeout(const Duration(seconds: 15))
import 'package:test/test.dart';

const path = 'hangman.dart';

@TestOn('vm')
void main() {
  var inputs = ["c", "co", "cc", "c o", "coco", "co co", "abcdef", " "];
  inputs.forEach((input) => {
        test('Should survive : ${input}', () async {
          final process = await Process.start('dart', ['$path', input]);
          for (var i = 0; i < input.length; i++) {
            process.stdin.writeln(input[i]);
          }
          ;
          expect(await process.exitCode, equals(0));
        }, timeout: Timeout(Duration(seconds: 2)))
      });

  test('Should be hanged', () async {
    final process = await Process.start('dart', ['$path', 'cat']);
    for (var i = 0; i < 8; i++) {
      process.stdin.writeln('x');
    }
    ;
    expect(await process.exitCode, isNot(0));
  }, timeout: Timeout(Duration(seconds: 2)));
}
