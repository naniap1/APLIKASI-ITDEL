import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pam_application/views/users/izin.dart';
import 'package:pam_application/views/users/ruangan.dart';
import 'package:pam_application/views/users/surat.dart';

void main() {
  runApp(MaterialApp(
    home: UserPage(),
  ));
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: SideBar(), // Add Drawer
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 40),
                MenuRow(),
                SizedBox(height: 16),
                AdditionalMenuRow(),
                SizedBox(height: 16),
                AdditionalMenuRow2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Create a new Widget for the Drawer (Sidebar)
class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          IzinMenu(),
          ListTile(
            leading: Icon(FontAwesomeIcons.envelope),
            title: Text('Surat'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuratPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.building),
            title: Text('Ruangan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RuanganPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.tshirt),
            title: Text('Kaos'),
            onTap: () {
              // Handle Kaos menu tap
            },
          ),
        ],
      ),
    );
  }
}

class MenuRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuCard(
          icon: FontAwesomeIcons.userClock,
          title: 'Izin Keluar',
          backgroundColor: Colors.blue.shade100,
        ),
        MenuCard(
          icon: FontAwesomeIcons.userClock,
          title: 'Izin Bermalam',
          backgroundColor: Colors.blue.shade100,
        ),
      ],
    );
  }
}

class AdditionalMenuRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuCard(
          icon: FontAwesomeIcons.envelope,
          title: 'Surat',
          backgroundColor: Colors.blue.shade100,
        ),
        MenuCard(
          icon: FontAwesomeIcons.building,
          title: 'Ruangan',
          backgroundColor: Colors.blue.shade100,
        ),
      ],
    );
  }
}

class AdditionalMenuRow2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuCard(
          icon: FontAwesomeIcons.tshirt,
          title: 'Kaos',
          backgroundColor: Colors.blue.shade100,
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  MenuCard({
    required this.icon,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 3,
      child: InkWell(
        onTap: () {
          // Periksa judul, jika 'Izin', navigasi ke PermissionPage,
          // jika 'Surat', navigasi ke SuratPage
          if (title == 'Izin Keluar') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PermissionPage(),
              ),
            );
          } else if (title == 'Izin Bermalam') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PermissionPage(),
              ),
            );
          } else if (title == 'Surat') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SuratPage(),
              ),
            );
          } else if (title == 'Ruangan') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RuanganPage(),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.all(16),
          height: 120,
          width: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(icon, size: 40),
              SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      color: backgroundColor,
    );
  }
}

class IzinMenu extends StatefulWidget {
  @override
  _IzinMenuState createState() => _IzinMenuState();
}

class _IzinMenuState extends State<IzinMenu> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        color: isHovered ? Colors.blue.shade100 : null,
        child: ListTile(
          leading: Icon(FontAwesomeIcons.userClock),
          title: Text('Izin'),
          onTap: () {
            _showIzinMenu(context);
          },
        ),
      ),
    );
  }

  void _showIzinMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Jenis Izin'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PermissionPage(),
                  ),
                );
              },
              child: Text('Izin Keluar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PermissionPage(),
                  ),
                );
              },
              child: Text('Izin Bermalam'),
            ),
          ],
        );
      },
    );
  }
}
