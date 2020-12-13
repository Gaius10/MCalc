import 'package:flutter/material.dart';
import 'package:mcalc/screens/WorkspacesRoom.dart';
import 'package:mcalc/screens/AddWorkspace.dart';

void main() {
  runApp(MaterialApp(
    title: "MCalc",
    routes: {
      '/': (context) => WorkspacesRoom(),
      '/addWorkspace': (context) => AddWorkspaceScreen(),
    },
  ));
}
