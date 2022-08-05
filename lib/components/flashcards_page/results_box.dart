import 'package:flutter/material.dart';
import 'package:flutter_flashcards/databases/database_manager.dart';
import 'package:flutter_flashcards/notifiers/flashcards_notifier.dart';
import 'package:flutter_flashcards/pages/flashcards_page.dart';
import 'package:flutter_flashcards/utils/methods.dart';
import 'package:provider/provider.dart';
import '../../pages/home_page.dart';

class ResultsBox extends StatefulWidget {
  const ResultsBox({Key? key}) : super(key: key);

  @override
  State<ResultsBox> createState() => _ResultsBoxState();
}

class _ResultsBoxState extends State<ResultsBox> {
  bool _haveSavedCards = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FittedBox(
          child: AlertDialog(
            actionsPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            title: Text(
              notifier.isSessionCompleted
                  ? 'Session Completed!'
                  : 'Round Completed!',
              textAlign: TextAlign.center,
            ),
            actions: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(1),
                },
                children: [
                  buildTableRow(
                      title: 'Total Rounds',
                      stat: notifier.roundTally.toString()),
                  buildTableRow(
                      title: 'No. Cards', stat: notifier.cardTally.toString()),
                  buildTableRow(
                      title: 'No. Correct',
                      stat: notifier.correctTally.toString()),
                  buildTableRow(
                      title: 'No. Incorrect',
                      stat: notifier.incorrectTally.toString()),
                  buildTableRow(
                      title: 'Correct Percentage',
                      stat: '${notifier.correctPercentage.toString()}%'),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      notifier.isSessionCompleted
                          ? const SizedBox()
                          : ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FlashcardsPage(),
                                  ),
                                );
                              },
                              child: const Text('Retest Incorrect Cards')),
                      notifier.isSessionCompleted
                          ? const SizedBox()
                          : ElevatedButton(
                              onPressed: _haveSavedCards
                                  ? null
                                  : () async {
                                      for (int i = 0;
                                          i < notifier.incorrectCards.length;
                                          i++) {
                                        await DatabaseManager().insertWord(
                                            word: notifier.incorrectCards[i]);
                                      }
                                      _haveSavedCards = true;
                                      runQuickBox(
                                          context: context,
                                          text: 'Incorrect Cards Saved!');
                                      Future.delayed(const Duration(milliseconds: 1000), () {
                                        if(!mounted)return;
                                        Navigator.maybePop(context);
                                      });
                                      setState(() {});
                                    },
                              child: const Text('Save Incorrect Cards')),
                      ElevatedButton(
                          onPressed: () {
                            notifier.reset();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          },
                          child: const Text('Home'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildTableRow({required String title, required String stat}) {
    return TableRow(children: [
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          stat,
          textAlign: TextAlign.right,
        ),
      )),
    ]);
  }
}
