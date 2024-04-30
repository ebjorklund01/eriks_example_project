void main() {
  var name = 'Bob'; // Can only be set once

  // If statement
  if (name == 'Bob') {
    print('You are Bob');
  } else {
    print('You are not Bob');
  }

  // For loop
  for (var i = 0; i < 5; i++) {
    print(i);
  }

  var callbacks = [];
  for (var i = 0; i < 7; i++) {
    // Closures capture the value of i
    callbacks.add(() => print(i));
  }

  for (final c in callbacks) {
    c();
  }

  // While loop
  var i = 0;
  while (i < 5) {
    print(i);
    i++;
  }

  // Do-while loop
  i = 0;
  do {
    print(i);
    i++;
  } while (i < 5);

  // Switch statement
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      print('Closed');
      break;
    case 'PENDING':
      print('Pending');
      break;
    case 'APPROVED':
      print('Approved');
      break;
    case 'DENIED':
      print('Denied');
      break;
    case 'OPEN':
      print('Open');
      break;
    default:
      print('Unknown');
  }
}
