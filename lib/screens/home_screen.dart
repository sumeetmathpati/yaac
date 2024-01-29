import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/widgets/request_url_input.dart';

import '../widgets/constants.dart';
import '../widgets/file_explorer.dart';
import '../widgets/request_body_input.dart';
import '../widgets/request_body_output.dart';
import '../widgets/request_tabs.dart';


class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final List drawerItems = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Row(
        children: [
          FileExplorer(),
          kWidth16,
          Expanded(
            child: Column(
              children: [
                // RequestTabs(),
                Padding(padding: EdgeInsets.all(8), child: RequestUrlInput(),),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        RequestBodyInput(),
                        Container(
                          width: 2,
                          height: double.infinity,
                          color: Theme.of(context).colorScheme.background,
                        ),
                        RequestBodyOutput(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          kWidth16
        ],
      ),
    );
  }
}
