import 'package:flutter/material.dart';
import 'package:flutter_flashcards/configs/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../models/word.dart';

class TTSButton extends StatefulWidget {
  const TTSButton({Key? key, required this.word, this.iconSize = 50})
      : super(key: key);

  final Word word;
  final double iconSize;

  @override
  State<TTSButton> createState() => _TTSButtonState();
}

class _TTSButtonState extends State<TTSButton> {
  bool _isTapped = false;
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _setUpTts();
    });

    super.initState();
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: IconButton(
            onPressed: () {
              _runTts(text: widget.word.character);
              _isTapped = true;
              setState(() {});
              Future.delayed(const Duration(milliseconds: 500), () {
                _isTapped = false;
                setState(() {});
              });
            },
            icon: Icon(
              Icons.audiotrack,
              size: widget.iconSize,
              color: _isTapped ? kYellow : Colors.white,
            )));
  }

  _setUpTts() async {
    await _tts.setLanguage('zh-Cn');
    await _tts.setSpeechRate(0.40);
  }

  _runTts({required String text}) async {
    await _tts.speak(text);
  }
}
