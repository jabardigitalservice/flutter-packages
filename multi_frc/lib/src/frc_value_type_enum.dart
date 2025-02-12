enum FrcValueType {
  string(''),
  number('0.0'),
  bool(false),
  json({});

  const FrcValueType(this.defaultValue);
  final dynamic defaultValue;
}
