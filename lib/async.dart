import 'dart:async';

// Example of using a Future
Future<String> fetchUserData({int seconds = 3}) {
  return Future<String>.delayed(Duration(seconds: seconds), () {
    return "User data loaded";
  });
}

// Example of async function using await
Future<void> displayUserData() async {
  print("Fetching user data...");
  String userData = await fetchUserData();
  print("Data received: $userData");
}

// Example of handling errors in async code
Future<void> displayUserDataWithErrorHandling() async {
  try {
    String userData = await fetchUserData();
    print("Data received with error handling: $userData");
  } catch (e) {
    print("An error occurred: $e");
  }
}

void main() async {
  displayUserData();
  displayUserDataWithErrorHandling();
  fetchUserData(seconds: 4)
      .then((value) => print("Data received 4 secs: $value"));
  var future = fetchUserData(seconds: 2);
  var value = await future;
  print("Data received 2 secs: $value");
}
