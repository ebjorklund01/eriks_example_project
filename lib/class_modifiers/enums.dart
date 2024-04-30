// Simple Enum
enum Season { spring, summer, autumn, winter }

// Enhanced Enum
enum StatusCode {
  success(200, "OK"),
  notFound(404, "Not Found"),
  internalServerError(500, "Internal Server Error");

  final int code;
  final String description;

  const StatusCode(this.code, this.description);

  void describe() {
    print('Status $code: $description');
  }
}

void main() {
  // Using simple enum
  Season currentSeason = Season.summer;
  print('Current season is $currentSeason');

  // Using enhanced enum
  StatusCode status = StatusCode.notFound;
  status.describe(); // Prints: Status 404: Not Found

  // Iterating over the StatusCode enum
  for (var status in StatusCode.values) {
    print('Code: ${status.code}, Description: ${status.description}');
  }
}
