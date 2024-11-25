import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'perfil_profesional_mapa_model.dart';
export 'perfil_profesional_mapa_model.dart';

class PerfilProfesionalMapaWidget extends StatefulWidget {
  const PerfilProfesionalMapaWidget({
    super.key,
    required this.profesionalId,
  });

  final UsersRecord? profesionalId;

  @override
  State<PerfilProfesionalMapaWidget> createState() =>
      _PerfilProfesionalMapaWidgetState();
}

class _PerfilProfesionalMapaWidgetState
    extends State<PerfilProfesionalMapaWidget> {
  late PerfilProfesionalMapaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilProfesionalMapaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (!loggedIn) {
            context.pushNamed('Login');
          } else {
            context.pushNamed(
              'ProfileInfo',
              queryParameters: {
                'professional': serializeParam(
                  widget.profesionalId?.reference,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          }
        },
        child: Material(
          color: Colors.transparent,
          elevation: 10.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Container(
            width: 285.0,
            height: 139.0,
            decoration: const BoxDecoration(
              color: Color(0xFFFFCCF9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 0.0),
                      child: Container(
                        width: 61.0,
                        height: 61.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          border: Border.all(
                            color: const Color(0xFFD9D9D9),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.profesionalId?.photoUrl,
                                'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                              ),
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.06, -1.23),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                      child: Container(
                        width: 139.0,
                        height: 36.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFCCF9),
                        ),
                        child: Text(
                          valueOrDefault<String>(
                            widget.profesionalId?.firtsName,
                            'e',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Montserrat',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: wrapWithModel(
                      model: _model.addFavoritesModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AddFavoritesWidget(
                        professional: widget.profesionalId!,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.74, -0.19),
                    child: wrapWithModel(
                      model: _model.membresiaLogoModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MembresiaLogoWidget(
                        professional: widget.profesionalId!.reference,
                        width: 40,
                        heigth: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.05, -0.29),
                    child: Container(
                      width: 139.0,
                      height: 18.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(3.0, 2.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.profesionalId?.serviceType.first,
                            'e',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.09, -0.12),
                    child: Container(
                      width: 140.0,
                      height: 1.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.09, 0.42),
                    child: Container(
                      width: 150.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-0.03, 0.18),
                            child: Container(
                              width: 150.0,
                              height: 16.0,
                              decoration: const BoxDecoration(),
                              child: Stack(
                                children: [
                                  const Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Icon(
                                      Icons.business_center_outlined,
                                      color: Color(0xFF0E70DF),
                                      size: 14.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '0q2rammg' /* Experience */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.17, 0.1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 150.0,
                                height: 16.0,
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    const Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 3.0),
                                        child: Icon(
                                          Icons.edit_document,
                                          color: Color(0xFF0E70DF),
                                          size: 13.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ujhvrxew' /* Qualified And Certified 
perso... */
                                            ,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(const SizedBox(height: 0.0))
                            .addToStart(const SizedBox(height: 3.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(73.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.9),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'x9egkggc' /* 4,5 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.29, 1.05),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: RatingBar.builder(
                                onRatingUpdate: (newValue) => safeSetState(
                                    () => _model.ratingBarValue = newValue),
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star_rate,
                                  color: Color(0xFFF9BF11),
                                ),
                                direction: Axis.horizontal,
                                initialRating: _model.ratingBarValue ??= 3.0,
                                unratedColor: const Color(0x4D040202),
                                itemCount: 5,
                                itemSize: 15.0,
                                glowColor: const Color(0xFFF9BF11),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.9),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6u9krlbv' /* (1278) */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFFBD39BA),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 4.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
