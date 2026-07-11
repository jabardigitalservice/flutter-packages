enum FrcValueType {
  string(''),
  number('0.0'),
  bool(false),
  json({}),
  array([]);

  const FrcValueType(this.defaultValue);
  final dynamic defaultValue;
}
