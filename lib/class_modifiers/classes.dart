// abstract classes are used to define a common interface for a set of classes
abstract class LifeForm {
  final String name;

  LifeForm(this.name);

  void exist();
}

// Define a base class Animal that implements the abstract class LifeForm
class Animal extends LifeForm {
  static const int planetCount = 1; // A constant, common for all instances

  // Default constructor
  Animal(super.name);

  // Named constructor
  Animal.int({required int num}) : super(num.toString());

  Animal.defaultNamed({String name = 'Unknown'}) : super(name);

  // Example method
  void makeSound(String name) {
    print('${this.name} makes a sound');
  }

  // Static method
  static void displayPlanetCount() {
    print('There are $planetCount planets where animals live.');
  }

  @override
  void exist() {
    print('$name exists');
  }
}

// Define a subclass Dog that inherits from Animal
class Dog extends Animal {
  String _breed; // An additional property

  String get dogBreed => _breed;
  set dogBreed(String breed) => this._breed = breed; 

  // Default constructor, calling the super class constructor
  Dog(super.name, this._breed);

  // Named constructor with different implementation
  // Dog.named({required String name, required this.breed}) : super.named(name: name);

  // Overriding a method
  @override
  void makeSound(String name) {
    print('$name barks');
  }

  // Example of a factory constructor
  factory Dog.fromBreed(String breed) {
    return Dog('Unknown', breed);
  }
}

void main() {
  var myDog = Dog('Rex', 'Golden Retriever');
  myDog.makeSound('Rex'); // Output: Rex barks

  var unknownDog = Dog.fromBreed('Labrador');
  print(unknownDog.name); // Output: Unknown
  print(unknownDog._breed); // Output: Labrador

  Animal
      .displayPlanetCount(); // Static method call, Output: There are 1 planets where animals live.
}
