import 'package:flutter/material.dart';
import 'package:jabar_form/src/constants.dart';

typedef ScaleRatingMapCallback = void Function(dynamic val);

class JabarFromScaleRating extends StatefulWidget {
  final String label;
  final ScaleRatingMapCallback callback;

  const JabarFromScaleRating({
    super.key,
    required this.label,
    required this.callback,
  });

  @override
  State<JabarFromScaleRating> createState() => _JabarFromScaleRatingState();
}

class _JabarFromScaleRatingState extends State<JabarFromScaleRating> {
  int selectedId = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              const SizedBox(height: 50)
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < ratingOptions.length; i++)
              GestureDetector(
                onTap: () {
                  var id = i + 1;

                  setSelectId(id);
                },
                child: Column(
                  children: [
                    Image.asset(
                      AssetImage(selectedId == (i + 1)
                              ? 'assets/icons/rating_${i + 1}_active_icon.png'
                              : 'assets/icons/rating_${i + 1}_inactive_icon.png')
                          .assetName,
                      package: 'jabar_form',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                              (100 / ratingOptions.length) /
                              100 -
                          10,
                      child: Text(
                        ratingOptions[i]['text'],
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  void setSelectId(int id) {
    setState(() {
      selectedId = id;
      widget.callback(id);
    });
  }
}
