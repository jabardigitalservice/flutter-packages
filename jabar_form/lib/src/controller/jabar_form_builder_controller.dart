import 'package:jabar_form/src/constants.dart';
import 'package:jabar_form/src/network/models/request/answer.dart';
import 'package:jabar_form/src/network/models/response/detail_form/questions.dart';

class JFBuilderController {
  // Main Data
  List<Question> questions = [];
  List<Answer> answers = [];

  JFBuilderController({
    required this.questions,
  });

  bool _hasErrorValidation = true;

  bool validate() {
    List<bool> validationResult = [];

    for (var element in questions) {
      Answer? answer = _getAnswerByUUID(element.uuid);

      if (element.rules?['required'] &&
          element.type != 'title' &&
          !isHiddenField(tag: element.tag)) {
        if (answer == null) {
          validationResult.add(true);
        } else {
          if (element.type == 'checkbox') {
            List<dynamic> values = answer.value;
            if (values.isEmpty) validationResult.add(true);
          }

          if (element.type == 'scale_rating') {
            if (answer.value == '' || answer.value == null) {
              validationResult.add(true);
            }
          }
        }
      }
    }

    _hasErrorValidation = validationResult.contains(true);

    return _hasErrorValidation;
  }

  void updateOrPushAnswer(Answer newAnswer) {
    String? targetUuidQuestion = newAnswer.uuidQuestion;

    int existingIndex = answers.indexWhere((element) {
      return element.uuidQuestion == targetUuidQuestion;
    });

    if (existingIndex != -1) {
      // Replace the existing object with the new one
      answers[existingIndex].value = newAnswer.value;
    } else {
      // Push the new object into the array
      answers.add(newAnswer);
    }
  }

  void initMetadata({
    String? username,
    String? source,
    String? metadata,
    Map<String, dynamic>? userProperties,
  }) {
    if (userProperties != null) {
      userProperties.forEach((key, value) {
        _addMetadataByTag(key, value);
      });
    }

    if (username != null) _addMetadataByLabel('username', username);
    if (source != null) _addMetadataByLabel('source', source);
    if (metadata != null) _addMetadataByLabel('metadata', metadata);
  }

  bool isHiddenField({String? tag, String? label}) {
    List<String> listHiddenLabel = Constants.listHiddenLabel;
    List<String> listHiddenTag = Constants.listHiddenTag;

    return listHiddenTag.contains(tag?.toLowerCase()) ||
        listHiddenLabel.contains(label?.toLowerCase());
  }

  bool isHasErrorValidation() => _hasErrorValidation;

  Answer? _getAnswerByUUID(String uuidQuestion) {
    int existingIndex = answers.indexWhere((element) {
      return element.uuidQuestion == uuidQuestion;
    });

    if (existingIndex != -1) {
      return answers[existingIndex];
    } else {
      return null;
    }
  }

  void _addMetadataByLabel(String label, dynamic value) {
    int existingIndex = questions.indexWhere((element) {
      return element.label.toString().toLowerCase() == label.toLowerCase();
    });

    int existingAnswerIndex = answers.indexWhere((element) {
      return element.value.toString().toLowerCase() == value.toLowerCase();
    });

    if (existingAnswerIndex == -1 && existingIndex != -1) {
      answers.add(Answer(
        uuidSurvey: questions[existingIndex].uuidSurvey,
        uuidQuestion: questions[existingIndex].uuid,
        type: questions[existingIndex].type,
        value: value,
      ));
    }
  }

  void _addMetadataByTag(String tag, dynamic value) {
    int existingIndex = questions.indexWhere((element) {
      return element.tag.toString().toLowerCase() == tag.toLowerCase();
    });

    int existingAnswerIndex = answers.indexWhere((element) {
      return element.value.toString().toLowerCase() == value.toLowerCase();
    });

    if (existingAnswerIndex == -1 && existingIndex != -1) {
      updateOrPushAnswer(Answer(
        uuidSurvey: questions[existingIndex].uuidSurvey,
        uuidQuestion: questions[existingIndex].uuid,
        type: questions[existingIndex].type,
        value: value,
      ));
    }
  }
}
