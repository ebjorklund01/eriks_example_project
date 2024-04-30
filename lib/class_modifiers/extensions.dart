import 'classes.dart';

// Extension on Animal class to add new functionality
extension AnimalExtension on Animal {
  void describe() {
    print('$name is an animal living on our planet.');
  }

  static void displayAlternatePlanetCount() {
    Animal.displayPlanetCount();
  }
}

// Extension on List<Animal> to perform operations specific to lists of animals
extension AnimalListExtension on List<Animal> {
  void makeAllSounds() {
    for (var animal in this) {
      animal.makeSound('Unknown');
    }
  }

  void listAllNames() {
    for (var animal in this) {
      print(animal.name);
    }
  }
}

void main() {
  var dog = Dog('Buddy', 'Poodle');
  dog.describe(); // Using the extension on Animal

  var cat = Animal('Whiskers');
  cat.describe(); // Using the extension on Animal

  var animals = [dog, cat];
  animals.makeAllSounds(); // Buddy barks, Whiskers makes a sound
  animals.listAllNames(); // Buddy, Whiskers

  // Demonstrating static method from Animal class
  Animal
      .displayPlanetCount(); // Output: There are 1 planets where animals live.
  AnimalExtension
      .displayAlternatePlanetCount(); // Output: There are 1 planets where animals live.  
}
