import 'package:flutter/material.dart';
import 'package:lhstore/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';

class LHPrimaryHeaderContainer extends StatelessWidget {
  const LHPrimaryHeaderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LHCurvedEdgeWidges(
      child: SizedBox(
        height: 380,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [LHColor.gra1, LHColor.gra2, LHColor.gra3, LHColor.gra4],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.4, 0.7, 1.0],
            ),
          ),
          child: Stack(
            children: [
              Image(
                image: AssetImage(LHImages.banner),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
