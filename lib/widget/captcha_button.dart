import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Created by sean on 2021/7/13.
///
/// 验证码按钮
class CaptchaButton extends StatefulWidget {
  /// 构建一个倒计时验证码按钮
  const CaptchaButton({
    Key? key,
    this.duration = const Duration(seconds: 60),
    this.onTimeEnd,
    this.onTimeChanged,
  }) : super(key: key);

  /// 倒计时
  final Duration duration;

  /// 倒计时结束回调
  final VoidCallback? onTimeEnd;

  /// 倒计时
  final ValueChanged<int>? onTimeChanged;

  @override
  State<StatefulWidget> createState() => _CaptchaButtonState();
}

class _CaptchaButtonState extends State<CaptchaButton> {
  late Timer _timer;
  late int _leftTime;

  @override
  void initState() {
    _leftTime = widget.duration.inSeconds;
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = _leftTime == widget.duration.inSeconds || _leftTime == 0 ? '获取验证码' : '${_leftTime}s';
    return TextButton(
      onPressed: _startTimer,
      child: Text(text),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == widget.duration.inSeconds) {
        timer.cancel();
        widget.onTimeEnd?.call();
      }
      _leftTime = widget.duration.inSeconds - timer.tick;
      if (_leftTime > 0) {
        widget.onTimeChanged?.call(_leftTime);
      }
      setState(() {});
    });
  }
}
