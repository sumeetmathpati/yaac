import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/widgets/header_inputs.dart';
import 'package:yaac/widgets/param_inputs.dart';

import 'auth_input.dart';
import 'body_input.dart';

class RequestBodyInput extends ConsumerWidget {
  const RequestBodyInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Params'),
                Tab(text: 'Headers'),
                Tab(text: 'Auth'),
                Tab(text: 'Body'),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TabBarView(
                  children: [
                    ParamInputs(),
                    HeaderInputs(),
                    AuthInput(),
                    BodyInput(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
