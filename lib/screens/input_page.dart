import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculation.dart';

enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                gender = Gender.male;
                              });
                            },
                            color: gender == Gender.male
                                ? KActiveCardColor
                                : KInactiveCardColor,
                            child: IconContent(
                              icon: FontAwesomeIcons.mars,
                              label: 'MALE',
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                gender = Gender.female;
                              });
                            },
                            color: gender == Gender.female
                                ? KActiveCardColor
                                : KInactiveCardColor,
                            child: IconContent(
                              icon: FontAwesomeIcons.venus,
                              label: 'FEMALE',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: KActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20.0),
                              thumbColor: Color(0xFFEB1555),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 100.0,
                              max: 250.0,
                              activeColor: Color(0xFFEB1555),
                              inactiveColor: Color(0xFF8D8E98),
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            color: KActiveCardColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            color: KActiveCardColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AGE',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomButton(
                    onTap: () {
                      Calculation calc =
                          Calculation(height: height, weight: weight);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultsPage(
                                    bmiResult: calc.calculateBMI(),
                                    resultText: calc.getResult(),
                                    interpretation: calc.getInterpretation(),
                                  )));
                    },
                    buttonTitle: 'CALCULATE',
                  )
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
