import 'package:flutter/material.dart';
import '../viewmodels/scam_challenge_viewmodel.dart';
import 'package:provider/provider.dart';
import 'placeholder_images.dart';

class SocialPostView extends StatelessWidget {
  const SocialPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: PlaceholderImages.appleLogo(),
                  title: const Text('Official.Apple.Giveaway',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Sponsored'),
                ),
                PlaceholderImages.iphoneGiveaway(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '🎉 MEGA GIVEAWAY! iPhone 15 Pro Max! 🎉',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'We\'re giving away 100 iPhone 15 Pro Max units to celebrate our success! '
                        'Limited time offer - Claim yours NOW! 📱✨',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<ScamChallengeViewModel>()
                                .moveToInfoCollection();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          child: const Text(
                            'CLAIM NOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}