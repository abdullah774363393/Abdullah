import 'package:flutter/material.dart';

class StatusTab extends StatelessWidget { // تم تغيير الاسم إلى StatusTab
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('أحمد'),
          subtitle: Text('منذ 5 دقائق'),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('سامي'),
          subtitle: Text('منذ ساعة'),
        ),
      ],
    );
  }
}

