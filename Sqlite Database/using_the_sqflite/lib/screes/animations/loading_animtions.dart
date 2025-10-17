import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation extends StatelessWidget {
  final bool isLoading;
  final bool isSuccess;

  const LoadingAnimation({
    super.key,
    required this.isLoading,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SpinKitFadingCircle(color: Colors.white, size: 28),
      );
    } else if (isSuccess) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Icon(Icons.check_circle, color: Colors.greenAccent),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
