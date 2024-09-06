import 'package:flutter/material.dart';
import 'package:lhstore/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class LHCurvedEdgeWidges extends StatelessWidget {
  const LHCurvedEdgeWidges({
    super.key,
    this.child
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LHCustomCurvedEdges(),
      child: child
    );
  }
}