import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../profile/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailTextController;
  TextEditingController textController;
  TextEditingController passwordTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    textController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 480,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailTextController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'email',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'phone',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordTextController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '[Some hint text...]',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final user = await createAccountWithEmail(
                            context,
                            emailTextController.text,
                            passwordTextController.text,
                          );
                          if (user == null) {
                            return;
                          }

                          final displayName = textController.text;
                          final phone = int.parse(textController.text);

                          final usersRecordData = createUsersRecordData(
                            displayName: displayName,
                            phone: phone,
                          );

                          await UsersRecord.collection
                              .doc(user.uid)
                              .update(usersRecordData);

                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Button',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final user = await signInWithEmail(
                            context,
                            emailTextController.text,
                            passwordTextController.text,
                          );
                          if (user == null) {
                            return;
                          }

                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Button',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final user = await signInWithGoogle(context);
                          if (user == null) {
                            return;
                          }
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Button',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
