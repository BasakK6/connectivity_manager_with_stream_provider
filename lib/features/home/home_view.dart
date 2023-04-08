import 'package:connectivity_manager_with_stream_provider/connectivity_change/network_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../project/constants.dart';
import 'components/colored_message_box.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(ref),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(Constants.homeViewTitle),
    );
  }

  Center buildBody(WidgetRef ref) {
    final connectivityStream = ref.watch(streamProvider);

    return Center(
      child: connectivityStream.when(
        data: (data) => data
            ? const ColoredMessageBox(
                color: Colors.green,
                message: Constants.homeViewPositiveMessage,
              )
            : const ColoredMessageBox(
                color: Colors.red,
                message: Constants.homeViewNegativeMessage,
              ),
        error: (error, stackTrace) => const ColoredMessageBox(
          color: Colors.grey,
          message: Constants.homeViewErrorMessage,
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

