void printYallow(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printGreen(String text) {
  print('\x1B[32m$text\x1B[0m');
}

void printRed(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void printWhite(String text) {
  print('\x1B[37m$text\x1B[0m');
}

void printBlueWithBold(String text) {
  print('\x1B[1m$text\x1B[0m');
}

void printBlueWithItalic(String text) {
  print('\x1B[3m$text\x1B[0m');
}

void printBlueWithUnderLine(String text) {
  print('\x1B[4m$text\x1B[0m');
}

void printGrey(String text) {
  print('\x1B[30m$text\x1B[0m');
}
