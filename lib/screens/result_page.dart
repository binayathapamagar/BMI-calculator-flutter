import 'package:bmi_calculator/widgets/reuseable_card.dart';
import 'package:flutter/material.dart';
import '../calculator_brain.dart';
import '../widgets/container_calculate_button.dart';
import '../utilities/constants.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String message;

  ResultPage({required this.bmi, required this.result, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'YOUR RESULT',
                  style: kResultTitleStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableCard(
                cardColor: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result.toUpperCase(),
                      style: kResultMessageStyle,
                    ),
                    Column(
                      children: [
                        Text(
                          'Normal BMI Range:',
                          style: kBMIRangeTextStyle,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '18.5 - 25 kg/m2',
                          style: kMessageStyle,
                        ),
                      ],
                    ),
                    Text(
                      bmi,
                      style: kBMIResultStyle,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: kMessageStyle,
                    ),
                  ],
                ),
              ),
            ),
            ContainerCalculateButton(
              title: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
