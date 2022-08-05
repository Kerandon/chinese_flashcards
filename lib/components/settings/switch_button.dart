import 'package:flutter/material.dart';
import 'package:flutter_flashcards/utils/methods.dart';
import 'package:provider/provider.dart';

import '../../enums/settings.dart';
import '../../notifiers/settings_notifier.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    required this.displayOption,
    this.disabled = false,
    Key? key,
  }) : super(key: key);

  final Settings displayOption;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (_, notifier, __) => Column(
        children: [
          SwitchListTile(
              inactiveThumbColor: Colors.black.withOpacity(0.50),
              tileColor: disabled
                  ? Colors.black.withOpacity(0.10)
                  : Colors.transparent,
              title: Text(displayOption.toText()),
              value: notifier.displayOptions.entries
                  .firstWhere((element) => element.key == displayOption)
                  .value,
              onChanged: disabled
                  ? null
                  : (value) {
                      notifier.updateDisplayOptions(
                          displayOption: displayOption, isToggled: value);
                    }),
          const Divider(
            height: 1,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
