import 'package:flutter/material.dart';
import 'package:jabar_form/src/fields/jabar_form_checkbox.dart';
import 'package:jabar_form/src/fields/jabar_form_scale_rating.dart';
import 'package:jabar_form/src/fields/jabar_form_text_area.dart';
import 'package:jabar_form/src/fields/jabar_form_text_field.dart';

class JabarFormFieldBuilder extends StatelessWidget {
  final String uuidForm;
  final String uuidQuestion;
  final String type;
  final String label;
  final List<dynamic>? options;
  final Map<String, dynamic>? rules;
  final int index;
  final ScrollController scrollController;
  final bool showTitle;

  const JabarFormFieldBuilder({
    super.key,
    required this.uuidForm,
    required this.uuidQuestion,
    required this.type,
    required this.label,
    required this.options,
    required this.rules,
    required this.index,
    required this.scrollController,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'title':
        return Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'text':
        return JabarFromTextField(
          label: showTitle ? label : '',
          callback: (val) {},
        );
      case 'textarea':
        return JabarFromTextArea(
          label: showTitle ? label : '',
          index: index,
          scrollController: scrollController,
        );
      case 'scale_rating':
        return JabarFromScaleRating(
          label: showTitle ? label : '',
          callback: (val) {
            // Answer data = Answer(
            //   uuidSurvey: uuidForm,
            //   uuidQuestion: uuidQuestion,
            //   type: type,
            //   value: val,
            // );
            // _jfBuilderController.updateOrPushAnswer(data);

            // setState(() {
            //   _jfBuilderController.validate();
            // });
          },
        );
      case 'checkbox':
        return JabarFromCheckbox(
          label: showTitle ? label : '',
          options: options ?? [],
          rules: rules ?? {},
          hintText: 'Sampaikan hal yang perlu kami perbaiki',
          index: index,
          scrollController: scrollController,
          isFocus: (val) {
            // if (val) {
            //   setState(() {
            //     _hasFocus = true;
            //   });
            // }
          },
          callback: (selectedValue, textareaValue) {
            // Answer data = Answer(
            //   uuidSurvey: uuidForm,
            //   uuidQuestion: uuidQuestion,
            //   type: type,
            //   value: selectedValue,
            // );

            // _jfBuilderController.updateOrPushAnswer(data);

            // if (textareaValue != null) {
            //   // NEED CONTRACT LABEL NAME / TAG FOR "LAINNYA" FORM
            //   String targetLabel = 'Sampaikan hal yang perlu kami perbaiki';
            //   List<Question> feedbackField =
            //       _jfBuilderController.questions.where((question) {
            //     return question.label == targetLabel || question.tag == 'other';
            //   }).toList();

            //   if (feedbackField.isNotEmpty) {
            //     Answer feedbackData = Answer(
            //       uuidSurvey: feedbackField.first.uuidSurvey,
            //       uuidQuestion: feedbackField.first.uuid,
            //       type: feedbackField.first.type,
            //       value: textareaValue,
            //     );

            //     _jfBuilderController.updateOrPushAnswer(feedbackData);
            //   }
            // }

            // setState(() {
            //   _jfBuilderController.validate();
            // });
          },
        );
      default:
        return const Text(
          'belum support',
          style: TextStyle(
            color: Colors.red,
          ),
        );
    }
  }
}
