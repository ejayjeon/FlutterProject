import 'package:app/common/layout/main_layout.dart';
import 'package:app/common/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:settings_ui/settings_ui.dart';

class UserScreen extends StatelessWidget {
  static String get routeName => 'user';
  final ValueNotifier themeNotifier;
  const UserScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /** 바탕 box */
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.72,
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color.fromARGB(255, 190, 77, 247),
                        Color.fromARGB(255, 125, 119, 242),
                        Color.fromARGB(255, 131, 247, 170),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    // backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/media/Fo0CQVeacAAuLmz?format=jpg&name=4096x4096',
                    ),
                  ),
                ),
                // _settingTitle('나의 프로필'),
                // _settingMenu(Icons.person, '프로필 정보'),
                _settingContainer(context),
              ],
            ),
          ),
          // ),
        ],
      ),
    );
  }

  Widget _settingContainer(context) {
    return Card(
      color: lightColorScheme.primary,
      clipBehavior: Clip.hardEdge,
      child: Card(
        elevation: 1,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.93,
          height: 110,
          child: Text('dd'),
        ),
      ),
    );
  }

  Widget _settingTitle(String title) {
    return Row(
      children: [
        Icon(
          Icons.double_arrow_outlined,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _settingMenu(icon, title) {
    return Row(
      children: [
        Icon(icon),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
