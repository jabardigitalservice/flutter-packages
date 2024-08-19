import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

typedef TextAreaCallback = void Function(dynamic val);

class JabarFromTextArea extends StatelessWidget {
  final String label;
  final int index;
  final ScrollController scrollController;
  final TextAreaCallback callback;

  const JabarFromTextArea({
    super.key,
    required this.label,
    required this.index,
    required this.scrollController,
    required this.callback,
  });

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
            ],
          ),
        ),
        const SizedBox(height: 6),
        FormBuilderTextField(
          name: label,
          maxLines: 3,
          onChanged: (val) {
            callback(val);
          },
          onTap: () {
            // double heightOfTextfield = 80;
            // scrollController.animateTo(index * heightOfTextfield,
            //     duration: const Duration(milliseconds: 100),
            //     curve: Curves.easeOutCubic);
          },
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
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}
