import 'package:flutter/material.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  String? value;

  // Edit the grid of questions here
  final List<String> quizItems = ['Q1', 'Q2', 'Q3', 'Q4', 'Q5'];

  TextEditingController option1controller = new TextEditingController();
  TextEditingController option2controller = new TextEditingController();
  TextEditingController option3controller = new TextEditingController();
  TextEditingController option4controller = new TextEditingController();
  TextEditingController optionCorrectController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Add Quiz",
          style: TextStyle(
              color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              const Text(
                "Upload the Quiz Picture",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Option 1
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: option1controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 1",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              // Option 2
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: option2controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 2",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              // Option 3
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: option3controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 3",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              // Option 4
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: option4controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 4",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              const Text(
                "Correct Answer",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: optionCorrectController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Option 4",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  items: quizItems
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          )))
                      .toList(),
                  onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
