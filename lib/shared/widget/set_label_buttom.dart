import 'package:flutter/material.dart';

import 'custom_divider.dart';
import 'label_button.dart';

class SetLabelButtom extends StatelessWidget {
  final String primaryLabel;
  final String secundaryLabel;
  final VoidCallback primaryButtom;
  final VoidCallback secundaryButtom;

  const SetLabelButtom({
    Key key,
    this.primaryLabel,
    this.secundaryLabel,
    this.primaryButtom,
    this.secundaryButtom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryButtom,
            ),
          ),
          DividerVertical(),
          Expanded(
            child: LabelButton(
              label: secundaryLabel,
              onPressed: secundaryButtom,
            ),
          ),
        ],
      ),
    );
  }
}
