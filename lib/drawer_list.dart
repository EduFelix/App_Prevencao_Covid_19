import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login/usuarios.dart';
import 'file:///C:/Users/eduar/AndroidStudioProjects/flutter_app/lib/pages/login/login_page.dart';
import 'package:flutter_app/utius/nav.dart';

class DrawerList extends StatelessWidget {

  UserAccountsDrawerHeader _header(Usuarios user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.urlFoto),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Future<Usuarios> future = Usuarios.get();
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuarios>(
              future: future, builder:(context, snapshot){
                Usuarios user = snapshot.data;
                return user != null ? _header(user) : Container();
            },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("Saiba mais"),
              trailing: Icon(Icons.arrow_forward,),
              onTap: (){
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Saiba mais"),
              trailing: Icon(Icons.arrow_forward,),
              onTap: (){
                print("Item 1");
                Navigator.pop(context);
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
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
