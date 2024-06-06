enum LogColors {
  reset('\x1B[0m'),
  red('\x1B[31m'),
  green('\x1B[32m '),
  yellow('\x1B[33m'),
  blue('\x1B[34m'),
  magenta('\x1B[35m');

  final String value;
  const LogColors(this.value);
}