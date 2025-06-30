import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  void _login() async {
    setState(() => _loading = true);
    try {
      }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 90, color: Colors.circular(12)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute ),
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('تسجيل الدخول', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                   (context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ في إنشاء الحساب: ${e.message}')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'الاسم الكامل',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _loading ? null : _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('إنشاء حساب', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // العودة لتسجيل الدخول
 @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _loading = false;

  void _sendResetEmail() async {
    setState(() => _loading = true);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك')),
      );
      Navigator.pop(context);
 EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'أدخل بريدك الإلكتروني لإرسال رابط إعادة تعيين كلمة المرور',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller:({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _searchController = TextEditingController();

  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      _ChatsTab(),
      _StatusTab(),
      _ContactsTab(),
    ];
  }

  void _onMenuSelected(String value) {
    switch (value) {
      case 'new_group':
        ScaffoldMessenger.of(context).(8),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'بحث...',
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _onMenuSelected,
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'new_group', child: Text('مجموعة جديدة')),
              const PopupMenuItem(value: 'settings', child: Text('الإعدادات[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'الدردشات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'الحالة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'جهات الاتصال',
          ),
        ],
      ),
    );
  }
}

class _ChatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
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

class _StatusTab(child: Icon(Icons.person)),
          title: Text('سامي'),
          subtitle: Text('منذ ساعة'),
        ),
      ],
    );
  }
}

class _ContactsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('محمد أحمد'),
          subtitle: Text('أونلاين'),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('سارة علي'),
          subtitle: Text('آخر ظهور: أمس'),
        ),
      ],
    );
  }
}