import 'package:luhn_validator/luhn_validator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final validLuhnNumbers = ['49927398716', '1234567812345670'];
  final invalidLuhnNumbers = ['49927398717', '1234567812345678'];

  test('should verify numbers pass Luhn', () {
    expect(
      validLuhnNumbers.every((element) => LuhnValidator.validate(element)),
      true,
    );
  });

  test('should verify numbers do not pass Luhn', () {
    expect(
      invalidLuhnNumbers
          .map((element) => LuhnValidator.validate(element))
          .every((element) => element == false),
      true,
    );
  });
}
