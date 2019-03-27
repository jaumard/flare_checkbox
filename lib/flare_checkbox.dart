library flare_checkbox;

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/widgets.dart';

class FlareCheckbox extends StatefulWidget {
  static const _onAnimationName = 'On';
  static const _offAnimationName = 'Off';
  static const _unknownAnimationName = 'Unknown';
  final String animation;
  final String animationOn;
  final String animationOff;
  final String animationUnknown;
  final bool value;
  final bool tristate;
  final double width;
  final double height;
  final Function(bool) onChanged;

  const FlareCheckbox({
    Key key,
    this.onChanged,
    this.tristate = false,
    this.animation,
    bool value,
    this.width,
    this.height,
    this.animationOn = _onAnimationName,
    this.animationOff = _offAnimationName,
    this.animationUnknown = _unknownAnimationName,
  })  : this.value = value ?? (tristate ? null : false),
        super(key: key);

  @override
  _FlareCheckboxState createState() => _FlareCheckboxState();
}

class _FlareCheckboxState extends State<FlareCheckbox> {
  bool currentState;
  bool _snapToEnd = true;
  FlareController _controller;

  @override
  void initState() {
    currentState = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(FlareCheckbox oldWidget) {
    if (currentState != widget.value) {
      setState(() {
        _snapToEnd = false;
        currentState = widget.value;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = FlareActor(
      widget.animation,
      fit: BoxFit.contain,
      shouldClip: false,
      snapToEnd: _snapToEnd,
      controller: _controller,
      animation: currentState == null ? widget.animationUnknown : (currentState ? widget.animationOn : widget.animationOff),
    );
    if (widget.width != null || widget.height != null) {
      child = SizedBox(
        width: widget.width,
        height: widget.height,
        child: child,
      );
    }
    return GestureDetector(
      onTap: widget.onChanged == null
          ? null
          : () {
        setState(() {
          _snapToEnd = false;
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
