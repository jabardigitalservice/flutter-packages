import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jabar_form/jabar_form.dart';
import 'package:jabar_form/src/bloc/jf_cubit.dart';
import 'package:jabar_form/src/bloc/jf_state.dart';
import 'package:jabar_form/src/controller/jabar_form_builder_controller.dart';
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
  final bool? isBottomSheet;
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
    this.isBottomSheet = false,
    required this.onSubmit,
    required this.onCancel,
    required this.onError,
  });

  @override
  State<JabarFormBuilder> createState() => _JabarFormBuilderState();
}

class _JabarFormBuilderState extends State<JabarFormBuilder>
    with TickerProviderStateMixin {
  final JFBuilderController _jfBuilderController =
      JFBuilderController(questions: []);

  final _formKey = GlobalKey<FormBuilderState>();
  final ScrollController scrollController = ScrollController();

  bool _isBusy = false;
  bool _hasFocus = false;

  @override
  void initState() {
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
            context.read<JFCubit>().getJFData(widget.baseUrl, widget.slug);
            return const Center(child: CircularProgressIndicator());
          } else if (state is JFStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JFStateSuccess) {
            // Handle your successful state, for example, display survey data.
            final surveyData = state.jfData;

            _jfBuilderController.questions = surveyData.data!.questions!;

            _jfBuilderController.initMetadata(
              username: widget.username,
              source: widget.source,
              metadata: widget.metadata,
            );

            return formBuilder(context, surveyData.data!.questions!);
          } else if (state is JFStateError) {
            return errorBuilder();
          } else {
            // Handle other states if needed.
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }

  Widget formBuilder(BuildContext context, List<Question> questions) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: NotificationListener(
              onNotification: (t) {
                if (t is UserScrollNotification) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_hasFocus) {
                    setState(() {
                      _hasFocus = false;
                    });
                  }
                }
                return true;
              },
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  scrollController.animateTo(0.0,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeOutCubic);
                  setState(() {
                    _hasFocus = false;
                  });
                },
                child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: questions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _jfBuilderController.isHiddenField(
                                  tag: questions[index].tag,
                                  label: questions[index].label) ||
                              !questions[index].isActive
                          ? const SizedBox.shrink()
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 20),
                                  child: fieldBuilder(
                                      uuidForm: questions[index].uuidSurvey,
                                      uuidQuestion: questions[index].uuid,
                                      type: questions[index].type,
                                      label: questions[index].label,
                                      options: questions[index].options,
                                      rules: questions[index].rules,
                                      index: index,
                                      scrollController: scrollController),
                                ),
                                (index + 1) == questions.length &&
                                        _hasFocus &&
                                        widget.isBottomSheet == true
                                    ? const SizedBox(height: 290)
                                    : const SizedBox.shrink()
                              ],
                            );
                    }),
              ),
            ),
          ),
          !_isBusy ? actionButton() : submitLoading(),
        ],
      ),
    );
  }

  Widget fieldBuilder({
    required String uuidForm,
    required String uuidQuestion,
    required String type,
    required String label,
    List<dynamic>? options,
    Map<String, dynamic>? rules,
    required int index,
    required ScrollController scrollController,
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
          index: index,
          scrollController: scrollController,
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
            _jfBuilderController.updateOrPushAnswer(data);

            setState(() {
              _jfBuilderController.validate();
            });
          },
        );
      case 'checkbox':
        return JabarFromCheckbox(
          label: label,
          options: options ?? [],
          rules: rules ?? {},
          hintText: 'Sampaikan hal yang perlu kami perbaiki',
          index: index,
          scrollController: scrollController,
          isFocus: (val) {
            if (val) {
              setState(() {
                _hasFocus = true;
              });
            }
          },
          callback: (selectedValue, textareaValue) {
            Answer data = Answer(
              uuidSurvey: uuidForm,
              uuidQuestion: uuidQuestion,
              type: type,
              value: selectedValue,
            );

            _jfBuilderController.updateOrPushAnswer(data);

            if (textareaValue != null) {
              // NEED CONTRACT LABEL NAME / TAG FOR "LAINNYA" FORM
              String targetLabel = 'Sampaikan hal yang perlu kami perbaiki';
              List<Question> feedbackField =
                  _jfBuilderController.questions.where((question) {
                return question.label == targetLabel || question.tag == 'other';
              }).toList();

              if (feedbackField.isNotEmpty) {
                Answer feedbackData = Answer(
                  uuidSurvey: feedbackField.first.uuidSurvey,
                  uuidQuestion: feedbackField.first.uuid,
                  type: feedbackField.first.type,
                  value: textareaValue,
                );

                _jfBuilderController.updateOrPushAnswer(feedbackData);
              }
            }

            setState(() {
              _jfBuilderController.validate();
            });
          },
        );
      default:
        return const SizedBox.shrink();
    }
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
              style: _jfBuilderController.isHasErrorValidation()
                  ? CustomButtonStyle().disableRaisedButtonStyle
                  : CustomButtonStyle().raisedButtonStyle,
              onPressed: () async {
                if (_jfBuilderController.isHasErrorValidation()) return;

                if (mounted) {
                  setState(() {
                    _isBusy = true;
                  });
                }

                DateTime now = DateTime.now();
                int epochTime = now.millisecondsSinceEpoch;

                ApiService(baseUrl: widget.baseUrl)
                    .submit(SubmitRequest(
                  answers: _jfBuilderController.answers,
                  submittedTime: epochTime,
                ))
                    .then((value) {
                  if (value == null) widget.onError();

                  if (value!.statusCode == 201) widget.onSubmit(true);

                  if (value.statusCode == 422) widget.onSubmit(false);

                  Future.delayed(const Duration(seconds: 3), () {
                    if (mounted) {
                      setState(() {
                        _isBusy = false;
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
          const SizedBox(height: 40),
          const Text('Koneksi server error, silahkan coba beberapa saat lagi'),
        ],
      ),
    );
  }
}
