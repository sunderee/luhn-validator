library luhn_validator;

class LuhnValidator {
  static bool validate(String? input) {
    if (input == null || input.length < 2) {
      return false;
    }

    return _compute(input) % 10 == 0;
  }

  static int _compute(String input) {
    bool shouldDouble = false;
    int sum = 0;
    for (int i = input.length - 1; i >= 0; i--) {
      final digit = input.codeUnitAt(i) - 48;
      if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $i must be a number');
      }

      if (shouldDouble) {
        final doubleDigit = digit * 2;
        if (doubleDigit > 9) {
          sum += doubleDigit - 9;
        } else {
          sum += doubleDigit;
        }
      } else {
        sum += digit;
      }

      shouldDouble = !shouldDouble;
    }

    return sum;
  }

  const LuhnValidator._();
}
