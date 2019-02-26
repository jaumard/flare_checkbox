library flare_checkbox;

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/widgets.dart';

class FlareCheckbox extends StatefulWidget {
  static const onAnimationName = 'On';
  static const offAnimationName = 'Off';
  static const unknownAnimationName = 'Unknown';
  final String animation;
  final bool value;
  final bool tristate;
  final Function(bool) onChanged;

  const FlareCheckbox({
    Key key,
    this.tristate = false,
    this.animation,
    bool value,
    this.onChanged,
  })  : this.value = value ?? (tristate ? null : false),
        super(key: key);

  @override
  _FlareCheckboxState createState() => _FlareCheckboxState();
}

class _FlareCheckboxState extends State<FlareCheckbox> {
  bool currentState;

  @override
  void initState() {
    currentState = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(FlareCheckbox oldWidget) {
    if (currentState != widget.value) {
      currentState = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (currentState == null) {
            currentState = true;
          } else {
            currentState = !currentState;
          }
          widget.onChanged(currentState);
        });
      },
      child: FlareActor(
        widget.animation,
        animation: currentState == null ? FlareCheckbox.unknownAnimationName : (currentState ? FlareCheckbox.onAnimationName : FlareCheckbox.offAnimationName),
      ),
    );
  }
}
