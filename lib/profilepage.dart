import 'package:flutter/material.dart';
import 'package:motainai/components/Impact_gridview.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          SizedBox(height: 60),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              trailing: Icon(Icons.settings, color: Colors.green[700]),
              leading: Icon(Icons.person, color: Colors.green[700]),
              title: Text(
                'Daniel',
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 100),
          ImpactGrid(),
        ],
      ),
    );
  }
}
