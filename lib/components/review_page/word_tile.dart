import 'package:flutter/material.dart';
import 'package:flutter_flashcards/components/app/tts_button.dart';
import 'package:flutter_flashcards/configs/constants.dart';
import 'package:flutter_flashcards/notifiers/review_notifier.dart';
import 'package:provider/provider.dart';
import '../../models/word.dart';

class WordTile extends StatelessWidget {
  WordTile({
    required this.word,
    required this.animation,
    this.onPressed,
    required this.index,
    Key? key,
  }) : super(key: key);

  final Word word;

  final Animation animation;
  final _tweenOffsetLeft =
      Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
  final _tweenOffsetRight =
      Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
  final VoidCallback? onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation
          .drive(CurveTween(curve: Curves.easeInOutSine))
          .drive(index % 2 == 0 ? _tweenOffsetRight : _tweenOffsetLeft),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        child: Consumer<ReviewNotifier>(
          builder: (_, notifier, __) => Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(kCircularBorderRadius),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                )),
            child: ListTile(
              leading: notifier.showImage
                  ? SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/${word.english}.png'),
                      ))
                  : const SizedBox(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  notifier.showEnglish ? Text(word.english) : const SizedBox(),
                  notifier.showCharacter
                      ? Text(word.character)
                      : const SizedBox(),
                  notifier.showPinyin ? Text(word.pinyin) : const SizedBox(),
                ],
              ),
              trailing: SizedBox(
                width: 80,
                child: Row(
                  children: [
                    TTSButton(
                      word: word,
                      iconSize: 25,
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          onPressed?.call();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
