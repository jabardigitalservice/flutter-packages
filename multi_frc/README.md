## multi_frc

Use remote config from multiple firebase projects with ease.

## Getting started

Add your app to firebase project, check this [link](https://pub.dev/packages/firebase_core) for guide.
On Android, it should work out of the box.

>iOS: increase your app deployment target to 13.0

## Usage

1. You can use `MultiFrc.init()` to initialized multiple firebase projects at once:

>Note: If you already initialized your projects using flutterfire or other methods, then you don't need to add those projects to this init function.

```dart
await MultiFrc.init(
    [
      // Firebase Project #1
      MultiFrcOption(
        android: MultiFrc.option(
          apiKey: apiKey,
          appId: appId,
          messagingSenderId: messagingSenderId,
          projectId: projectId,
          storageBucket: storageBucket,
        ),
        ios: MultiFrc.option(
           apiKey: apiKey,
          appId: appId,
          messagingSenderId: messagingSenderId,
          projectId: projectId,
          storageBucket: storageBucket,
          iosBundleId: iosBundleId,
        ),
        web: null, // not tested, use at your own risk
      ),
      // Firebase Project #2
      MultiFrcOption(...)
    ],
  );
```

2. You can get the value as-is or as stream. example:

```dart
String get greeting => MultiFrc.getString('greeting');
Stream<String> greetingStream = MultiFrc.getStringAsStream('greeting');

num get count => MultiFrc.getNumber('count');
Stream<num> countStream = MultiFrc.getNumberAsStream('count');

bool get isShow => MultiFrc.getBool('is_show');
Stream<bool> isShowStream = MultiFrc.getBoolAsStream('is_show');

Map<String, dynamic> get myObj => MultiFrc.getJson('my_obj');
Stream<Map<String, dynamic>> myObjStream = MultiFrc.getJsonAsStream('my_obj');
```

3. You can remove stream using `removeStream(key)`, example:

```dart
final key = 'my_key';
final myObjStream = MultiFrc.getJsonAsStream(key);

MultiFrc.removeStream(key);
```

## Additional information

Contributions of any kind are welcome. Feel free to improve the library by creating a pull request or opening an issue.

## Version
```dart
Flutter 3.27.4';
```
