import 'package:flutter/material.dart';
import 'package:revesion_app/utils/constants.dart';
import 'package:revesion_app/view/current_screen.dart';
import 'package:revesion_app/utils/responsive.dart';
import 'package:revesion_app/view/sidebar_menu.dart';
import 'package:sidebarx/sidebarx.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidebar menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            key: _key,
            appBar: Responsive.isSmall(context)
                ? AppBar(
                    backgroundColor: canvasColor,
                    title: Text(
                        dummyCategoryMap[_controller.selectedIndex]['name']),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SidebarMennu(controller: _controller),
            body: Row(
              children: [
                if (!Responsive.isSmall(context))
                  SidebarMennu(controller: _controller),
                Expanded(
                  child: Center(
                    child: CurrentScreens(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
