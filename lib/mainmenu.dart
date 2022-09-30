import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.find_in_page_rounded),
                  title: const Text('Thống kê'),
                  onTap: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ThongKePage()));
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.history_edu),
                  title: const Text('Nhật ký thiết bị'),
                  onTap: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ThietBi()));
                  },
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () async {},
                ),
              ),
            ]);
  }
}
