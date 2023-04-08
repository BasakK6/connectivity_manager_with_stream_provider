import 'package:flutter/material.dart';
import 'components/no_network_widget.dart';

class MainBuilder {
  MainBuilder._privateConstructor();

  static Widget build(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(
          child: child!,
        ),
        const NoNetworkWidget(),
      ],
    );
  }
}
