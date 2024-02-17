import 'package:flutter/material.dart';
import 'package:test_flutter/pages/detail.dart';

Color primaryColor = const Color.fromARGB(255, 201, 139, 139);
Color secondaryColor = const Color.fromARGB(255, 57, 67, 161);
Color infoColor = const Color.fromARGB(255, 57, 67, 161);
Color infotextColorColor = const Color.fromARGB(255, 255, 255, 255);
Color hintColor = const Color.fromARGB(255, 227, 191, 191);

const bottomSpace = SizedBox(
  height: 72,
);
const topSpace = SizedBox(
  height: 48,
);

var tableTextStyle1 = TextStyle(
  color: secondaryColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class BmiResult extends StatefulWidget {
  final int age;
  final String gender;
  final double weight;
  final double height;
  final String weightUnit;
  final String heightUnit;

  const BmiResult({
    Key? key,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.weightUnit,
    required this.heightUnit,
  }) : super(key: key);

  @override
  _BmiResultState createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  double calculateBMI() {
    // Convert weight and height to appropriate units
    double convertedWeight = widget.weight;
    double convertedHeight = widget.height;

    if (widget.weightUnit == 'lb') {
      convertedWeight *= 0.453592; // Convert pounds to kilograms
    }
    if (widget.heightUnit == 'ft') {
      convertedHeight *= 30.48; // Convert feet to centimeters
    }

    // Calculate BMI using the formula: BMI = weight (kg) / (height (m))^2
    double heightInMeter =
        convertedHeight / 100; // Convert centimeters to meters
    return convertedWeight / (heightInMeter * heightInMeter);
  }

  // BMI Category
  String getBMICategory() {
    double result = calculateBMI();
    if (result < 16) {
      infotextColorColor = const Color.fromARGB(255, 255, 255, 255);
      infoColor = Colors.red;
      return "Sever Underourishment";
    } else if (result >= 16 && result <= 16.9) {
      infotextColorColor = const Color.fromARGB(255, 255, 255, 255);
      infoColor = Colors.red.withOpacity(0.8);
      return "Medium Underourishment";
    } else if (result >= 17 && result <= 18.4) {
      infotextColorColor = const Color.fromARGB(255, 255, 255, 255);
      infoColor = const Color.fromARGB(255, 57, 67, 161);
      return "Slight Underourishment";
    } else if (result >= 18.5 && result <= 24.9) {
      infotextColorColor = const Color.fromARGB(255, 255, 255, 255);
      infoColor = primaryColor;
      return "Normal Nutririon State";
    } else if (result >= 25.0 && result <= 29.9) {
      infotextColorColor = secondaryColor;
      infoColor = Colors.yellow.shade400;
      return "Overweight";
    } else if (result >= 30.0 && result <= 39.9) {
      infotextColorColor = const Color.fromARGB(255, 255, 255, 255);
      infoColor = Colors.red.withOpacity(0.8);
      return "Obesity";
    } else {
      infotextColorColor = const Color.fromARGB(255, 255, 255, 255);
      infoColor = Colors.red;
      return "Pathological Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.white,
        title: Text(
          "BMI Result",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: secondaryColor),
        ),
        leading: TextButton(
          onPressed: () {
            // Navigate back to previous screen
            Navigator.pop(context);
          },
          child: const Text(
            "Back",
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Detail(),
                  ),
                );
              },
              icon: const Icon(Icons.info),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            topSpace,
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text(
                    'Your Score',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    calculateBMI().toStringAsFixed(1),
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    getBMICategory(),
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 180,
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1), // Adjust column width as needed
                    1: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: hintColor)),
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Gender',
                                textAlign: TextAlign.center,
                                style: tableTextStyle1),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.gender.capitalize(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: hintColor)),
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Age',
                              textAlign: TextAlign.center,
                              style: tableTextStyle1,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.age} Years',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: hintColor)),
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Height',
                              textAlign: TextAlign.center,
                              style: tableTextStyle1,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.height} cm',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Weight',
                              textAlign: TextAlign.center,
                              style: tableTextStyle1,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.weight} kg',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 24.0,
                ),
                decoration: BoxDecoration(
                  color: infoColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Information!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: infotextColorColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: TextStyle(
                        fontSize: 16,
                        color: infotextColorColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomSpace,
          ],
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
