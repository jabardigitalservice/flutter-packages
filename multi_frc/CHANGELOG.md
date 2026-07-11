## 0.0.3

- Add the `instance` static method to retrieve a specific `FirebaseRemoteConfig` instance.
- Configure remote config settings with a minimum fetch interval of zero.
- Fix `getArrayStream` to map to `FrcValueType.array` instead of `FrcValueType.json`.
- Remove the default `onConfigUpdated` listener from initialization as it does not work.
- Bump `firebase_core` dependency to `^4.11.0`.
- Bump `firebase_remote_config` dependency to `^6.5.3`.

## 0.0.2

- Update SDK env to ">=3.0.0 <4.0.0"
- Add getArray function

## 0.0.1

- Initial release.
