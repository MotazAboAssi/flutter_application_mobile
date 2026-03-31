String DisplayMessageFromException(String exception) {
  return exception.replaceFirst("Exception: ", "!! ");
}
