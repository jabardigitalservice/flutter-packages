import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

typedef TextFieldMapCallback = void Function(dynamic val);

class JabarFromTextField extends StatelessWidget {
  final String label;
  final TextFieldMapCallback callback;

  const JabarFromTextField(
      {super.key, required this.label, required this.callback, print});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != '',
          child: Wrap(
            children: [
              Text(
                label,
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
        FormBuilderTextField(
          name: label,
          decoration: InputDecoration(
            hintText: label,
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
          onChanged: ((value) => callback.call(value)),
        ),
      ],
    );
  }
}
