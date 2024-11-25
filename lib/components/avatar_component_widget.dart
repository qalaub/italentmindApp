import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'avatar_component_model.dart';
export 'avatar_component_model.dart';

class AvatarComponentWidget extends StatefulWidget {
  const AvatarComponentWidget({
    super.key,
    required this.img,
    required this.isActive,
  });

  final String? img;
  final bool? isActive;

  @override
  State<AvatarComponentWidget> createState() => _AvatarComponentWidgetState();
}

class _AvatarComponentWidgetState extends State<AvatarComponentWidget> {
  late AvatarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      height: 110.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: widget.isActive! ? const Color(0xFF00FF0A) : const Color(0x00000000),
          width: valueOrDefault<double>(
            widget.isActive! ? 4.0 : 0.0,
            4.0,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          widget.img!,
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
