import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nufit/service/database.dart';

class Question extends StatefulWidget {
  String category;
  Question({required this.category});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool show = false;
  getontheload() async {
    QuizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Stream? QuizStream;
  PageController controller = PageController();

  Widget allQuiz() {
    return StreamBuilder(
        stream: QuizStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? PageView.builder(
                  controller: controller,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        ds["Image"],
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ))),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      ds["question"],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              // Option 1
                              GestureDetector(
                                  onTap: () {
                                    show = true;
                                    setState(() {});
                                  },
                                  child: show
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] ==
                                                          ds["option1"]
                                                      ? Colors.green
                                                      : Colors.red),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            ds["option1"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            ds["option1"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                              const SizedBox(
                                height: 15,
                              ),
                              // Options 2
                              GestureDetector(
                                  onTap: () {
                                    show = true;
                                    setState(() {});
                                  },
                                  child: show
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] ==
                                                          ds["option2"]
                                                      ? Colors.green
                                                      : Colors.red),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            ds["option2"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            ds["option2"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                              const SizedBox(
                                height: 15,
                              ),
                              // Option 3
                              GestureDetector(
                                  onTap: () {
                                    show = true;
                                    setState(() {});
                                  },
                                  child: show
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] ==
                                                          ds["option3"]
                                                      ? Colors.green
                                                      : Colors.red),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            ds["option3"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            ds["option3"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                              const SizedBox(
                                height: 15,
                              ),
                              // Option 4
                              GestureDetector(
                                  onTap: () {
                                    show = true;
                                    setState(() {});
                                  },
                                  child: show
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] ==
                                                          ds["option4"]
                                                      ? Colors.green
                                                      : Colors.red),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            ds["option4"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            ds["option4"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Icon(Icons.arrow_forward),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(60)),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 80.0,
                  ),
                  Text(
                    widget.category,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: allQuiz()),
          ],
        ),
      ),
    );
  }
}
