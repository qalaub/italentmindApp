import '/auth/firebase_auth/auth_util.dart';
import '/dislike/user_skyp/user_skyp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rejectedlist_model.dart';
export 'rejectedlist_model.dart';

class RejectedlistWidget extends StatefulWidget {
  const RejectedlistWidget({super.key});

  @override
  State<RejectedlistWidget> createState() => _RejectedlistWidgetState();
}

class _RejectedlistWidgetState extends State<RejectedlistWidget> {
  late RejectedlistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RejectedlistModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF4963C9),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'm4mi5bv5' /* Rejected list */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'pintanga',
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if ((currentUserDocument?.dontShow?.toList() ?? []).length > 0)
                AuthUserStreamWidget(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Builder(
                      builder: (context) {
                        final noShow =
                            (currentUserDocument?.dontShow?.toList() ?? [])
                                .toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: noShow.length,
                          separatorBuilder: (_, __) => SizedBox(height: 2.0),
                          itemBuilder: (context, noShowIndex) {
                            final noShowItem = noShow[noShowIndex];
                            return UserSkypWidget(
                              key: Key(
                                  'Key3si_${noShowIndex}_of_${noShow.length}'),
                              userRef: noShowItem,
                            );
                          },
                        );
                      },
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
