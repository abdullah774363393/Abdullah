import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:abdullah/screens/home_screen.dart'; // استيراد HomeScreen

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool _isSending = false;
  bool _isReloading = false;

  void _resendVerificationEmail() async {
    setState(() => _isSending = true);
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إعادة إرسال بريد التحقق. تحقق من صندوق الوارد.')),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ في الإرسال: ${e.message}')),
      );
    } finally {
      setState(() => _isSending = false);
    }
  }

  void _reloadUser() async {
    setState(() => _isReloading = true);
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('البريد الإلكتروني لم يتم التحقق منه بعد.')),
      );
    }
    setState(() => _isReloading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text('التحقق من البريد الإلكتروني'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email_outlined, size: 90, color: Colors.indigo),
              const SizedBox(height: 30),
              const Text(
                'تم إرسال رابط التحقق إلى بريدك الإلكتروني. الرجاء النقر على الرابط لتفعيل حسابك.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isReloading ? null : _reloadUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: _isReloading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('لقد تحققت من بريدي', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _isSending ? null : _resendVerificationEmail,
                child: _isSending
                    ? const CircularProgressIndicator(color: Colors.indigo)
                    : const Text('إعادة إرسال بريد التحقق'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: const Text('تسجيل الخروج'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

