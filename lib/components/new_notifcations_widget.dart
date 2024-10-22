import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_notifcations_model.dart';
export 'new_notifcations_model.dart';

class NewNotifcationsWidget extends StatefulWidget {
  const NewNotifcationsWidget({
    super.key,
    required this.participant,
    required this.professional,
  });

  final DocumentReference? participant;
  final DocumentReference? professional;

  @override
  State<NewNotifcationsWidget> createState() => _NewNotifcationsWidgetState();
}

class _NewNotifcationsWidgetState extends State<NewNotifcationsWidget> {
  late NewNotifcationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewNotifcationsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.participant!),
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

        final containerUsersRecord = snapshot.data!;

        return Container(
          height: 100.0,
          decoration: const BoxDecoration(
            color: Color(0xFF1D69D7),
          ),
          child: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
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

                final rowUsersRecord = snapshot.data!;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.19,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.16,
                              height: MediaQuery.sizeOf(context).width * 0.16,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: valueOrDefault<String>(
                                  containerUsersRecord.photoUrl,
                                  'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: AlignmentDirectional(1.25, 0.7),
                            child: Icon(
                              Icons.favorite_sharp,
                              color: Color(0xFFE31042),
                              size: 37.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.71,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: functions.upperCaseFirstLetter(
                                          containerUsersRecord.firtsName),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '815vkgde' /* likes your collaborator  */,
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: functions.upperCaseFirstLetter(
                                          rowUsersRecord.firtsName),
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(width: 12.0)),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
