import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class SkeletonLoading extends StatelessWidget {
  final int item;
  final double radius;

  const SkeletonLoading({Key key, this.item, this.radius});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SkeletonLoader(
        items: item,
        builder: Container(
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: radius,
              ),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    height: 10,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  Container(
                    height: 12,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ],
              ))
            ],
          ),
        ),
        direction: SkeletonDirection.ltr,
        period: Duration(seconds: 2),
        highlightColor: Color(0xFFB0BEC5),
      ),
    );
  }
}
