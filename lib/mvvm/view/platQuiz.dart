import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lord_school/mvvm/const/const.dart';


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  List<Map<String, dynamic>> _questions = [];


  void _fetchQuestions() {
    FirebaseFirestore.instance
        .collection('questions')
        .get()
        .then((querySnapshot) {
      setState(() {
        _questions = querySnapshot.docs.map((doc) => doc.data()).toList();
      });
    });
  }

  void _answerQuestion(bool isCorrect) {
    print('Correct answer: ${_questions[_questionIndex]['answers'].firstWhere((answer) => answer['correct'])['text']}');
    setState(() {
      _questionIndex++;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mcolor,
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await FirebaseFirestore.instance.collection('questions').add({
          'questionText': 'What is the largest ocean on Earth?',
          'answers': [
            {'text': 'Atlantic', 'correct': false},
            {'text': 'Indian', 'correct': false},
            {'text': 'Arctic', 'correct': false},
            {'text': 'Pacific', 'correct': true},
          ],
        });
      },child: Icon(Icons.send),),
      appBar: AppBar(
        backgroundColor: Mcolor,
         elevation: 0,
         leading: Container(),
        title: const Text('Quiz App'),
      ),
      body: _questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _questionIndex < _questions.length
          ? Column(
            children: [
              Text("Questions${ _questions[_questionIndex].length} /${ _questions.length.toString()}", style: const TextStyle(
                color: Colors.white, fontSize: 30
              ),),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.50,
                    child: Text(
                      _questions[_questionIndex]['questionText'].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...(_questions[_questionIndex]['answers']
                  )
                      .map((answer) => Answer(
                    text: answer['text'].toString(),
                    isCorrect: answer['correct'] == true,
                    onPressed: () =>
                        _answerQuestion(answer['correct'] == true),
                  ))
                      .toList(),
        ],
      ),
                ),
              ),
            ],
          )
          : const Center(
        child: Text(
          'You have completed the quiz!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String text;
  final bool isCorrect;
  final VoidCallback onPressed;

  const Answer({
    Key? key,
    required this.text,
    required this.isCorrect,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(30, 20),
        primary: isCorrect ? Colors.white : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(text, style: const TextStyle(color: Colors.grey),),
    );
  }
}
