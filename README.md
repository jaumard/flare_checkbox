# flare_checkbox

Checkbox widget with two or three state animation with a Flare animation of your choice 

## Usage

```dart
FlareCheckbox(
  animation: 'assets/checkbox.flr',
  value: true,
),
```

You can customize the widget with: 

`animation`: path/name to your flare animation

`animationOn`: animation name of on state, default to On

`animationOff`: animation name of off state, default to Off 

`animationUnknown`: animation name of unknown state, default to Unknown

`value`: null, false or true

`width`: force width of the animation

`height`: force height of the animation

`tristate`: true/false to enable null as an initial value

`onChanged`: callback whenever to checkbox change his state

if `tristate` is false and `value` is null, it will be set to false

## How it works

To make your flare animation compatible with this widget it's simple:
 
 - when `value` is true the animation `On` is called
 - when `value` is false the animation `Off` is called
 - when `value` is null and `tristate` true the animation `Unknown` is called