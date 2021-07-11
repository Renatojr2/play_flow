import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widget/botton_sheet.dart';
import 'package:payflow/shared/widget/custom_divider.dart';
import 'package:payflow/shared/widget/label_button.dart';
import 'package:payflow/shared/widget/set_label_buttom.dart';

class BarCodePage extends StatefulWidget {
  @override
  _BarCodePageState createState() => _BarCodePageState();
}

class _BarCodePageState extends State<BarCodePage> {
  @override
  Widget build(BuildContext context) {
    return BottonSheet(
      title: 'Não foi possível identificar um código de barras.',
      subtitle: 'Tente escanear novamente ou digite o código do seu boleto.',
      primaryLabel: 'Escanear novamente',
      secundaryLabel: 'Digitar código',
    );
    return SafeArea(
      bottom: true,
      right: true,
      left: true,
      top: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Escaneie o código de barras do boleto',
              style: TextStyles.buttonBackground,
            ),
            leading: BackButton(
              color: Colors.white,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          bottomNavigationBar: SetLabelButtom(
            primaryLabel: 'Inserir código do boleto',
            primaryButtom: () {},
            secundaryLabel: 'Inserir da galeria',
            secundaryButtom: () {},
          ),
        ),
      ),
    );
  }
}
