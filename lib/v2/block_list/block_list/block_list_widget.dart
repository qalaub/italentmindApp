import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/block_list/user_block/user_block_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'block_list_model.dart';
export 'block_list_model.dart';

class BlockListWidget extends StatefulWidget {
  const BlockListWidget({super.key});

  @override
  State<BlockListWidget> createState() => _BlockListWidgetState();
}

class _BlockListWidgetState extends State<BlockListWidget> {
  late BlockListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockListModel());
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
          backgroundColor: const Color(0xFF1D69D7),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const FaIcon(
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
              'b01rt5ya' /* Blocked list */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if ((currentUserDocument?.blockUser.toList() ?? []).isNotEmpty)
                AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.whereIn(
                          'uid',
                          (currentUserDocument?.blockUser.toList() ?? [])
                                      .map((e) => valueOrDefault<String>(
                                            e.id,
                                            '#########',
                                          ))
                                      .toList() !=
                                  ''
                              ? (currentUserDocument?.blockUser.toList() ?? [])
                                  .map((e) => valueOrDefault<String>(
                                        e.id,
                                        '#########',
                                      ))
                                  .toList()
                              : null),
                    ),
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
                      List<UsersRecord> containerUsersRecordList = snapshot
                          .data!
                          .where((u) => u.uid != currentUserUid)
                          .toList();

                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Builder(
                          builder: (context) {
                            final containerVar = containerUsersRecordList
                                .where((e) =>
                                    (currentUserDocument?.blockUser.toList() ??
                                            [])
                                        .contains(e.reference) ==
                                    true)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: containerVar.length,
                              itemBuilder: (context, containerVarIndex) {
                                final containerVarItem =
                                    containerVar[containerVarIndex];
                                return UserBlockWidget(
                                  key: Key(
                                      'Key0sa_${containerVarIndex}_of_${containerVar.length}'),
                                  background: valueOrDefault<Color>(
                                    functions.isOdd(containerVarIndex) == true
                                        ? Colors.white
                                        : const Color(0xFFDEE8EB),
                                    Colors.white,
                                  ),
                                  username: containerVarItem.firtsName,
                                  service: containerVarItem.rol == Roles.user
                                      ? ' '
                                      : containerVarItem.serviceType.first,
                                  userRef: containerVarItem.reference,
                                  image: containerVarItem.photoUrl,
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
