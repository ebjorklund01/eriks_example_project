// Define a sealed class 'Shape'
sealed class Shape {
  // Add common properties or methods here if needed
  double get area;
}

// Define classes that extend the sealed class
class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double get area => 3.14159 * radius * radius;
}

class Square extends Shape {
  final double side;

  Square(this.side);

  @override
  double get area => side * side;
}

// Function that takes a Shape and performs different actions based on its type
void printArea(Shape shape) {
  switch (shape) {
    case Circle c:
      print('Area of Circle with radius ${c.radius}: ${c.area}');
      break;
    case Square s:
      print('Area of Square with side ${s.side}: ${s.area}');
      break;
    // No need for a default case as all subclasses are covered
  }
}

// Example usage
void main() {
  final circle = Circle(5);
  final square = Square(10);

  printArea(circle);
  printArea(square);
}