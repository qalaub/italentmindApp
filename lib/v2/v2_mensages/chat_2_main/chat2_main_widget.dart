import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat2_main_model.dart';
export 'chat2_main_model.dart';

class Chat2MainWidget extends StatefulWidget {
  const Chat2MainWidget({super.key});

  @override
  State<Chat2MainWidget> createState() => _Chat2MainWidgetState();
}

class _Chat2MainWidgetState extends State<Chat2MainWidget> {
  late Chat2MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2MainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await currentUserReference!.update(createUsersRecordData(
        isActive: true,
      ));
    });
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
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFBD39BA),
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
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'i4r2sseo' /* Messages */,
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Montserrat',
                    fontSize: 23.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
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
              Builder(
                builder: (context) {
                  if (currentUserDocument?.rol != Roles.business) {
                    return StreamBuilder<List<ChatsRecord>>(
                      stream: queryChatsRecord(
                        queryBuilder: (chatsRecord) => chatsRecord
                            .where(
                              'users',
                              arrayContains: currentUserReference,
                              isNull: (currentUserReference) == null,
                            )
                            .orderBy('last_message_time', descending: true),
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
                        List<ChatsRecord> containerChatsRecordList =
                            snapshot.data!;

                        return Container(
                          height: MediaQuery.sizeOf(context).height * 0.84,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 100.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFBD39BA),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final chatClip = containerChatsRecordList
                                        .take(4)
                                        .toList()
                                        .take(4)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(chatClip.length,
                                                (chatClipIndex) {
                                          final chatClipItem =
                                              chatClip[chatClipIndex];
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  chatClipItem.users
                                                      .where((e) => e ==
                                                              currentUserReference
                                                          ? false
                                                          : true)
                                                      .toList()[0]),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final columnUsersRecord =
                                                    snapshot.data!;

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              const CircleBorder(),
                                                          child: Container(
                                                            width: 66.0,
                                                            height: 66.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: columnUsersRecord
                                                                        .isActive
                                                                    ? const Color(
                                                                        0xFF00FF0A)
                                                                    : const Color(
                                                                        0xFF2B2B2B),
                                                                width: 1.5,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            240.0),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    columnUsersRecord
                                                                        .photoUrl,
                                                                    'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                                                  ),
                                                                  width: 44.0,
                                                                  height: 44.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        61.0,
                                                                        30.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: columnUsersRecord
                                                                        .isActive
                                                                    ? const Color(
                                                                        0xFF00FF0A)
                                                                    : const Color(
                                                                        0xFF2B2B2B),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            240.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFF333030),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      functions
                                                          .upperCaseFirstLetter(
                                                              valueOrDefault<
                                                                  String>(
                                                        columnUsersRecord
                                                            .firtsName,
                                                        'Name',
                                                      )),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        })
                                            .divide(const SizedBox(width: 16.0))
                                            .addToStart(const SizedBox(width: 16.0))
                                            .addToEnd(const SizedBox(width: 16.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.9, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'fptdjbnb' /* Messages */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final chat2MainVar =
                                        containerChatsRecordList
                                            .where((e) =>
                                                ((currentUserDocument?.blockList
                                                                .toList() ??
                                                            [])
                                                        .contains(e.userB) ==
                                                    false) &&
                                                ((currentUserDocument?.blockList
                                                                .toList() ??
                                                            [])
                                                        .contains(e.userA) ==
                                                    false))
                                            .toList();
                                    if (chat2MainVar.isEmpty) {
                                      return Center(
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          child: EmptyStateSimpleWidget(
                                            icon: Icon(
                                              Icons.mark_chat_unread_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 90.0,
                                            ),
                                            title: 'No Chats',
                                            body:
                                                'You don\'t have any chats created, start a chat by tapping the button in the top right. ',
                                          ),
                                        ),
                                      );
                                    }

                                    return ListView.separated(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        11.0,
                                        0,
                                        0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: chat2MainVar.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 3.0),
                                      itemBuilder:
                                          (context, chat2MainVarIndex) {
                                        final chat2MainVarItem =
                                            chat2MainVar[chat2MainVarIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().currentChat =
                                                  chat2MainVarItem.reference;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                'chat_2_Details',
                                                queryParameters: {
                                                  'chatRef': serializeParam(
                                                    chat2MainVarItem,
                                                    ParamType.Document,
                                                  ),
                                                  'chatRefTotal':
                                                      serializeParam(
                                                    chat2MainVarItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'chatRef': chat2MainVarItem,
                                                },
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 0.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      offset: const Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (chat2MainVarItem
                                                            .users.length <=
                                                        2) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord.getDocument(
                                                              chat2MainVarItem
                                                                  .users
                                                                  .where((e) => e
                                                                              .id ==
                                                                          currentUserReference
                                                                              ?.id
                                                                      ? false
                                                                      : true)
                                                                  .toList()[0]),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            final rowUsersRecord =
                                                                snapshot.data!;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        0.0,
                                                                    shape:
                                                                        const CircleBorder(),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          59.0,
                                                                      height:
                                                                          59.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(2.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
                                                                              rowUsersRecord.photoUrl,
                                                                              'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                                                            ),
                                                                            width:
                                                                                44.0,
                                                                            height:
                                                                                44.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                child: Text(
                                                                                  functions.upperCaseFirstLetter(valueOrDefault<String>(
                                                                                    functions.concatStrings(rowUsersRecord.firtsName, rowUsersRecord.lastName, ' '),
                                                                                    'Ghost User',
                                                                                  )),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (!chat2MainVarItem.lastMessageSeenBy.contains(currentUserReference))
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Container(
                                                                                  width: 12.0,
                                                                                  height: 12.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            chat2MainVarItem.lastMessage,
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "relative",
                                                                                  chat2MainVarItem.lastMessageTime!,
                                                                                  locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.chevron_right_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ].divide(const SizedBox(width: 16.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0),
                                                        child: FutureBuilder<
                                                            UsersRecord>(
                                                          future: FFAppState()
                                                              .userDocQuery(
                                                            uniqueQueryKey:
                                                                chat2MainVarItem
                                                                    .reference
                                                                    .id,
                                                            requestFn: () => UsersRecord
                                                                .getDocumentOnce(
                                                                    chat2MainVarItem
                                                                        .users
                                                                        .where((e) =>
                                                                            e !=
                                                                            currentUserReference)
                                                                        .toList()
                                                                        .first),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            final rowUsersRecord =
                                                                snapshot.data!;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      SizedBox(
                                                                    width: 44.0,
                                                                    height:
                                                                        54.0,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              FutureBuilder<UsersRecord>(
                                                                            future:
                                                                                UsersRecord.getDocumentOnce(chat2MainVarItem.users.where((e) => e != currentUserReference).toList().last),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                                width: 32.0,
                                                                                height: 32.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  shape: BoxShape.rectangle,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    if (containerUsersRecord.photoUrl != '') {
                                                                                      return Padding(
                                                                                        padding: const EdgeInsets.all(2.0),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: CachedNetworkImage(
                                                                                            fadeInDuration: const Duration(milliseconds: 200),
                                                                                            fadeOutDuration: const Duration(milliseconds: 200),
                                                                                            imageUrl: valueOrDefault<String>(
                                                                                              containerUsersRecord.photoUrl,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-flow-at3mts/assets/jozbfglfd548/flutterflow_future%402x.jpg',
                                                                                            ),
                                                                                            width: 44.0,
                                                                                            height: 44.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      return Padding(
                                                                                        padding: const EdgeInsets.all(2.0),
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              containerUsersRecord.displayName,
                                                                                              'A',
                                                                                            ).maybeHandleOverflow(maxChars: 1),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                32.0,
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              shape: BoxShape.rectangle,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if (rowUsersRecord.photoUrl != '') {
                                                                                  return Padding(
                                                                                    padding: const EdgeInsets.all(2.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: CachedNetworkImage(
                                                                                        fadeInDuration: const Duration(milliseconds: 200),
                                                                                        fadeOutDuration: const Duration(milliseconds: 200),
                                                                                        imageUrl: valueOrDefault<String>(
                                                                                          rowUsersRecord.photoUrl,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-flow-at3mts/assets/jozbfglfd548/flutterflow_future%402x.jpg',
                                                                                        ),
                                                                                        width: 44.0,
                                                                                        height: 44.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Padding(
                                                                                    padding: const EdgeInsets.all(2.0),
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      height: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          rowUsersRecord.displayName,
                                                                                          'A',
                                                                                        ).maybeHandleOverflow(maxChars: 1),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'w7icb90c' /* Group Chat */,
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (!chat2MainVarItem.lastMessageSeenBy.contains(currentUserReference))
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Container(
                                                                                  width: 12.0,
                                                                                  height: 12.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              chat2MainVarItem.lastMessage,
                                                                              'No messages yet.',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  dateTimeFormat(
                                                                                    "relative",
                                                                                    chat2MainVarItem.lastMessageTime,
                                                                                    locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  '--',
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.chevron_right_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ].divide(const SizedBox(width: 16.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return StreamBuilder<List<ChatsRecord>>(
                      stream: queryChatsRecord(
                        queryBuilder: (chatsRecord) => chatsRecord
                            .orderBy('last_message_time', descending: true),
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
                        List<ChatsRecord> containerChatsRecordList =
                            snapshot.data!;

                        return Container(
                          height: MediaQuery.sizeOf(context).height * 0.84,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 100.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFBD39BA),
                                ),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Builder(
                                    builder: (context) {
                                      final chatClip = containerChatsRecordList
                                          .where((e) =>
                                              ((currentUserDocument
                                                              ?.professionals
                                                              .toList() ??
                                                          [])
                                                      .contains(e.userB) ==
                                                  true) ||
                                              ((currentUserDocument
                                                              ?.professionals
                                                              .toList() ??
                                                          [])
                                                      .contains(e.userA) ==
                                                  true) ||
                                              (e.userB == currentUserReference))
                                          .toList()
                                          .take(4)
                                          .toList()
                                          .take(4)
                                          .toList();

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: List
                                                  .generate(chatClip.length,
                                                      (chatClipIndex) {
                                            final chatClipItem =
                                                chatClip[chatClipIndex];
                                            return Container(
                                              decoration: const BoxDecoration(),
                                              child: StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    chatClipItem.users
                                                        .where((e) => e ==
                                                                currentUserReference
                                                            ? false
                                                            : true)
                                                        .toList()
                                                        .last),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final columnUsersRecord =
                                                      snapshot.data!;

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 66.0,
                                                              height: 66.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: columnUsersRecord
                                                                          .isActive
                                                                      ? const Color(
                                                                          0xFF00FF0A)
                                                                      : const Color(
                                                                          0xFF2B2B2B),
                                                                  width: 1.5,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              240.0),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnUsersRecord
                                                                          .photoUrl,
                                                                      'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                                                    ),
                                                                    width: 44.0,
                                                                    height:
                                                                        44.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          61.0,
                                                                          30.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 10.0,
                                                                height: 10.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: columnUsersRecord
                                                                          .isActive
                                                                      ? const Color(
                                                                          0xFF00FF0A)
                                                                      : const Color(
                                                                          0xFF2B2B2B),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              240.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: const Color(
                                                                        0xFF333030),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        functions
                                                            .upperCaseFirstLetter(
                                                                valueOrDefault<
                                                                    String>(
                                                          columnUsersRecord
                                                              .firtsName,
                                                          'Name',
                                                        )),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            );
                                          })
                                              .divide(const SizedBox(width: 16.0))
                                              .addToStart(const SizedBox(width: 16.0))
                                              .addToEnd(const SizedBox(width: 16.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: AuthUserStreamWidget(
                                  builder: (context) => Builder(
                                    builder: (context) {
                                      final chat2Bussines =
                                          containerChatsRecordList
                                              .where((e) =>
                                                  ((currentUserDocument
                                                                  ?.professionals
                                                                  .toList() ??
                                                              [])
                                                          .contains(e.userB) ==
                                                      true) ||
                                                  ((currentUserDocument
                                                                  ?.professionals
                                                                  .toList() ??
                                                              [])
                                                          .contains(e.userA) ==
                                                      true) ||
                                                  (e.userB ==
                                                      currentUserReference))
                                              .toList();
                                      if (chat2Bussines.isEmpty) {
                                        return Center(
                                          child: SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            child: EmptyStateSimpleWidget(
                                              icon: Icon(
                                                Icons.mark_chat_unread_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 90.0,
                                              ),
                                              title: 'No Chats',
                                              body:
                                                  'You don\'t have any chats created, start a chat by tapping the button in the top right. ',
                                            ),
                                          ),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          11.0,
                                          0,
                                          0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: chat2Bussines.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 3.0),
                                        itemBuilder:
                                            (context, chat2BussinesIndex) {
                                          final chat2BussinesItem =
                                              chat2Bussines[chat2BussinesIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 1.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().currentChat =
                                                    chat2BussinesItem.reference;
                                                safeSetState(() {});

                                                context.pushNamed(
                                                  'chat_2_DetailsCopy',
                                                  queryParameters: {
                                                    'chatRef': serializeParam(
                                                      chat2BussinesItem,
                                                      ParamType.Document,
                                                    ),
                                                    'chatRefTotal':
                                                        serializeParam(
                                                      chat2BussinesItem
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'professional':
                                                        serializeParam(
                                                      chat2BussinesItem.userB,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'chatRef':
                                                        chat2BussinesItem,
                                                  },
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 0.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        offset: const Offset(
                                                          0.0,
                                                          1.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                12.0,
                                                                12.0),
                                                    child: StreamBuilder<
                                                        UsersRecord>(
                                                      stream: UsersRecord.getDocument(
                                                          chat2BussinesItem
                                                              .users
                                                              .where((e) => e
                                                                          .id ==
                                                                      currentUserReference
                                                                          ?.id
                                                                  ? false
                                                                  : true)
                                                              .toList()
                                                              .last),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final rowUsersRecord =
                                                            snapshot.data!;

                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                shape:
                                                                    const CircleBorder(),
                                                                child:
                                                                    Container(
                                                                  width: 59.0,
                                                                  height: 59.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .black,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          rowUsersRecord
                                                                              .photoUrl,
                                                                          'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                                                        ),
                                                                        width:
                                                                            44.0,
                                                                        height:
                                                                            44.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: StreamBuilder<
                                                                    UsersRecord>(
                                                                  stream: UsersRecord
                                                                      .getDocument(
                                                                          chat2BussinesItem
                                                                              .userB!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }

                                                                    final columnUsersRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                child: Text(
                                                                                  functions.upperCaseFirstLetter(valueOrDefault<String>(
                                                                                    functions.concatStrings(rowUsersRecord.firtsName, rowUsersRecord.lastName, ' '),
                                                                                    'Ghost User',
                                                                                  )),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (!chat2BussinesItem.lastMessageSeenBy.contains(currentUserReference))
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Container(
                                                                                  width: 12.0,
                                                                                  height: 12.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            chat2BussinesItem.lastMessage.maybeHandleOverflow(maxChars: 50),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'ProfileInfo',
                                                                                queryParameters: {
                                                                                  'professional': serializeParam(
                                                                                    chat2BussinesItem.userB,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '211duocj' /* This message is for  */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: columnUsersRecord.firtsName,
                                                                                    style: const TextStyle(
                                                                                      color: Color(0xFFBD39BA),
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "relative",
                                                                                  chat2BussinesItem.lastMessageTime!,
                                                                                  locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.chevron_right_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ].divide(const SizedBox(width: 16.0)),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.01),
                child: Container(
                  height: 73.0,
                  decoration: const BoxDecoration(
                    color: Color(0xD5B928B8),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (currentUserDocument?.rol != Roles.business) {
                        return wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarWidget(),
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.navbarPremiunModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarPremiunWidget(),
                        );
                      }
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
