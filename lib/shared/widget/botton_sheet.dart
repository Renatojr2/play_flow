import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widget/set_label_buttom.dart';

class BottonSheet extends StatelessWidget {
  final String primaryLabel;
  final String secundaryLabel;
  final VoidCallback primaryButtom;
  final VoidCallback secundaryButtom;
  final String title;
  final String subtitle;

  const BottonSheet({
    Key key,
    this.primaryLabel,
    this.secundaryLabel,
    this.primaryButtom,
    this.secundaryButtom,
    this.title,
    this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                          text: title,
                          style: TextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                                text: '\n$subtitle',
                                style: TextStyles.buttonHeading),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      color: AppColors.stroke,
                    ),
                    SetLabelButtom(
                      primaryButtom: primaryButtom,
                      secundaryButtom: secundaryButtom,
                      primaryLabel: primaryLabel,
                      secundaryLabel: secundaryLabel,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
