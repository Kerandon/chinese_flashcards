import 'package:flutter/material.dart';
import 'package:flutter_flashcards/animations/fade_in_animation.dart';

class GuideBox extends StatelessWidget {
  const GuideBox({required this.isFirst, Key? key}) : super(key: key);

  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightPadding = size.height * 0.20;
    final widthPadding = size.width * 0.10;
    return FadeInAnimation(
      child: AlertDialog(
        insetPadding: EdgeInsets.fromLTRB(
            widthPadding, heightPadding, widthPadding, heightPadding),
        content: Column(
          children: [
            if (isFirst) ...[
              const Text(
                'Double Tap\nTo Reveal Answer',
                textAlign: TextAlign.center,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset('assets/images/GuideDoubleTap.png'),
              ))
            ] else ...[
              Expanded(
                child: Row(
                  children: const [
                    GuideSwipe(
                      isLeft: true,
                    ),
                    GuideSwipe(
                      isLeft: false,
                    ),
                  ],
                ),
              )
            ]
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            width: size.width * 0.50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  child: const Text('Got It!')),
            ),
          )
        ],
      ),
    );
  }
}

class GuideSwipe extends StatelessWidget {
  const GuideSwipe({
    required this.isLeft,
    Key? key,
  }) : super(key: key);

  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          isLeft
              ? const Text(
                  'Swipe Left\nIf Incorrect',
                  textAlign: TextAlign.left,
                )
              : const Text(
                  'Swipe Right\nIf Correct',
                  textAlign: TextAlign.right,
                ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: isLeft
                      ? Image.asset('assets/images/GuideLeftSwipe.png')
                      : Image.asset('assets/images/GuideRightSwipe.png')))
        ],
      ),
    );
  }
}
