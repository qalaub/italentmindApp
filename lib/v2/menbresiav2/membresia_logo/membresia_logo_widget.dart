import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'membresia_logo_model.dart';
export 'membresia_logo_model.dart';

class MembresiaLogoWidget extends StatefulWidget {
  const MembresiaLogoWidget({
    super.key,
    required this.professional,
    int? width,
    int? heigth,
  })  : width = width ?? 32,
        heigth = heigth ?? 32;

  final DocumentReference? professional;
  final int width;
  final int heigth;

  @override
  State<MembresiaLogoWidget> createState() => _MembresiaLogoWidgetState();
}

class _MembresiaLogoWidgetState extends State<MembresiaLogoWidget> {
  late MembresiaLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MembresiaLogoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.toDouble(),
      height: widget.heigth.toDouble(),
      decoration: const BoxDecoration(),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.professional!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }

          final columnUsersRecord = snapshot.data!;

          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (columnUsersRecord.plan == Plan.basic)
                Align(
                  alignment: const AlignmentDirectional(0.67, -0.63),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/basicV2.png',
                      width: widget.width.toDouble(),
                      height: widget.heigth.toDouble(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              if (columnUsersRecord.plan == Plan.standar)
                Align(
                  alignment: const AlignmentDirectional(0.67, -0.63),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/standarV2.png',
                      width: widget.width.toDouble(),
                      height: widget.heigth.toDouble(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              if ((columnUsersRecord.plan == Plan.premiun) &&
                  (columnUsersRecord.business != null))
                Align(
                  alignment: const AlignmentDirectional(0.67, -0.63),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/premiunV2.png',
                      width: widget.width.toDouble(),
                      height: widget.heigth.toDouble(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              if ((columnUsersRecord.plan == Plan.premiun) &&
                  (columnUsersRecord.business == null))
                Align(
                  alignment: const AlignmentDirectional(0.67, -0.63),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/premiunV2.png',
                      width: widget.width.toDouble(),
                      height: widget.heigth.toDouble(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
