import 'package:flutter/material.dart';
import 'package:flutter_flashcards/enums/language_type.dart';

class ReviewNotifier extends ChangeNotifier {
  bool showImage = true,
      showEnglish = true,
      showCharacter = false,
      showPinyin = false,
      buttonsAreDisabled = false;

  disableButtons({required bool disable}) {
    buttonsAreDisabled = disable;
    notifyListeners();
  }

  updateShowLanguage({required LanguageType language}) {
    switch (language) {
      case LanguageType.image:
        showImage = !showImage;
        break;
      case LanguageType.english:
        showEnglish = !showEnglish;
        break;
      case LanguageType.character:
        showCharacter = !showCharacter;
        break;
      case LanguageType.pinyin:
        showPinyin = !showPinyin;
        break;
    }

    notifyListeners();
  }
}
