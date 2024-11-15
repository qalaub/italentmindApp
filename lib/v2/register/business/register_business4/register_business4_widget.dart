import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_business4_model.dart';
export 'register_business4_model.dart';

class RegisterBusiness4Widget extends StatefulWidget {
  const RegisterBusiness4Widget({super.key});

  @override
  State<RegisterBusiness4Widget> createState() =>
      _RegisterBusiness4WidgetState();
}

class _RegisterBusiness4WidgetState extends State<RegisterBusiness4Widget> {
  late RegisterBusiness4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterBusiness4Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().updateRegisterProviderFormStruct(
        (e) => e..images = [],
      );
      FFAppState().imagesUserUpload = [];
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFFEFE),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: Color(0xFFFFFEFE),
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: false,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/fondo-inicio.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.91, -0.96),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/logo-pegados.png',
                                    width: 180.0,
                                    height: 100.0,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.2),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height: 526.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFEFE),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24.0),
                                    bottomRight: Radius.circular(24.0),
                                    topLeft: Radius.circular(24.0),
                                    topRight: Radius.circular(24.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'qavqkozt' /* Add Photos */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'pintanga',
                                                  color: Color(0xFF1D69D7),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      if (_model.photoVerify)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '8czwal2x' /* Let’s complete your profile! U... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'pintanga',
                                                    color: Color(0xFF6F6F6F),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (!_model.photoVerify)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'l8jkva1f' /* Please upload photos to comple... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'pintanga',
                                                    color: Color(0xFFE90606),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 380.0,
                                          height: 1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF718CD4),
                                            border: Border.all(
                                              color: Color(0xFF718CD4),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: Container(
                                          width: 350.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFFEFE),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(24.0),
                                              bottomRight:
                                                  Radius.circular(24.0),
                                              topLeft: Radius.circular(24.0),
                                              topRight: Radius.circular(24.0),
                                            ),
                                            border: Border.all(
                                              color: Color(0xFF718CD4),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD9D9D9),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model.img1Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ImageUploadWidget(
                                                        key: ValueKey('image1'),
                                                        background:
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/ur7v7ul2ofjo/companyText.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD9D9D9),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model.img2Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ImageUploadWidget(
                                                        key: ValueKey('image1'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD9D9D9),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model.img3Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ImageUploadWidget(
                                                        key: ValueKey('image1'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0, 0.0,
                                                          10.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD9D9D9),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model.img4Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ImageUploadWidget(
                                                        key: ValueKey('image1'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD9D9D9),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model.img5Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ImageUploadWidget(
                                                        key: ValueKey('image1'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 10.0, 10.0,
                                                          10.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 130.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD9D9D9),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model.img6Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ImageUploadWidget(
                                                        key: ValueKey('image1'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            width: 380.0,
                                            height: 1.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF718CD4),
                                              border: Border.all(
                                                color: Color(0xFF718CD4),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.01, 0.7),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: FFButtonWidget(
                                            key: ValueKey('create'),
                                            onPressed: () async {
                                              if (FFAppState()
                                                      .imagesUserUpload
                                                      .length >
                                                  0) {
                                                _model.photoVerify = true;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..images = FFAppState()
                                                        .imagesUserUpload
                                                        .where((e) =>
                                                            (e !=
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/xokotouxb9hk/imageText.png') &&
                                                            (e != ''))
                                                        .toList(),
                                                );
                                                GoRouter.of(context)
                                                    .prepareAuthEvent();

                                                final user = await authManager
                                                    .createAccountWithEmail(
                                                  context,
                                                  FFAppState()
                                                      .registerProviderForm
                                                      .email,
                                                  FFAppState()
                                                      .registerProviderForm
                                                      .password,
                                                );
                                                if (user == null) {
                                                  return;
                                                }

                                                await UsersRecord.collection
                                                    .doc(user.uid)
                                                    .update({
                                                  ...createUsersRecordData(
                                                    firtsName: FFAppState()
                                                        .registerProviderForm
                                                        .firstName,
                                                    lastName: FFAppState()
                                                        .registerProviderForm
                                                        .lastName,
                                                    birthdate: FFAppState()
                                                        .registerProviderForm
                                                        .birthdate,
                                                    suburb: FFAppState()
                                                        .registerProviderForm
                                                        .suburb,
                                                    ndis: FFAppState()
                                                        .registerProviderForm
                                                        .ndis,
                                                    phoneNumber: FFAppState()
                                                        .registerProviderForm
                                                        .phone,
                                                    email: FFAppState()
                                                        .registerProviderForm
                                                        .email,
                                                    age: FFAppState()
                                                        .registerProviderForm
                                                        .age,
                                                    years: FFAppState()
                                                        .registerProviderForm
                                                        .years,
                                                    gender: FFAppState()
                                                        .registerProviderForm
                                                        .gender,
                                                    description: FFAppState()
                                                        .registerProviderForm
                                                        .description,
                                                    comapny: FFAppState()
                                                        .registerProviderForm
                                                        .company,
                                                    languagues: '',
                                                    rol: FFAppState()
                                                        .registerProviderForm
                                                        .rol,
                                                    plan: FFAppState()
                                                        .registerProviderForm
                                                        .plan,
                                                    photoUrl: FFAppState()
                                                                .registerProviderForm
                                                                .images
                                                                .length >
                                                            0
                                                        ? FFAppState()
                                                            .registerProviderForm
                                                            .images
                                                            .first
                                                        : ' ',
                                                    business: FFAppState()
                                                        .registerProviderForm
                                                        .business,
                                                    paymentDate:
                                                        getCurrentTimestamp,
                                                    freeTrial: true,
                                                    displayName: '',
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'images': FFAppState()
                                                          .imagesUserUpload,
                                                      'serviceType': FFAppState()
                                                          .registerProviderForm
                                                          .serviceType,
                                                      'disabilities': FFAppState()
                                                          .registerProviderForm
                                                          .disabilities,
                                                      'schedule': FFAppState()
                                                          .registerProviderForm
                                                          .schedule,
                                                    },
                                                  ),
                                                });

                                                final paymentResponse =
                                                    await processStripePayment(
                                                  context,
                                                  amount: () {
                                                    if (FFAppState()
                                                            .registerProviderForm
                                                            .plan ==
                                                        Plan.basic) {
                                                      return FFAppConstants
                                                          .basicPrice;
                                                    } else if (FFAppState()
                                                            .registerProviderForm
                                                            .plan ==
                                                        Plan.standar) {
                                                      return FFAppConstants
                                                          .standarPrice;
                                                    } else {
                                                      return FFAppConstants
                                                          .premiunPrice;
                                                    }
                                                  }(),
                                                  currency: 'USD',
                                                  customerEmail: FFAppState()
                                                      .registerProviderForm
                                                      .email,
                                                  customerName: FFAppState()
                                                      .registerProviderForm
                                                      .firstName,
                                                  description: () {
                                                    if (FFAppState()
                                                            .registerProviderForm
                                                            .plan ==
                                                        Plan.basic) {
                                                      return 'Plan Basic';
                                                    } else if (FFAppState()
                                                            .registerProviderForm
                                                            .plan ==
                                                        Plan.standar) {
                                                      return 'Plan Standar';
                                                    } else {
                                                      return 'Plan Premiun';
                                                    }
                                                  }(),
                                                  allowGooglePay: true,
                                                  allowApplePay: false,
                                                );
                                                if (paymentResponse.paymentId ==
                                                        null &&
                                                    paymentResponse
                                                            .errorMessage !=
                                                        null) {
                                                  showSnackbar(
                                                    context,
                                                    'Error: ${paymentResponse.errorMessage}',
                                                  );
                                                }
                                                _model.paymentId =
                                                    paymentResponse.paymentId ??
                                                        '';

                                                FFAppState()
                                                    .updateRegisterUserFormStruct(
                                                  (e) => e
                                                    ..firstName =
                                                        _model.paymentId,
                                                );
                                                safeSetState(() {});
                                                if ((_model.paymentId != null &&
                                                        _model.paymentId !=
                                                            '') &&
                                                    (_model.paymentId != '')) {
                                                  safeSetState(() {});

                                                  context.goNamedAuth(
                                                    'HomeSearch',
                                                    context.mounted,
                                                    queryParameters: {
                                                      'authUser':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1500));
                                                  unawaited(
                                                    () async {
                                                      await currentUserReference!
                                                          .delete();
                                                    }(),
                                                  );
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1500));
                                                  await authManager
                                                      .deleteUser(context);
                                                }
                                              } else {
                                                _model.photoVerify = false;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'fnclc38k' /* Create Profile */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 275.0,
                                              height: 45.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF4963C9),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              elevation: 5.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
