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

  factory StatusCode.fromCode(int code) {
    for (var status in StatusCode.values) {
      if (status.code == code) {
        return status;
      }
    }
    return StatusCode.internalServerError;
  }

  void describe() {
    print('Status $code: $description');
  }
}

void main() {
  // Using simple enum
  Season currentSeason = Season.summer;
  print('Current season is $currentSeason');

  // Using enhanced enum
  StatusCode status = StatusCode.internalServerError;
  status.describe(); // Prints: Status 500: Internal Server Error

  // Iterating over the StatusCode enum
  for (var status in StatusCode.values) {
    print('Code: ${status.code}, Description: ${status.description}');
  }

  // Using a factory constructor
  StatusCode notFound = StatusCode.fromCode(404);
}
