import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jabar_form/jabar_form.dart';
import 'package:jabar_form/src/bloc/jf_cubit.dart';
import 'package:jabar_form/src/bloc/jf_state.dart';
import 'package:jabar_form/src/network/api_endpoint.dart';
import 'package:jabar_form/src/network/api_service.dart';
import 'package:jabar_form/src/network/models/request/answer.dart';
import 'package:jabar_form/src/network/models/request/submit_request.dart';
import 'package:jabar_form/src/network/models/response/detail_form/questions.dart';

import 'package:jabar_form/src/style.dart';

class JabarFormBuilder extends StatefulWidget {
  final String baseUrl;
  final String slug;
  final String? username;
  final String? source;
  final String? metadata;
  final Function(bool val) onSubmit;
  final Function() onCancel;
  final Function() onError;

  const JabarFormBuilder({
    super.key,
    this.baseUrl = ApiEndpoint.baseUrl,
    required this.slug,
    this.username,
    this.source = 'mobile',
    this.metadata,
    required this.onSubmit,
    required this.onCancel,
    required this.onError,
  });

  @override
  State<JabarFormBuilder> createState() => _JabarFormBuilderState();
}

class _JabarFormBuilderState extends State<JabarFormBuilder>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  bool hasErrorValidation = true;

  List<Question> questions = [];
  List<Answer> answers = [];

  bool isBusy = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      initMetadata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JFCubit(),
      child: BlocBuilder<JFCubit, JFState>(
        builder: (context, state) {
          if (state is JFStateInit) {
            // You can call your service here when the widget initializes.
            context.read<JFCubit>().getJFData(widget.slug);
            return const Center(child: CircularProgressIndicator());
          } else if (state is JFStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JFStateSuccess) {
            // Handle your successful state, for example, display survey data.
            final surveyData = state.jfData;
            questions = surveyData.data!.questions!;

            return formBuilder(context, surveyData.data!.questions!);
          } else if (state is JFStateError) {
            // Handle the error state.
            return errorBuilder();
          } else {
            // Handle other states if needed.
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }

  Widget errorBuilder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            const AssetImage('assets/icons/rating_3_active_icon.png').assetName,
            package: 'jabar_form',
            width: 80,
            height: 80,
          ),
          const Text('Koneksi server error, silahkan coba beberapa saat lagi'),
        ],
      ),
    );
  }

  Widget formBuilder(BuildContext context, List<Question> questions) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return isHiddenField(
                              tag: questions[index].tag,
                              label: questions[index].label) ||
                          !questions[index].isActive
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: buildField(
                            uuidForm: questions[index].uuidSurvey,
                            uuidQuestion: questions[index].uuid,
                            type: questions[index].type,
                            label: questions[index].label,
                            options: questions[index].options,
                            rules: questions[index].rules,
                          ),
                        );
                }),
          ),
          !isBusy ? actionButton() : submitLoading(),
        ],
      ),
    );
  }

  Widget actionButton() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(color: Color.fromRGBO(250, 250, 250, 1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width / 2) - 40,
            child: TextButton(
              onPressed: () => widget.onCancel(),
              style: CustomButtonStyle().flatButtonStyle,
              child: Text(
                Constants.skip,
                style: TextStyle(
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 2) - 40,
            child: ElevatedButton(
              style: hasErrorValidation
                  ? CustomButtonStyle().disableRaisedButtonStyle
                  : CustomButtonStyle().raisedButtonStyle,
              onPressed: () async {
                if (hasErrorValidation) return;

                if (mounted) {
                  setState(() {
                    isBusy = true;
                  });
                }

                DateTime now = DateTime.now();
                int epochTime = now.millisecondsSinceEpoch;

                ApiService()
                    .submit(SubmitRequest(
                  answers: answers,
                  submittedTime: epochTime,
                ))
                    .then((value) {
                  if (value == null) widget.onError();

                  if (value!.statusCode == 201) widget.onSubmit(true);

                  if (value.statusCode == 422) widget.onSubmit(false);

                  Future.delayed(const Duration(seconds: 3), () {
                    if (mounted) {
                      setState(() {
                        isBusy = false;
                      });
                    }
                  });
                });
              },
              child: Text(Constants.send),
            ),
          )
        ],
      ),
    );
  }

  Widget submitLoading() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: CustomButtonStyle().raisedButtonStyle,
        child: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget buildField({
    required String uuidForm,
    required String uuidQuestion,
    required String type,
    required String label,
    List<dynamic>? options,
    Map<String, dynamic>? rules,
  }) {
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
          label: label,
          callback: (val) {},
        );
      case 'textarea':
        return JabarFromTextArea(
          label: label,
        );
      case 'scale_rating':
        return JabarFromScaleRating(
          label: label,
          callback: (val) {
            Answer data = Answer(
              uuidSurvey: uuidForm,
              uuidQuestion: uuidQuestion,
              type: type,
              value: val,
            );
            updateOrPushObject(data);
            validate();
          },
        );
      case 'checkbox':
        return JabarFromCheckbox(
          label: label,
          options: options ?? [],
          rules: rules ?? {},
          hintText: 'Sampaikan hal yang perlu kami perbaiki',
          callback: (selectedValue, textareaValue) {
            Answer data = Answer(
              uuidSurvey: uuidForm,
              uuidQuestion: uuidQuestion,
              type: type,
              value: selectedValue,
            );

            updateOrPushObject(data);

            if (textareaValue != null) {
              // NEED CONTRACT LABEL NAME / TAG FOR "LAINNYA" FORM
              String targetLabel = 'Sampaikan hal yang perlu kami perbaiki';
              List<Question> feedbackField = questions.where((question) {
                return question.label == targetLabel;
              }).toList();

              Answer feedbackData = Answer(
                uuidSurvey: feedbackField.first.uuidSurvey,
                uuidQuestion: feedbackField.first.uuid,
                type: feedbackField.first.type,
                value: textareaValue,
              );

              updateOrPushObject(feedbackData);
            }

            validate();
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }

  bool validate() {
    List<bool> validationResult = [];

    for (var element in questions) {
      Answer? answer = getAnswerByUUID(element.uuid);

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

          if (element.type == 'scale_rating' || element.type == 'textarea') {
            if (answer.value == '' || answer.value == null) {
              validationResult.add(true);
            }
          }
        }
      }
    }

    setState(() {
      hasErrorValidation = validationResult.contains(true);
    });

    return hasErrorValidation;
  }

  Answer? getAnswerByUUID(String uuidQuestion) {
    int existingIndex = answers.indexWhere((element) {
      return element.uuidQuestion == uuidQuestion;
    });

    if (existingIndex != -1) {
      return answers[existingIndex];
    } else {
      return null;
    }
  }

  void updateOrPushObject(Answer newAnswer) {
    String? targetUuidQuestion = newAnswer.uuidQuestion;

    int existingIndex = answers.indexWhere((element) {
      return element.uuidQuestion == targetUuidQuestion;
    });

    if (existingIndex != -1) {
      // Replace the existing object with the new one
      answers[existingIndex] = newAnswer;
    } else {
      // Push the new object into the array
      answers.add(newAnswer);
    }
  }

  void initMetadata() {
    if (widget.username != null) {
      addMetadataByLabel('username', widget.username);
    }

    if (widget.source != null) {
      addMetadataByLabel('source', widget.source);
    }

    if (widget.metadata != null) {
      addMetadataByLabel('metadata', widget.metadata);
    }
  }

  void addMetadataByLabel(String label, dynamic value) {
    int existingIndex = questions.indexWhere((element) {
      return element.label.toString().toLowerCase() == label.toLowerCase();
    });

    if (existingIndex != -1) {
      answers.add(Answer(
        uuidSurvey: questions[existingIndex].uuidSurvey,
        uuidQuestion: questions[existingIndex].uuid,
        type: questions[existingIndex].type,
        value: value,
      ));
    }
  }

  bool isHiddenField({String? tag, String? label}) {
    List<String> listHiddenLabel = Constants.listHiddenLabel;
    List<String> listHiddenTag = Constants.listHiddenTag;

    return listHiddenTag.contains(tag?.toLowerCase()) ||
        listHiddenLabel.contains(label?.toLowerCase());
  }
}