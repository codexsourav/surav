
# Surav Usage Guide

This guide provides an overview of how to use the `ApiRequest` class and the `SuravLocal` class for making HTTP requests and managing local data storage in a Flutter application using the Dio package.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
  - [Creating an ApiRequest](#creating-an-apirequest)
  - [Sending Requests](#sending-requests)
  - [Handling Responses](#handling-responses)
  - [Logging](#logging)
- [SuravLocal Class](#suravlocal-class)
  - [Setting Data](#setting-data)
  - [Getting Data](#getting-data)
  - [Clearing Data](#clearing-data)
- [Additional Functions](#additional-functions)
  - [packFormData](#packformdata)
  - [addFormFile](#addformfile)
  - [String Extensions](#string-extensions)
    - [capitalize](#capitalize)
    - [getFileName](#getfilename)
    - [getTruncatedFilenameWithDots](#gettruncatedfilenamewithdots)
    - [getFileExtension](#getfileextension)
    - [formatDate](#formatdate)
    - [lastCharacters](#lastcharacters)
    - [firstCharacters](#firstcharacters)
  - [Numeric Extensions](#numeric-extensions)
    - [toMinutes](#tominutes)
  - [Validation Extensions](#validation-extensions)
    - [isValidEmail](#isvalidemail)
    - [isValidPhoneNumber](#isvalidphonenumber)
  - [BuildContext Extensions](#buildcontext-extensions)
    - [windowWidth](#windowwidth)
    - [windowHeight](#windowheight)

## Installation

To use the `ApiRequest` and `SuravLocal` classes, you need to include the following dependencies in your `pubspec.yaml` file:

```yaml
dependencies:
  surav: ^1.0.0
  flutter:
    sdk: flutter
```

Run `flutter pub get` to install the dependencies.

## Usage

### Creating an ApiRequest

To create an instance of the `ApiRequest` class, you need to provide the URL and optional parameters such as method, body, options, and others.

```dart
ApiRequest request = ApiRequest(
  'https://example.com/api/endpoint',
  method: ApiMethod.POST,
  body: {'key': 'value'},
  showLogs: true, // Set to false to disable logging
);
```

### Sending Requests

To send a request, use the `send` method. This method returns a `Future<Response>`.

```dart
Response response = await request.send();
```

### Handling Responses

The `send` method returns a Dio `Response` object. You can handle the response as needed:

```dart
if (response.statusCode == 200) {
  // Handle success
  print(response.data);
} else {
  // Handle error
  print('Request failed with status: ${response.statusCode}');
}
```

### Logging

Logging is handled by the `Logger` package. The logging behavior depends on the request method and whether logging is enabled.

- **GET** requests: Informational logs
- **POST** and **DELETE** requests: Warning logs
- Other methods: Fatal logs

Logs include stack traces for better debugging.

## SuravLocal Class

The `SuravLocal` class provides methods for managing local data storage using the `shared_preferences` package.

### Setting Data

To set a value in local storage, use one of the following methods:

```dart
await SuravLocal.setString('key', 'value');
await SuravLocal.setBool('key', true);
await SuravLocal.setInt('key', 123);
await SuravLocal.setDouble('key', 123.45);
await SuravLocal.setStringList('key', ['value1', 'value2']);
```

### Getting Data

To retrieve a value from local storage, use one of the following methods:

```dart
String? stringValue = await SuravLocal.getString('key');
bool? boolValue = await SuravLocal.getBool('key');
int? intValue = await SuravLocal.getInt('key');
double? doubleValue = await SuravLocal.getDouble('key');
List<String>? stringListValue = await SuravLocal.getStringList('key');
```

### Clearing Data

To remove a specific value or clear all data from local storage, use the following methods:

```dart
await SuravLocal.remove('key');
await SuravLocal.clear();
```

## Additional Functions

### packFormData

The `packFormData` function helps in packing data into a `FormData` object for multipart/form-data requests.

```dart
FormData formData = packFormData({
  'name': 'John Doe',
  'file': await addFormFile('/path/to/file'),
});
```

### addFormFile

The `addFormFile` function helps in adding a file to the `FormData`.

```dart
MultipartFile file = await addFormFile('/path/to/file', filename: 'file.txt');
```



### String Extensions

#### capitalize

Capitalizes the first letter of each word in a string.

```dart
String text = "hello world".capitalize();
// Output: "Hello World"
```

#### getFileName

Extracts the file name from a file path.

```dart
String fileName = "/path/to/file.txt".getFileName();
// Output: "file.txt"
```

#### getTruncatedFilenameWithDots

Truncates a file name to a maximum length of 22 characters, adding ".." if truncated.

```dart
String truncatedFileName = "/path/to/very_long_file_name.txt".getTruncatedFilenameWithDots();
// Output: "very_long_file_na..txt"
```

#### getFileExtension

Extracts the file extension from a file path.

```dart
String fileExtension = "/path/to/file.txt".getFileExtension();
// Output: "txt"
```

#### formatDate

Formats a date string in "YYYY-MM-DDTHH:MM:SS" format to "DD Mon YYYY".

```dart
String formattedDate = "2023-12-25T00:00:00".formatDate();
// Output: "25 Dec 2023"
```

#### lastCharacters

Gets the last `n` characters of a string.

```dart
String lastChars = "hello world".lastCharacters(5);
// Output: "world"
```

#### firstCharacters

Gets the first `n` characters of a string, followed by "...".

```dart
String firstChars = "hello world".firstCharacters(5);
// Output: "hello..."
```

### Numeric Extensions

#### toMinutes

Converts seconds to minutes, rounded to 3 decimal places.

```dart
double minutes = 120.toMinutes();
// Output: 2.000
```

### Validation Extensions

#### isValidEmail

Validates if a string is a valid email format.

```dart
bool isEmail = "example@example.com".isValidEmail();
// Output: true
```

#### isValidPhoneNumber

Validates if a string is a valid phone number format.

```dart
bool isPhoneNumber = "+1-123-456-7890".isValidPhoneNumber();
// Output: true
```

### BuildContext Extensions

#### windowWidth

Gets the width of the window.

```dart
double width = context.windowWidth;
```

#### windowHeight

Gets the height of the window.

```dart
double height = context.windowHeight;
```
