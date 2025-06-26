import 'package:flutter/material.dart';

///A controller for updating the single digit displayed by [_DigitSlide]
class _DigitSlideController extends ValueNotifier {
  String? _number;

  _DigitSlideController({String num = '0'}) : super(num) {
    _number = num;
  }

  String? get number => _number;

  set number(String? num) {
    _number = num;
    super.value = num;
  }
}

///A widget for displaying a single digit.
class DigitSlide extends StatelessWidget {
  final Color backgroundColor;

  final Curve curve;

  final Duration duration;

  final String initialNumber;

  late ScrollController scrollController;

  final TextStyle textStyle;

  final _DigitSlideController controller;

  DigitSlide(
      {this.backgroundColor = Colors.transparent,
      this.curve = Curves.ease,
      required this.controller,
      required this.initialNumber,
      required this.textStyle,
      required this.duration})
      : super(key: Key(controller.toString())) {
    scrollController = ScrollController(
        initialScrollOffset: textStyle.fontSize! * (9 / 10) * _initOffset());
    controller.addListener(onValueChanged);
  }

  int _initOffset() {
    if (_isNumber(initialNumber)) {
      return int.parse(initialNumber);
    }
    return 0;
  }

  bool _isNumber(String? num) {
    if (num != null && num.length == 1) {
      int digit = num.codeUnitAt(0) - 48;
      if (digit >= 0 && digit <= 9) {
        return true;
      }
    }

    return false;
  }

  ///Scrolls to the positions of the new number.
  void onValueChanged() {
    if (scrollController.hasClients) {
      if (_isNumber(controller.number)) {
        int digit = controller.number!.codeUnitAt(0) - 48;
        scrollController.animateTo(digit * textStyle.fontSize! * (9 / 10),
            duration: duration, curve: curve);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        return true;
      },
      child: Container(
          color: backgroundColor,
          height: textStyle.fontSize! * (9 / 10),
          width: _isNumber(controller.number)
              ? textStyle.fontSize! * (6.5 / 10)
              : textStyle.fontSize! * (3 / 10),
          child: Stack(
            children: [
              _isNumber(controller.number)
                  ? ListView(
                      controller: scrollController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (var i in List.generate(10, (index) => index))
                          SizedBox(
                            height: textStyle.fontSize! * (9 / 10),
                            child: Center(
                              child: Text("$i", style: textStyle),
                            ),
                          )
                      ],
                    )
                  : SizedBox(
                      height: textStyle.fontSize! * (9 / 10),
                      child: Center(
                        child: Text(controller.number!, style: textStyle),
                      ),
                    )
            ],
          )),
    );
  }
}

class NumberSlideController extends ValueNotifier {
  String? _number;

  NumberSlideController() : super(0) {
    _number = '0';
  }

  String? get number => _number;

  set number(String? num) {
    _number = num;
    super.value = num;
  }
}

class NumberSlide extends StatefulWidget {
  final Color backgroundColor;
  final Curve curve;
  final String initialNumber;
  final Duration duration;
  final NumberSlideController controller;
  final TextStyle textStyle;

  NumberSlide(
      {super.key,
      this.backgroundColor = Colors.transparent,
      this.curve = Curves.ease,
      required this.controller,
      this.textStyle = const TextStyle(color: Colors.black, fontSize: 12),
      required this.initialNumber,
      this.duration = const Duration(milliseconds: 300)}) {
    controller.number = initialNumber;
  }

  @override
  NumberSlideState createState() => NumberSlideState();
}

class NumberSlideState extends State<NumberSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late String currentNumString;

  bool shorter = false, longer = false;

  List<_DigitSlideController> digitControllers = [];

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    var numString = widget.initialNumber;

    currentNumString = numString;

    for (int i = 0; i < numString.length; i++) {
      var digit = numString[i];
      digitControllers.insert(i, _DigitSlideController(num: digit));
    }

    widget.controller.addListener(onNumberChanged);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (shorter) {
            while (currentNumString.length < digitControllers.length) {
              digitControllers.removeLast();
            }
          }

          longer = false;
          shorter = false;
        });
        animationController.value = 0;
      }
    });

    super.initState();
  }

  ///Updates the number when notified.
  onNumberChanged() {
    if (animationController.isAnimating) {
      animationController.notifyStatusListeners(AnimationStatus.completed);
    }

    var numString = widget.controller.number;

    bool shorter = false;
    bool longer = false;

    if (numString!.length < currentNumString.length) {
      int shortLength = currentNumString.length - numString.length;
      for (int i = digitControllers.length - 1; i >= shortLength; i--) {
        digitControllers[i].number = '';
      }

      shorter = true;
    } else if (numString.length > currentNumString.length) {
      for (int i = 0; i < numString.length - currentNumString.length; i++) {
        digitControllers.insert(i, _DigitSlideController(num: numString[i]));
      }

      longer = true;
    }

    int startIndex = 0;

    if (longer) {
      startIndex = numString.length - currentNumString.length;
    }

    for (int i = startIndex; i < numString.length; i++) {
      var digit = numString[i];
      var oldDigit =
          longer ? currentNumString[i - startIndex] : currentNumString[i];

      if (digit != oldDigit) {
        digitControllers[i].number = digit;
      }
    }

    currentNumString = numString;

    if (shorter || longer) {
      animationController.forward();
    }
    this.shorter = shorter;
    this.longer = longer;
  }

  @override
  Widget build(BuildContext context) {
    var width = widget.textStyle.fontSize! * (6.5 / 10);
    return AnimatedBuilder(
        animation: animationController,
        builder: (_, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  color: widget.backgroundColor,
                  width: longer ? (animationController.value) * width : width,
                  child: digitControllers.first == null
                      ? const Text(' ')
                      : DigitSlide(
                          backgroundColor: widget.backgroundColor,
                          controller: digitControllers.first,
                          curve: widget.curve,
                          duration: widget.duration,
                          textStyle: widget.textStyle,
                          initialNumber: currentNumString[0],
                        )),
              for (int i = 1; i < digitControllers.length - 1; i++)
                digitControllers[i] == null
                    ? const Text(' ')
                    : DigitSlide(
                        backgroundColor: widget.backgroundColor,
                        controller: digitControllers[i],
                        curve: widget.curve,
                        duration: widget.duration,
                        textStyle: widget.textStyle,
                        initialNumber: i == currentNumString.length
                            ? '0'
                            : currentNumString[i]),
              if (digitControllers.length > 1)
                SizedBox(
                  width:
                      shorter ? (1 - animationController.value) * width : width,
                  child: digitControllers.last == null
                      ? const Text(' ')
                      : DigitSlide(
                          backgroundColor: widget.backgroundColor,
                          controller: digitControllers.last,
                          curve: widget.curve,
                          duration: widget.duration,
                          textStyle: widget.textStyle,
                          initialNumber:
                              currentNumString[currentNumString.length - 1]),
                ),
            ],
          );
        });
  }
}
