import 'package:flutter/material.dart';
import 'bmi_result.dart';

/// Defined the Primary, Seconday and the Tertiary Color for the App.
Color primaryColor = const Color.fromARGB(255, 201, 139, 139);
Color secondaryColor = const Color.fromARGB(255, 57, 67, 161);
Color hintColor = const Color.fromARGB(255, 227, 191, 191);

/// Setting all the state variables.
int age = 0;
double weight = 0.0;
double height = 0.0;
String weightUnit = 'kg';
String heightUnit = 'cm';

/// Home screen that allows users to input their BMI parameters
/// We need to play with the states, thats why Home is using the StatefulWidget
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///Initially setting gender to male.
  String selectedGender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: secondaryColor),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),

      /// I have used SingleChildScrollView Widget to prevent the Widget's overflow by allowing the body to be scrollable.
      /// When User press the inputbox, then the keyboard will popup. This might lead to overflow. So, to prevent it, I have used this widget.
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  //Two Expanded Widgets for the buttons.
                  MaleButton(
                      selectedGender: selectedGender,
                      onPressed: () {
                        setState(() {
                          selectedGender = 'male';
                        });
                      }),
                  FemaleButton(
                      selectedGender: selectedGender,
                      onPressed: () {
                        setState(() {
                          selectedGender = 'female';
                        });
                      }),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  //Two Expanded Widgets for Columns
                  LeftSideColumn(selectedGender: selectedGender),
                  const RightSideColumn(),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 104,
                  ),
                  Expanded(
                    child: ElevatedButton(
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
                          const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                      onPressed: () {
                        List<String> missingFields = [];

                        // Check which fields are missing
                        if (age == 0) {
                          missingFields.add('Age');
                        }
                        if (weight == 0.0) {
                          missingFields.add('Weight');
                        }
                        if (height == 0.0) {
                          missingFields.add('Height');
                        }
                        if (missingFields.isNotEmpty) {
                          String errorMessage =
                              'Please fill the following fields: ${missingFields.join(', ')}';
                          // Show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage),
                            ),
                          );
                        } else {
                          //Calculate BMI
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BmiResult(
                                age: age,
                                gender: selectedGender,
                                weight: weight,
                                height: height,
                                weightUnit: weightUnit,
                                heightUnit: heightUnit,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Calculate Button',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeightUnitDropDown extends StatefulWidget {
  const WeightUnitDropDown({super.key});

  @override
  _WeightUnitDropDownState createState() => _WeightUnitDropDownState();
}

class _WeightUnitDropDownState extends State<WeightUnitDropDown> {
  String selectedUnit = 'kg';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedUnit,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedUnit = newValue;
            weightUnit = selectedUnit;
          });
        }
      },
      items: <String>['kg', 'lb'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//For the Height Unit Dropdown Selection
class HeightUnitDropDown extends StatefulWidget {
  const HeightUnitDropDown({super.key});

  @override
  _HeightUnitDropDownState createState() => _HeightUnitDropDownState();
}

class _HeightUnitDropDownState extends State<HeightUnitDropDown> {
  String selectedUnit = 'cm';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedUnit,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedUnit = newValue;
            heightUnit = selectedUnit;
          });
        }
      },
      items: <String>['cm', 'ft'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//This is the Male Selection Button
class MaleButton extends StatelessWidget {
  const MaleButton({
    Key? key,
    this.onPressed,
    required this.selectedGender,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String selectedGender;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: selectedGender == 'male' ? secondaryColor : Colors.white,
            border: Border.all(
              color: selectedGender == 'male' ? Colors.white : primaryColor,
              width: 0,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 8.0,
          ),
          child: Row(
            children: [
              Icon(
                Icons.male,
                color: selectedGender == 'male' ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 8.0),
              Text(
                "Male",
                style: TextStyle(
                  color: selectedGender == 'male' ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//This is the Female Selection Button
class FemaleButton extends StatelessWidget {
  const FemaleButton({
    required this.selectedGender,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String selectedGender;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: selectedGender == 'male' ? Colors.white : secondaryColor,
            border: Border.all(
              color: selectedGender == 'male' ? primaryColor : Colors.white,
              width: 0,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 8.0,
          ),
          child: Row(
            children: [
              Icon(
                Icons.female,
                color: selectedGender == 'male' ? Colors.black : Colors.white,
              ),
              SizedBox(width: 8.0),
              Text(
                "Female",
                style: TextStyle(
                  color: selectedGender == 'male' ? Colors.black : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Left Side COlumn for the Image

class LeftSideColumn extends StatelessWidget {
  final String selectedGender;

  const LeftSideColumn({
    required this.selectedGender,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath =
        selectedGender == 'male' ? 'assets/male.png' : 'assets/female.png';
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(right: 26.0, top: 24),
        child: AspectRatio(
          aspectRatio: 1 / 3,
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
    );
  }
}

class RightSideColumn extends StatefulWidget {
  const RightSideColumn({super.key});
  @override
  _RightSideColumnState createState() => _RightSideColumnState();
}

class _RightSideColumnState extends State<RightSideColumn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              child: TextFormField(
                onChanged: (value) {
                  setState(
                    () {
                      age = int.tryParse(value) ?? 0;
                    },
                  );
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '32',
                  hintStyle: TextStyle(
                    color: hintColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: primaryColor), // Border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0,
                        color: secondaryColor), // Border color when focused
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Row(
              children: [
                Text(
                  'Weight',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Spacer(),
                WeightUnitDropDown(),
              ],
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.maxFinite,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    weight = double.tryParse(value) ?? 0.0;
                  });
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '65',
                  hintStyle: TextStyle(
                    color: hintColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: primaryColor), // Border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0,
                        color: secondaryColor), // Border color when focused
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Row(
              children: [
                Text(
                  'Height',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Spacer(),
                HeightUnitDropDown(),
              ],
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.maxFinite,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    height = double.tryParse(value) ?? 0;
                  });
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '179',
                  hintStyle: TextStyle(
                    color: hintColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: primaryColor), // Border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0,
                        color: secondaryColor), // Border color when focused
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}