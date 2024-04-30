// Dart Variables, Type Safety, Static Analysis, Null Safety, Final and Const

void main() {
  // Example of type inference
  var name = 'Alice'; // `var` infers the `String` type
  print('Name: $name');

  // Example of explicit type declaration
  int age = 30;
  print('Age: $age');

  // Example of final and const
  final city = 'New York'; // Final variable - initialized at runtime
  const double PI = 3.14159; // Const variable - initialized at compile-time
  print('City: $city');
  print('PI: $PI');

  // Example of null safety
  String? nullableString;
  print('Nullable String: $nullableString'); // Outputs: Nullable String: null

  // Attempting to use a null value where a non-null is expected
  // Uncomment the line below to see static analysis in action
  // String nonNullableString = nullableString; // This will cause a compile-time error

  // Using null safety features
  String nonNullableString = nullableString ?? 'Default String';
  print('Non-Nullable String: $nonNullableString'); // Outputs: Non-Nullable String: Default String

  // Example of static analysis
  // Uncomment the line below to see static analysis preventing a type mismatch
  // int number = 'This is not a number'; // This will cause a compile-time error

  // Demonstrating type safety with lists
  List<String> names = ['Alice', 'Bob', 'Charlie'];
  // Uncomment the line below to see static analysis in action
  // names.add(5); // This will cause a compile-time error because 5 is not a String

  print('Names: $names');
}
