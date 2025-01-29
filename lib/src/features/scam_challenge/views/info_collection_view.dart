import 'package:flutter/material.dart';
import '../models/user_info.dart';
import '../viewmodels/scam_challenge_viewmodel.dart';
import 'package:provider/provider.dart';

class InfoCollectionView extends StatefulWidget {
  const InfoCollectionView({super.key});

  @override
  State<InfoCollectionView> createState() => _InfoCollectionViewState();
}

class _InfoCollectionViewState extends State<InfoCollectionView> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  
  late final AnimationController _controller;
  late final Animation<double> _titleAnimation;
  late final Animation<double> _nameFieldAnimation;
  late final Animation<double> _addressFieldAnimation;
  late final Animation<double> _phoneFieldAnimation;
  late final Animation<double> _submitButtonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _titleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.2, curve: Curves.easeOut),
    ));

    _nameFieldAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.4, curve: Curves.easeOut),
    ));

    _addressFieldAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 0.6, curve: Curves.easeOut),
    ));

    _phoneFieldAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
    ));

    _submitButtonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.8, 1.0, curve: Curves.elasticOut),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _titleAnimation,
              child: const Text(
                'Claim Your Free iPhone 15 Pro Max!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _nameFieldAnimation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.2, 0),
                  end: Offset.zero,
                ).animate(_nameFieldAnimation),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeTransition(
              opacity: _addressFieldAnimation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.2, 0),
                  end: Offset.zero,
                ).animate(_addressFieldAnimation),
                child: TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Shipping Address',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeTransition(
              opacity: _phoneFieldAnimation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.2, 0),
                  end: Offset.zero,
                ).animate(_phoneFieldAnimation),
                child: TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            ScaleTransition(
              scale: _submitButtonAnimation,
              child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final userInfo = UserInfo(
                    name: _nameController.text,
                    address: _addressController.text,
                    phoneNumber: _phoneController.text,
                  );
                  context
                      .read<ScamChallengeViewModel>()
                      .submitUserInfo(userInfo);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Submit to Claim iPhone',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}