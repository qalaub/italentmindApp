import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'cliente_favorito_model.dart';
export 'cliente_favorito_model.dart';

class ClienteFavoritoWidget extends StatefulWidget {
  const ClienteFavoritoWidget({
    super.key,
    required this.username,
    required this.userRef,
  });

  final String? username;
  final DocumentReference? userRef;

  @override
  State<ClienteFavoritoWidget> createState() => _ClienteFavoritoWidgetState();
}

class _ClienteFavoritoWidgetState extends State<ClienteFavoritoWidget> {
  late ClienteFavoritoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteFavoritoModel());
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
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: Container(
          width: 370.0,
          height: 88.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0),
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.asset(
                    'assets/images/Rectangle_5.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.addToUsers(widget.userRef!);
                  safeSetState(() {});
                  _model.addToUsers(currentUserReference!);
                  safeSetState(() {});
                  _model.chats = await queryChatsRecordOnce(
                    queryBuilder: (chatsRecord) => chatsRecord
                        .whereArrayContainsAny('users', _model.users),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  if (_model.chats?.reference.id != null &&
                      _model.chats?.reference.id != '') {
                    _model.newRef = await queryChatsRecordOnce(
                      queryBuilder: (chatsRecord) => chatsRecord
                          .where(
                            'user_a',
                            isEqualTo: widget.userRef,
                          )
                          .where(
                            'user_b',
                            isEqualTo: currentUserReference,
                          ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);

                    context.pushNamed(
                      'chat_2_Details',
                      queryParameters: {
                        'chatRef': serializeParam(
                          _model.newRef,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'chatRef': _model.newRef,
                      },
                    );
                  } else {
                    // newChat

                    var chatsRecordReference = ChatsRecord.collection.doc();
                    await chatsRecordReference.set({
                      ...createChatsRecordData(
                        userA: widget.userRef,
                        userB: currentUserReference,
                        lastMessage: '',
                        lastMessageTime: getCurrentTimestamp,
                        lastMessageSentBy: currentUserReference,
                        groupChatId:
                            random_data.randomInteger(1000000, 9999999),
                      ),
                      ...mapToFirestore(
                        {
                          'users': _model.users,
                        },
                      ),
                    });
                    _model.newChatThread = ChatsRecord.getDocumentFromData({
                      ...createChatsRecordData(
                        userA: widget.userRef,
                        userB: currentUserReference,
                        lastMessage: '',
                        lastMessageTime: getCurrentTimestamp,
                        lastMessageSentBy: currentUserReference,
                        groupChatId:
                            random_data.randomInteger(1000000, 9999999),
                      ),
                      ...mapToFirestore(
                        {
                          'users': _model.users,
                        },
                      ),
                    }, chatsRecordReference);

                    context.pushNamed(
                      'chat_2_Details',
                      queryParameters: {
                        'chatRef': serializeParam(
                          _model.newChatThread,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'chatRef': _model.newChatThread,
                      },
                    );
                  }

                  _model.users = [];
                  safeSetState(() {});

                  safeSetState(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 61.0,
                          height: 61.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/icareImagenParticipante.png',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              functions
                                  .upperCaseFirstLetter(valueOrDefault<String>(
                                widget.username,
                                'Jeisson Raul Origua Rincon',
                              )),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.2, 0.9),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Container(
                                  width: 240.0,
                                  height: 1.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(height: 8.0))
                              .addToStart(const SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(0.95, -0.82),
                          child: Icon(
                            Icons.favorite_sharp,
                            color: Color(0xFFFF5151),
                            size: 27.0,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.81, -0.05),
                          child: FlutterFlowIconButton(
                            borderRadius: 24.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: 34.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
