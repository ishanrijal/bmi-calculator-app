import 'package:flutter/material.dart';
import 'home.dart';

Color primaryColor = const Color.fromARGB(255, 201, 139, 139);
Color secondaryColor = const Color.fromARGB(255, 57, 67, 161);
Color hintColor = const Color.fromARGB(255, 227, 191, 191);

var tableTextStyle1 = TextStyle(
  color: secondaryColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
  fontFamily: 'Arial',
);
var tableHeadingStyle = const TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w900,
);

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.white,
        title: Text(
          "BMI Information",
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
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Column(
          children: [
            Table(
              border: TableBorder.all(color: hintColor),
              columnWidths: const {
                0: FlexColumnWidth(1), // Adjust column width as needed
                1: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'BMI Score',
                          textAlign: TextAlign.center,
                          style: tableHeadingStyle,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Category",
                          textAlign: TextAlign.center,
                          style: tableHeadingStyle,
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
                          '< 16 (kg/m²)',
                          textAlign: TextAlign.center,
                          style: tableTextStyle1,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Sever Undernourishment",
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
                          '16-16.9 (kg/m²)',
                          textAlign: TextAlign.center,
                          style: tableTextStyle1,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Medium Undernourishment",
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
                          '17-18.4 (kg/m²)',
                          textAlign: TextAlign.center,
                          style: tableTextStyle1,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Slightly Undernourishment",
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
                          '18.5-24.9 (kg/m²)',
                          textAlign: TextAlign.center,
                          style: tableTextStyle1,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Normal Nutririon State",
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
                          '25-29.9 (kg/m²)',
                          textAlign: TextAlign.center,
                          style: tableTextStyle1,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Overweight",
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
                          '30-39.9 (kg/m²)',
                          textAlign: TextAlign.center,
                          style: tableTextStyle1,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Obesity",
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
                          '>40 (kg/m²)',
                          textAlign: TextAlign.center,
                          style: tableTextStyle1,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Pathological Obesity",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                  Color.fromARGB(255, 57, 67, 161),
                ),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                ),
              ),
              onPressed: () {
                // Clear the state variables
                setState(() {
                  age = 0;
                  weight = 0.0;
                  height = 0.0;
                });
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false,
                );
              },
              child: const Text(
                'Calculate BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
