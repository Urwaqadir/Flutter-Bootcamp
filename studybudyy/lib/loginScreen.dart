import 'package:flutter/material.dart';
import 'home_nav.dart'; // Import your main navigation screen


class _TextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  const _TextField({
    required this.hint,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscure,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              )
            : null,
      ),
    );
  }
}

/// ─────────────────────────── Sign‑Up Screen ───────────────────────────
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sign Up',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Enter your details below & free sign up',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 24),
                  _TextField(hint: 'Your Email', controller: _email),
                  const SizedBox(height: 16),
                  _TextField(
                      hint: 'Password',
                      controller: _password,
                      isPassword: true),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Sign up logic
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue, // Set the button color
                        foregroundColor: Colors.white, // Set the text color
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Create Account'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(
                        value: _agree,
                        onChanged: (v) => setState(() => _agree = v ?? false),
                        visualDensity: VisualDensity.compact,
                      ),
                      Expanded(
                        child: Text(
                          'By creating an account you have to agree\nwith our terms & conditions.',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen())),
                        child: const Text('Log in',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ─────────────────────────── Log‑In Screen ───────────────────────────
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Log In',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Enter your email & password',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 24),
                  _TextField(hint: 'Your Email', controller: _email),
                  const SizedBox(height: 16),
                  _TextField(
                      hint: 'Password',
                      controller: _password,
                      isPassword: true),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Forgot password flow
                      },
                      child: const Text('Forget password?',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      // 👉 after validating credentials, jump to the main navigator
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavScreen()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.blue, 
      // Set the button color
    ),
    child: const Text('Log In' ,style: TextStyle(color: Colors.white),),
  ),
),

                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignUpScreen())),
                        child: const Text('Sign up',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or login with'),
                    ),
                    Expanded(child: Divider()),
                  ]),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      _SocialIcon(icon: Icons.g_mobiledata),
                      SizedBox(width: 24),
                      _SocialIcon(icon: Icons.facebook),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ─────────────────────────── Social Icon Button ───────────────────────
class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.grey.shade200,
      child: Icon(icon, color: Colors.blue),
    );
  }
}
