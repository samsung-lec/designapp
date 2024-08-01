import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark, // 다크 모드를 기본으로 설정
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("설정"),
            ),
          ),
          SliverAppBar(
            pinned: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '검색',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFF1E1E1E),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  UserAccountTile(),
                  SizedBox(height: 20),
                  SettingTile(
                    icon: Icons.airplanemode_active,
                    color: Colors.orange,
                    title: '에어플레인 모드',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.wifi,
                    color: Colors.blue,
                    title: 'Wi-Fi',
                    subtitle: 'INN208',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.bluetooth,
                    color: Colors.blue,
                    title: 'Bluetooth',
                    subtitle: '켬',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.network_cell,
                    color: Colors.green,
                    title: '셀룰러',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.battery_full,
                    color: Colors.green,
                    title: '배터리',
                  ),
                  SizedBox(height: 20),
                  SettingTile(
                    icon: Icons.settings,
                    color: Colors.grey,
                    title: '일반',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.accessibility,
                    color: Colors.blue,
                    title: '손쉬운 사용',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.search,
                    color: Colors.grey,
                    title: '검색',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.brightness_6,
                    color: Colors.blue,
                    title: '디스플레이 및 밝기',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.wallpaper,
                    color: Colors.blue,
                    title: '배경화면',
                  ),
                  Divider(height: 1),
                  SettingTile(
                    icon: Icons.watch_later,
                    color: Colors.black,
                    title: '스탠바이',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserAccountTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        color: Color(0xFF1E1E1E),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/id/200/100/100"),
            ),
            title: Text('최주호'),
            subtitle: Text('Apple 계정, iCloud 등'),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String? subtitle;

  const SettingTile({
    required this.icon,
    required this.color,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        color: Color(0xFF1E1E1E),
        child: ListTile(
          leading: Icon(
            icon,
            color: color,
          ),
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}