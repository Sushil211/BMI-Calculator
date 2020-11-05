import 'package:bmi_calculator/constants.dart';
import 'file:///D:/Flutter_Apps/BMI-Calculator/lib/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Your Result',
                        style: kTitleTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ReusableCard(
                      color: KActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            resultText.toUpperCase(),
                            style: KResultTextStyle,
                          ),
                          Text(
                            bmiResult,
                            style: KBMITextStyle,
                          ),
                          Text(
                            interpretation,
                            textAlign: TextAlign.center,
                            style: KBodyTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    buttonTitle: 'RE-CALCULATE',
                  )
                ],
              ))),
        );
      }),
    );
  }
}
