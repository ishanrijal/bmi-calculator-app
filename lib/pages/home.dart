import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'bmi_result.dart';

/// Defined the Primary, Secondary, and Tertiary Color for the App.
Color primaryColor = const Color.fromARGB(255, 201, 139, 139);
Color secondaryColor = const Color.fromARGB(255, 57, 67, 161);
Color hintColor = const Color.fromARGB(255, 227, 191, 191);

///This is where all the states are defined. It is used for handling the states.
class HomeController extends GetxController {
  // Define Rx variables
  var selectedGender = 'male'.obs;
  var age = 0.obs;
  var weight = 0.0.obs;
  var height = 0.0.obs;
  var weightUnit = 'kg'.obs;
  var heightUnit = 'cm'.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void calculateBMI() {
    List<String> missingFields = [];
    // Check for missing fields
    if (age.value == 0) missingFields.add('Age');
    if (weight.value == 0.0) missingFields.add('Weight');
    if (height.value == 0.0) missingFields.add('Height');

    if (missingFields.isNotEmpty) {
      String errorMessage =
          'Please fill the following fields: ${missingFields.join(', ')}';
      // Show error message
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        messageText: Text(
          errorMessage,
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        backgroundColor:
            Colors.red[400], // Customize background color if needed
        margin: EdgeInsets.zero, // Remove default margin
        padding: const EdgeInsets.only(bottom: 12.0, left: 8.0, right: 8.0),
        borderRadius: 0, // Remove border radius
      );
    } else {
      // Navigate to BMI Result screen
      Get.to(BmiResult(
        age: age.value,
        gender: selectedGender.value,
        weight: weight.value,
        height: height.value,
        weightUnit: weightUnit.value,
        heightUnit: heightUnit.value,
      ));
    }
  }
}

/// Home screen that allows users to input their BMI parameters.
/// We need to play with the states, thats why Home is using the StatefulWidget
class Home extends StatelessWidget {
  Home({super.key});

  final HomeController controller =
      Get.put(HomeController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),

      /// Used SingleChildScrollView Widget to prevent the Widget's overflow by allowing the body to be scrollable.
      /// When User press the inputbox, then the keyboard will popup. This might lead to overflow. So, to prevent it, I have used this widget.

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Row(
                children: [
                  MaleButton(),
                  FemaleButton(),
                ],
              ),
              const SizedBox(height: 16.0),
              const Row(
                children: [
                  LeftSideColumn(),
                  RightSideColumn(),
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
                        backgroundColor:
                            MaterialStateProperty.all<Color>(secondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                      onPressed: () => {
                        controller.calculateBMI(),
                      },
                      child: const Text(
                        'Calculate BMI',
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

class MaleButton extends StatelessWidget {
  const MaleButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Expanded(
        child: InkWell(
          onTap: () => controller.selectGender('male'),
          child: Obx(() {
            return Container(
              decoration: BoxDecoration(
                color: controller.selectedGender.value == 'male'
                    ? secondaryColor
                    : Colors.white,
                border: Border.all(
                  color: controller.selectedGender.value == 'male'
                      ? Colors.white
                      : primaryColor,
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
                    color: controller.selectedGender.value == 'male'
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "Male",
                    style: TextStyle(
                      color: controller.selectedGender.value == 'male'
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class FemaleButton extends StatelessWidget {
  const FemaleButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Expanded(
        child: InkWell(
          onTap: () => controller.selectGender('female'),
          child: Obx(() {
            return Container(
              decoration: BoxDecoration(
                color: controller.selectedGender.value == 'male'
                    ? Colors.white
                    : secondaryColor,
                border: Border.all(
                  color: controller.selectedGender.value == 'male'
                      ? primaryColor
                      : Colors.white,
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
                    color: controller.selectedGender.value == 'male'
                        ? Colors.black
                        : Colors.white,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "Female",
                    style: TextStyle(
                      color: controller.selectedGender.value == 'male'
                          ? Colors.black
                          : Colors.white,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class LeftSideColumn extends StatelessWidget {
  const LeftSideColumn({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>(); // Find HomeController

    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(right: 26.0, top: 24),
        child: AspectRatio(
          aspectRatio: 1 / 3,
          child: Obx(() {
            String imagePath = controller.selectedGender.value == 'male'
                ? 'assets/male.png'
                : 'assets/female.png';
            return Image.asset(
              imagePath,
            );
          }),
        ),
      ),
    );
  }
}

class RightSideColumn extends StatefulWidget {
  const RightSideColumn({Key? key}) : super(key: key);

  @override
  RightSideColumnState createState() => RightSideColumnState();
}

class RightSideColumnState extends State<RightSideColumn> {
  int age = 0;
  double weight = 0.0;
  double height = 0.0;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find(); // Access the HomeController

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
                  setState(() {
                    age = int.tryParse(value) ?? 0;
                  });
                  controller.age.value = age; // Update age in HomeController
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '32',
                  hintStyle: TextStyle(
                    color: hintColor,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
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
                  controller.weight.value =
                      weight; // Update weight in HomeController
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '65',
                  hintStyle: TextStyle(
                    color: hintColor,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
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
                    height = double.tryParse(value) ?? 0.0;
                  });
                  controller.height.value =
                      height; // Update height in HomeController
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '179',
                  hintStyle: TextStyle(
                    color: hintColor,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
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

/// Stateful Widget for selecting the Weight Unit i.e. either kg or pound(lb)
class WeightUnitDropDown extends StatelessWidget {
  const WeightUnitDropDown({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find(); // Access the HomeController

    return Obx(() {
      return DropdownButton<String>(
        value: controller.weightUnit.value,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.weightUnit.value = newValue;
          }
        },
        items:
            <String>['kg', 'lb'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}

/// Stateful widget for the Height Unit Selection
class HeightUnitDropDown extends StatelessWidget {
  const HeightUnitDropDown({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find(); // Access the HomeController

    return Obx(() {
      return DropdownButton<String>(
        value: controller.heightUnit.value,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.heightUnit.value = newValue;
          }
        },
        items:
            <String>['cm', 'ft'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
