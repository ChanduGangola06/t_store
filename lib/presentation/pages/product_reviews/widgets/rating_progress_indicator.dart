import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/device/device_utility.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(fontSize: 14.0)),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 11.0,
            width: TDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearCappedProgressIndicator(
              cornerRadius: 7,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(Colors.blue[700]),
              minHeight: 25,
              value: value,
            ),
          ),
        ),
        const SizedBox(height: 22.0),
      ],
    );
  }
}
