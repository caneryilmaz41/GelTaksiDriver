import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EaringTabPage extends StatefulWidget {
  const EaringTabPage({super.key});

  @override
  State<EaringTabPage> createState() => _EaringTabPageState();
}

class _EaringTabPageState extends State<EaringTabPage> {
  @override
  Widget build(BuildContext context) {
     return Center(
      child:Text('Ücret'),
    );
  }
}