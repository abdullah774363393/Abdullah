import 'package:flutter/material.dart';

class ChatsTab extends StatelessWidget { // تم تغيير الاسم إلى ChatsTab
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('محمد أحمد'),
          subtitle: Text('مرحبا! كيف حالك؟'),
          trailing: Text('12:30 م'),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('سارة علي'),
          subtitle: Text('تم إرسال الملف 👍'),
          trailing: Text('11:45 ص'),
        ),
      ],
    );
  }
}

