import 'package:flutter/material.dart';
import '/services/sessionmanager.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final SessionManager _sessionManager =SessionManager();
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Center(child: ElevatedButton(onPressed:_sessionManager.logout , child: Text('logout'))),
        ],),
      ),
    );
  }
}