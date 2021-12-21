import '/apis/cloudnetv3spec/model/node_info.dart';
import '/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.nodeInfo,
    required this.child,
  }) : super(key: key);

  final NodeInfo? nodeInfo;
  final Widget child;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      appBar: _appBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              accountEmail: Text('3ef54833-025d-4500-8b91-a85c50138bcd'),
              accountName: Text('TheMeinerLP'),
              currentAccountPicture: Image(image: NetworkImage('https://crafthead.net/avatar/05bf52c67bb04f1389510e1fd803df35')),
            ),
            ListTile(
              title: const Text('Node'),
            ),
            ListTile(
              title: const Text('Cluster'),
            ),
            ListTile(
              title: const Text('Database'),
            ),
            ListTile(
              title: const Text('Groups'),
            ),
            ListTile(
              title: const Text('Tasks'),
            ),
            ListTile(
              title: const Text('Services'),
            ),
            ListTile(
              title: const Text('Template Storage'),
            ),
            ListTile(
              title: const Text('Templates'),
            ),
            ListTile(
              title: const Text('Service Versions'),
            ),
            ListTile(
              title: const Text('Modules'),
            ),
          ],
        ),
      ),
    );
  }

  AppBar? _appBar() {
    return AppBar(
      title: Text(appTitle),
    );
    return null;
  }
}
