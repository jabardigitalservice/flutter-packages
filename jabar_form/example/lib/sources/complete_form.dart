import 'package:example/data/data_form.dart';
import 'package:flutter/material.dart';
import 'package:jabar_form/jabar_form.dart';

class CompleteForm extends StatefulWidget {
  const CompleteForm({super.key});

  @override
  State<CompleteForm> createState() => _CompleteFormState();
}

class _CompleteFormState extends State<CompleteForm> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _dataForm = DataForm.typesForm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Complete Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: ListView.builder(
          itemCount: _dataForm.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Divider(),
                Text(
                  _dataForm[index]['title'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(),
                _fieldBuilder(index),
              ],
            );
          },
        ),
      ),
    );
  }

  ListView _fieldBuilder(int index) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _dataForm[index]['subs'].length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index2) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text(
                '${_dataForm[index]['subs'][index2]['title']} / ${_dataForm[index]['subs'][index2]['type']}'),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: JabarFormFieldBuilder(
                uuidForm: 'uuid',
                uuidQuestion: 'uuidQuestion',
                type: _dataForm[index]['subs'][index2]['type'],
                label: _dataForm[index]['subs'][index2]['title'],
                options: const [
                  {"label": "Option 1", "value": "option-1"},
                  {"label": "Option 2", "value": "option-2"},
                  {"label": "Option 3", "value": "option-3"},
                  {"label": "Option 4", "value": "option-4"},
                  {"label": "Option 5", "value": "option-5"},
                  {"label": "Option 6", "value": "option-6"},
                ],
                rules: _dataForm[index]['subs'][index2]['rules'],
                index: index2,
                scrollController: _scrollController,
                showTitle: false,
              ),
            ),
          ),
        );
      },
    );
  }
}
