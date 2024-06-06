/// Enum representing various colors for log messages.
enum LogColors {
  /// Resets the text color to the default.
  reset('\x1B[0m'),

  /// Sets the text color to red.
  red('\x1B[31m'),

  /// Sets the text color to green.
  green('\x1B[32m '),

  /// Sets the text color to yellow.
  yellow('\x1B[33m'),

  /// Sets the text color to blue.
  blue('\x1B[34m'),

  /// Sets the text color to magenta.
  magenta('\x1B[35m');

  /// The escape sequence for the color.
  final String value;

  /// Constructs a LogColors enum member with the provided escape sequence.
  const LogColors(this.value);
}