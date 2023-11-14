import 'package:flutter/material.dart';

mixin DelayProviderMixin {
  void delay();
}

class DelayProvider with DelayProviderMixin {
  const DelayProvider(this.onComplete);
  
  final VoidCallback onComplete;

  static const Duration delayInterval = Duration(milliseconds: 500);

  @override
  void delay() {
    WidgetsBinding.instance.endOfFrame.then((_) {
      Future.delayed(delayInterval, onComplete);
    });
  }
}
