

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/files_provider.dart';
import 'package:yaac/models/files.dart';
import 'constants.dart';

class FileExplorer extends ConsumerWidget {
  const FileExplorer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    FileModel dir = ref.watch(filesProvider);
    var files =  dir.list();

    return Drawer(
      child: ListView.builder(
        itemCount:files.length,
        itemBuilder: (BuildContext context, int i) {
          return Tooltip(
            message: files[i].path,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primary
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                shape: const RoundedRectangleBorder()
              ),
              onPressed: () {},
              child: Padding(
                padding: padding16,
                child: Row(
                  children: [
                    files[i].icon(),
                    kWidth16,
                    Text(files[i].type(), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
