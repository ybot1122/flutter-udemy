import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SummaryRowQuestionNumber(
                      number: ((data['question_index'] as int) + 1).toString(),
                      isCorrect: data['user_answer'] == data['correct_answer'],
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: Column(
                        children: [
                          _SummaryRowItem(
                              text: data['question'] as String,
                              color: Colors.white),
                          const SizedBox(height: 10),
                          _SummaryRowItem(
                              text: data['user_answer'] as String,
                              color: const Color.fromARGB(255, 198, 112, 213)),
                          _SummaryRowItem(
                              text: data['correct_answer'] as String,
                              color: const Color.fromARGB(255, 153, 203, 243)),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class _SummaryRowItem extends StatelessWidget {
  const _SummaryRowItem({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: color,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _SummaryRowQuestionNumber extends StatelessWidget {
  const _SummaryRowQuestionNumber(
      {required this.number, required this.isCorrect});

  final String number;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCorrect ? Colors.green : Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(number),
          ),
        ),
      ],
    );
  }
}
