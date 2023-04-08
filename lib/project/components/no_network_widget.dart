import 'package:connectivity_manager_with_stream_provider/connectivity_change/network_change_provider.dart';
import 'package:connectivity_manager_with_stream_provider/core/context_extensions.dart';
import 'package:connectivity_manager_with_stream_provider/core/duration_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:connectivity_manager_with_stream_provider/project/constants.dart';

class NoNetworkWidget extends ConsumerWidget {
  const NoNetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityStream = ref.watch(streamProvider);

    return connectivityStream.when(
      data: (data) => AnimatedCrossFade(
        firstChild: buildEmptySizedBox(context),
        secondChild: Material(
          child: buildErrorMessageContainer(context),
        ),
        crossFadeState:
            data ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const DurationItems.durationLow(),
      ),
      error: (error, stackTrace) => buildEmptySizedBox(context),
      loading: () => buildEmptySizedBox(context),
    );
  }

  Container buildErrorMessageContainer(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: context.width,
      height: context.dynamicHeight(0.05),
      color: context.colorScheme.primary,
      child: const Text(Constants.noNetworkMessage),
    );
  }

  SizedBox buildEmptySizedBox(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 0,
    );
  }
}
