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
  final double width;
  final double height;
  final Function(bool) onChanged;

  const FlareCheckbox({
    Key key,
    @required this.onChanged,
    this.tristate = false,
    this.animation,
    bool value,
    this.width,
    this.height,
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
    Widget child = FlareActor(
      widget.animation,
      fit: BoxFit.contain,
      shouldClip: false,
      animation: currentState == null ? FlareCheckbox.unknownAnimationName : (currentState ? FlareCheckbox.onAnimationName : FlareCheckbox.offAnimationName),
    );
    if (widget.width != null || widget.height != null) {
      child = Container(
        width: widget.width,
        height: widget.height,
        child: child,
      );
    }
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
      child: child,
    );
  }
}
