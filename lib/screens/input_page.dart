import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reuseable_card.dart';
import 'package:bmi_calculator/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';
import '../widgets/container_calculate_button.dart';
import '../utilities/constants.dart';

enum Gender { male, female }
enum AddSubtract { add, subtract }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 25;

  void _updateWeight(AddSubtract operator) {
    if (operator == AddSubtract.add) {
      if (weight < 300) {
        weight++;
      }
    } else {
      if (weight > 1) {
        weight--;
      }
    }
  }

  void _updateAge(AddSubtract operator) {
    if (operator == AddSubtract.add) {
      if (age < 120) {
        age++;
      }
    } else {
      if (age > 1) {
        age--;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableCard(
                      onClick: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      child: IconContent(
                        icon: FontAwesomeIcons.mars,
                        title: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      onClick: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      child: IconContent(
                        icon: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                cardColor: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kTitleStyle,
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
                        Text(
                          'cm',
                          style: kUnitStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kSliderInActiveColor,
                        thumbColor: kSliderActiveColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                        overlayColor: kSliderOverlayColor,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: kSliderMinHeight,
                        max: kSliderMaxHeight,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
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
                    child: ReuseableCard(
                      cardColor: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kTitleStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onTapped: () {
                                  setState(() {
                                    _updateWeight(AddSubtract.add);
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onTapped: () {
                                  setState(() {
                                    _updateWeight(AddSubtract.subtract);
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
                    child: ReuseableCard(
                      cardColor: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kTitleStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onTapped: () {
                                  setState(() {
                                    _updateAge(AddSubtract.add);
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onTapped: () {
                                  setState(() {
                                    _updateAge(AddSubtract.subtract);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ContainerCalculateButton(
              title: 'CALCULATE',
              onPressed: () {
                CalculatorBrain cb = CalculatorBrain(
                  weight: weight,
                  height: height,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: cb.getBMI(),
                      result: cb.getResult(),
                      message: cb.getMessage(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
