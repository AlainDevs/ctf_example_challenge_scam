import 'package:flutter/material.dart';
import '../viewmodels/scam_challenge_viewmodel.dart';
import 'package:provider/provider.dart';

class WarningView extends StatelessWidget {
  const WarningView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ScamChallengeViewModel>();
    final userInfo = viewModel.userInfo;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_rounded,
              size: 80,
              color: Colors.red,
            ),
            const SizedBox(height: 24),
            const Text(
              '⚠️ SECURITY AWARENESS CHALLENGE ⚠️',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.withValues(red: 255, green: 0, blue: 0, alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    'This was a simulated scam challenge!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'You just shared the following personal information:\n\n'
                    'Name: ${userInfo?.name}\n'
                    'Address: ${userInfo?.address}\n'
                    'Phone: ${userInfo?.phoneNumber}\n\n'
                    'In a real scam, this information could be used for:',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• Identity theft'),
                      Text('• Financial fraud'),
                      Text('• Targeted phishing attacks'),
                      Text('• Physical security risks'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withValues(red: 0, green: 255, blue: 0, alpha: 0.1),
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    'Congratulations! You\'ve completed the challenge!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'CTF Flag: ${viewModel.ctfFlag}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => viewModel.reset(),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}