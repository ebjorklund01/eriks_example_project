// This Dart file demonstrates basic error handling techniques.

void main() {
  try {
    // Code that might throw an exception
    int result = 100 ~/ 0;
    print("The result is $result");
  } on UnsupportedError {
    // Handle specific exception
    print("Cannot divide by zero.");
  } catch (e) {
    // Handle any other exceptions that might occur
    print("An error occurred: $e");
  } finally {
    // Code that should run regardless of the exception
    print("The try-catch is completed.");
  }
}
