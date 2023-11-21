class Constants {
  static String skip = 'Lewati';
  static String send = 'Kirim';

  static List<String> listHiddenLabel = [
    'sampaikan hal yang perlu kami perbaiki',
    'metadata',
    'source',
    'meta-source',
    'meta-user-id',
    'meta-role',
    'meta-role',
  ];

  static List<String> listHiddenTag = ['hidden', 'meta'];
}

enum FieldType {
  title,
  description,
  textarea,
  number,
  radio,
  checkbox,
  dropdown,
  phoneNumber,
  address,
  email,
  currentLocation,
  scaleRating,
  starRating,
  nps,
  timePicker,
  datePicker,
  link,
  upload
}

List<Map<String, dynamic>> ratingOptions = [
  {'text': 'Sangat Sulit', 'value': 1},
  {'text': 'Sulit', 'value': 2},
  {'text': 'Biasa', 'value': 3},
  {'text': 'Mudah', 'value': 4},
  {'text': 'Sangat Mudah', 'value': 5},
];
