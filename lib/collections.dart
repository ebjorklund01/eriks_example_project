// Dart Collections - List, Set, Map

import 'dart:math';

void main() {
  // List example
  final fruits = ['apple', 'banana', 'cherry'];
  fruits.add('mango'); // Adding an item
  // inferred type List<String>
  // Adding a non-string value will result in a compile-time error
  print('List of fruits: $fruits');

  // Accessing elements
  final firstFruit = fruits[0]; // String
  print('First fruit: $firstFruit');

  final nonGrowableFruits = List.from(fruits, growable: false); // List<String>
  print('Non-growable list of fruits: $nonGrowableFruits');

  final mixedTypes = [1, 'two', 3.0];
  // inferred type List<Object>
  print('Mixed types: $mixedTypes');

  // Set example
  final numbers = {
    1,
    2,
    3,
    4,
  }; // Duplicates are ignored
  // inferred type Set<int>
  numbers.add(3); // Ignored
  numbers.add(5); // Adding an item
  print('Set of numbers: $numbers');

  // Checking for a specific item
  bool containsThree = numbers.contains(3);
  print('Contains 3: $containsThree');

  final mixedSet = {1, 'two', 3.0};

  // Map example
  Map<String, int> phoneBook = {
    'Alice': 12345,
    'Bob': 67890,
  };
  phoneBook['Charlie'] = 13579; // Adding a new key-value pair
  print('Phone book: $phoneBook');

  // Accessing values
  int? aliceNumber = phoneBook['Alice'];
  print('Alice\'s number: $aliceNumber');

  // Mixed types
  final mixedMap = {
    'one': 1,
    2: 'two',
    3.0: 'three',
  };
  print('Mixed types: $mixedMap');

  // Iterating over a map
  phoneBook.forEach((key, value) {
    print('Key: $key, Value: $value');
  });

  final randomInt = Random().nextInt(10);

  final dynamicList = [
    1,
    2,
    if (randomInt > 5) 3,
    4,
    5,
  ];
  print('Dynamic list: $dynamicList');

  final dynamicSet = {
    1,
    2,
    if (randomInt > 5) 3,
    4,
    5,
  };
  print('Dynamic set: $dynamicSet');

  final dynamicMap = {
    'one': 1,
    'two': 2,
    if (randomInt > 5) 'three': 3,
    'four': 4,
    'five': 5,
  };
  print('Dynamic map: $dynamicMap');
}
