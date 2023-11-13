import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

typedef ComboBoxMapCallback = void Function(
    List<dynamic> selectedOptions, String? valueTextarea);

class JabarFromCheckbox extends StatefulWidget {
  final String label;
  final String hintText;
  final List<dynamic> options;
  final Map<String, dynamic> rules;
  final ComboBoxMapCallback callback;

  const JabarFromCheckbox({
    super.key,
    required this.label,
    this.hintText = '',
    required this.options,
    required this.rules,
    required this.callback,
  });

  @override
  State<JabarFromCheckbox> createState() => _JabarFromCheckboxState();
}

class _JabarFromCheckboxState extends State<JabarFromCheckbox> {
  // Function callback Implementation
  List<dynamic> selectedOptions = [];
  String valueTextarea = '';

  bool activeOtherTextArea = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.label != '',
          child: Wrap(
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          children: widget.options.asMap().entries.map((e) {
            // var index = e.key;
            var value = e.value;
            return GestureDetector(
              onTap: () {
                // Update the selected widget.options list
                if (!selectedOptions.contains(value['value'])) {
                  selectedOptions.add(value['value']);

                  if (hideFromRegex().hasMatch(value['value'])) {
                    activeOtherTextArea = true;
                  }
                } else {
                  selectedOptions.remove(value['value']);

                  if (hideFromRegex().hasMatch(value['value'])) {
                    activeOtherTextArea = false;
                  }
                }

                setState(() {});

                widget.callback(selectedOptions, valueTextarea);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedOptions.contains(value['value'])
                        ? Colors.blue.shade50
                        : Colors.grey.shade300,
                    border: Border.all(
                      color: selectedOptions.contains(value['value'])
                          ? Colors.blue.shade50
                          : Colors.blue.shade50,
                    ),
                  ),
                  child: Text(
                    value['label'],
                    style: TextStyle(
                      color: selectedOptions.contains(value['value'])
                          ? Colors.blue.shade900
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Visibility(
          visible: activeOtherTextArea,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: FormBuilderTextField(
              name: 'Lainnya',
              maxLines: 3,
              validator: (val) {
                if (widget.rules['required'] && val == null) {
                  return 'Wajib diisi!';
                }

                if (widget.rules['max_length'] != null &&
                    val!.length > widget.rules['max_length']) {
                  return 'Maksimal ${widget.rules['max_length']} karakter';
                }

                if (widget.rules['min_length'] != null &&
                    val!.length < widget.rules['min_length']) {
                  return 'Minimal ${widget.rules['max_length']} karakter';
                }

                return null;
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                ),
              ),
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                setState(() {
                  widget.callback(selectedOptions, value);
                });
              },
            ),
          ),
        )
      ],
    );
  }

  RegExp hideFromRegex({String search = 'lainnya'}) {
    return RegExp(
      '\\b$search\\b',
      caseSensitive: false,
    );
  }
}
