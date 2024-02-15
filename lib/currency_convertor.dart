import 'package:flutter/material.dart';
import './profile_page.dart';
import './test_page.dart';

class CurrencyConvertor extends StatelessWidget {
  const CurrencyConvertor({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: const Color.fromARGB(255, 201, 139, 139),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        titleSpacing: 80.0, // Add space between the title and leading icon
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TestPage(),
              ),
            );
          },
          child: const Text(
            "Test",
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          IconButton(
            icon: const CircleAvatar(),
            onPressed: () {
              //Navigate to Profile Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 8.0,
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            "Male",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 8.0,
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            "Female",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Image.network(
                        'https://img.freepik.com/free-vector/man-character-standing-icon_24877-81729.jpg?w=740&t=st=1707931122~exp=1707931722~hmac=1553a89edb59ee28733542562bd1075785b97931ddde25e289b31ea71b05be79',
                      ),
                    ),
                  ),
                  //Right Side Column Begins
                  Expanded(
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
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: '32',
                                border: OutlineInputBorder(),
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
                              DropDown(),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          SizedBox(
                            width: double.maxFinite,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '179',
                                border: OutlineInputBorder(),
                              ),
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
                              DropDown(),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          SizedBox(
                            width: double.maxFinite,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '179',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 64,
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
                      ),
                      onPressed: () {
                        // Add your button onPressed functionality here
                      },
                      child: const Text(
                        'Gradient Button',
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

class DropDown extends StatelessWidget {
  const DropDown({super.key});
  final String selectedUnit = 'cm';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedUnit,
      onChanged: (String? newValue) {
        // if (newValue != null) {
        //   setState(() {
        //     selectedUnit = newValue;
        //   });
        // }
      },
      items: <String>['cm', 'm'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
