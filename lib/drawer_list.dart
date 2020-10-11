import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_service.dart';
import 'package:flutter_app/pages/login/usuarios.dart';
import 'file:///C:/Users/eduar/AndroidStudioProjects/flutter_app/lib/pages/login/login_page.dart';
import 'package:flutter_app/utius/nav.dart';

class DrawerList extends StatelessWidget {

  UserAccountsDrawerHeader _header(FirebaseUser user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.displayName ?? ""),
      accountEmail: Text(user.email),
      currentAccountPicture: user.photoUrl != null ?
      CircleAvatar(
        backgroundImage: NetworkImage(user.photoUrl),
      )
          :FlutterLogo(),
    );
  }
  @override
  Widget build(BuildContext context) {
    Future<FirebaseUser> future = FirebaseAuth.instance.currentUser();
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<FirebaseUser>(
              future: future, builder:(context, snapshot){
              FirebaseUser user = snapshot.data;
                return user != null ? _header(user) : Container();
            },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward,),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }



  _onClickLogout(BuildContext context) {
    Usuarios.clear();
    FirebaseService().logout();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
