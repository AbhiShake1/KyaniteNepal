import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final List<Widget> children;

  const AppListView({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics().applyTo(
        const AlwaysScrollableScrollPhysics(),
      ),
      children: children,
    );
  }
}
