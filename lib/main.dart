import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth await Firebase.initializeApp(); // تهيئة Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تسجيل الدخول',
      debugShowCheckedModeBanner: {
          final user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          } else {
            return const HomeScreen();
          }
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _Login(content: Text('خطأ في تسجيل الدخول: ${e.message}')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 90, color: Colors.indigo),
              const SizedBox(height: 20),
              const Text(
                'مرحبا بك',
                style: TextStyle(fontSize: 28, font),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText:: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('تسجيل الدخول', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                child: const Text('ليس لديك حساب؟ إنشاء حساب'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  void _signUp() async {
    setState(() => _loading = true);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text('إنشاء حساب'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                'إنشاء حساب جديد',
                style: TextStyle(fontSize: 24, fontWeight:',
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
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _loading ? null : _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _loading = false;

  void _sendResetEmail() async {
    setState(() => _loading = true);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إرسال build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('نسيت كلمة المرور')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'أدخل بريدك الإلكتروني لإرسال رابط إعادة تعيين كلمة المرور',
              style: TextStyle(fontSize:,
              child: ElevatedButton(
                onPressed: _loading ? null : _sendResetEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('إرسال', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCode = false;

  void _verifyCode() async {
    setState(() => _loading = true);
    // هنا ضع كود التحقق المناسب (مثلاً تحقق من الكود مع سيرفر أو Firebase)
    await Future.delayed(const Duration(seconds: 2)); // محاكاة انتظار
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم التحقق بنجاح (تجريبي)')),
    );
    setState(() => _loading = false);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
 child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'أدخل كود التحقق الذي وصلك',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: 'كود التحقق',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.vpn_key),
              ),
              keyboardType: TextInputType.number,
            ),
           .indigo,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('تحقق', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// شاشة رئيسية تشبه واتساب
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex =  = [];

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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ميزة إنشاء مجموعة جديدة قادمة قريبًا!')),
        );
        break;
      case 'settings':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ميزة الإعدادات قادمة قريبًا!')),
       ();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.indigo[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'بحث...',
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 8', child: Text('مجموعة جديدة')),
              const PopupMenuItem(
                  value: 'settings', child: Text('الإعدادات')),
              const PopupMenuItem(
                  value: 'logout', child: Text('تسجيل خروج')),
            ],
          ),
        ],
      ),
      body: _tabs[_selectedIndex],
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
 ),
    );
  }
}

// تبويب الدردشات
class _ChatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // يمكنك ربطها مستقبلاً بقائمة دردشات حقيقية
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
          leading: CircleAvatar(child: Icon(Icons('تم إرسال الملف 👍'),
          trailing: Text('11:45 ص'),
        ),
        // أضف مزيد من الدردشات هنا
      ],
    );
  }
}

// تبويب الحالة
class _StatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // يمكنك ربطها مستقبلاً بحالات حقيقية
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('حالتك'),
          subtitle: Text('اضغط لإضافة حالة ],
    );
  }
}

// تبويب جهات الاتصال
class _ContactsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // يمكنك ربطها مستقبلاً بجهات اتصال حقيقية
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
        // أضف مزيد من جهات الاتصال هنا
      ],
    );
  }
}