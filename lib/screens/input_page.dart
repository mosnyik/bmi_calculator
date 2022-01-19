import 'package:bmi/constants.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../bmi_calculator.dart';

enum Gender {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  const InputPage({
    Key? key,
  }) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.none;

  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBckColor,
        title: const Text('BMI Calculator'),
        elevation: 15,
      ),
      body: Column(
        children: [
          // first row in the column
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: gender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const ReusableCardChild(
                        cardLabel: 'MALE',
                        myIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: gender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const ReusableCardChild(
                        cardLabel: 'FEMALE',
                        myIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            // middle row in the column
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: kLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberStyle,
                            ),
                            const Text('cm', style: kLabelStyle)
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: kInactiveSliderColor,
                              activeTrackColor: kActiveIconColor,
                              thumbColor: kBottomContainerColor,
                              overlayColor: kOverlayColor,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 30)),
                          child: Slider(
                              value: height.toDouble(),
                              min: kMinSliderValue,
                              max: kMaxSliderValue,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            // last row in the column
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              colour: kActiveIconColor,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              colour: kActiveIconColor,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              colour: kActiveIconColor,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              colour: kActiveIconColor,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // ignore: sized_box_for_whitespace
          BottomButton(
            buttonTitle: 'CALCULATE YOUR BMI',
            onTap: () {
              BMICalculator bmiScore = BMICalculator(
                height: height,
                weight: weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmiScore.calculateBMI(),
                    interpretation: bmiScore.getInterpretation(),
                    resultText: bmiScore.getBMIResult(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
