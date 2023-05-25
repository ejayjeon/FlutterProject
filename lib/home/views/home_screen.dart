import 'package:flutter/material.dart';
import 'package:mood_button/home/repository/shared_preferences_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedIcon = 'like';

  @override
  void initState() {
    super.initState();
    _loadSelectedIcon();
  }

  Future<void> _loadSelectedIcon() async {
    String icon = await SharedPreferencesHelper.getSelectedIcon();
    setState(() {
      selectedIcon = icon;
    });
  }

  Future<void> _saveSelectedIcon(String icon) async {
    await SharedPreferencesHelper.setSelectedIcon(icon);
  }

  void _onIconPressed(String icon) {
    setState(() {
      selectedIcon = icon;
    });
    _saveSelectedIcon(icon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 64,
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: selectedIcon == 'like'
                    ? const Icon(
                        Icons.thumb_up,
                        color: Colors.blue,
                      )
                    : selectedIcon == 'love'
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : selectedIcon == 'lol'
                            ? const Icon(
                                Icons.emoji_emotions,
                                color: Colors.purple,
                              )
                            : Container(),
              ),
              onPressed: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 200.0),
                      child: AlertDialog(
                        contentPadding: const EdgeInsets.all(4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56),
                        ),
                        elevation: 1,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: iconButton(
                                'like',
                                Icons.thumb_up,
                                Colors.blue,
                              ),
                            ),
                            Expanded(
                              child: iconButton(
                                'love',
                                Icons.favorite,
                                Colors.red,
                              ),
                            ),
                            Expanded(
                              child: iconButton(
                                'lol',
                                Icons.emoji_emotions,
                                Colors.purple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  IconButton iconButton(String title, IconData icon, Color color) {
    return IconButton(
      onPressed: () {
        _onIconPressed(title);
        Navigator.pop(context);
      },
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
