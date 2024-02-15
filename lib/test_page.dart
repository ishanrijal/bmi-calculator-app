import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EHLLo"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: Image.network(
                    "https://img.freepik.com/free-vector/isolated-young-handsome-man-set-different-poses-white-background-illustration_632498-649.jpg?w=740&t=st=1708011784~exp=1708012384~hmac=3e967be3116f156ca1e15d106452e9b62fc75f5c30764eac90f8d4a7c04a4779"),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Column(
                children: [
                  Column(
                    children: [Text("data")],
                  ),
                  Column(
                    children: [Text("data")],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
