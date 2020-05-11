import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final mobileFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (mobileFocusNode.hasFocus) {
            mobileFocusNode.unfocus();
          } else if (passwordFocusNode.hasFocus) {
            passwordFocusNode.unfocus();
          }
        },
        child: _buildLoginContent(context),
      ),
    );
  }

  @override
  void dispose() {
    if (mobileFocusNode.hasFocus) {
      mobileFocusNode.unfocus();
    } else if (passwordFocusNode.hasFocus) {
      passwordFocusNode.unfocus();
    }
    super.dispose();
  }

  Widget _buildLoginContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTitle(context),
            SizedBox(height: 30),
            _buildSignArea(context),
            SizedBox(height: 50),
            _buildLoginBtn(context),
            SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '用户登录',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget _buildSignArea(BuildContext context) {
    return Container(
      width: 270,
      child: Column(
        children: <Widget>[
          _buildMobile(context),
          Container(
            height: 0.5,
            color: Color(0xFF6a6a6a),
          ),
          _buildPassword(context),
          Container(
            height: 0.5,
            color: Color(0xFF6a6a6a),
          ),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.number,
      focusNode: mobileFocusNode,
      maxLength: 11,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF191919),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: '',
        hintText: '请输入手机号',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFFa5a5a5),
        ),
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      focusNode: passwordFocusNode,
      maxLength: 20,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF191919),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: '',
        hintText: '请输入密码',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFFa5a5a5),
        ),
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return ButtonTheme(
      minWidth: 270,
      height: 45,
      buttonColor: Color(0xFF08ba07),
      child: RaisedButton(
        onPressed: () async {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Text(
          '登录',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
