import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LoadingAnimationWidget.beat(
          color: Colors.lightBlue,
          size: MediaQuery.of(context).size.width * 0.06,
        ),
      ),
    );
  }
}
