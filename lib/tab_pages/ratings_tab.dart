import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RatingsTabPage extends StatefulWidget {
  const RatingsTabPage({super.key});

  @override
  State<RatingsTabPage> createState() => _RatingsTabPageState();
}

class _RatingsTabPageState extends State<RatingsTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text('Ratings'),
    );
  }
}