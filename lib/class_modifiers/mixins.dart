// Mixin to add walk functionality
mixin Walkable {
  void walk() {
    print("Walking");
  }
}

// Mixin to add fly functionality
mixin Flyable {
  void fly() {
    print("Flying");
  }
}

// Base class
class Animal {
  void eat() {
    print("Eating");
  }
}

// Extending a class with mixins
class Bird extends Animal with Walkable, Flyable {
  void chirp() {
    print("Chirping");
  }
}

class Cat extends Animal with Walkable {
  void meow() {
    print("Meowing");
  }
}

void main() {
  Bird bird = Bird();
  bird.eat(); // From Animal
  bird.walk(); // From Walkable
  bird.fly(); // From Flyable
  bird.chirp(); // From Bird

  Cat cat = Cat();
  cat.eat(); // From Animal
  cat.walk(); // From Walkable
  cat.meow(); // From Cat
}
