import 'package:flutter/material.dart';

class FileSystem extends StatefulWidget {
  const FileSystem({Key key}) : super(key: key);

  @override
  _FileSystemState createState() => _FileSystemState();
}

class _FileSystemState extends State<FileSystem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('File System'),
      ),
    );
  }
}
