import 'package:flutter/material.dart';
import '../viewmodels/scam_challenge_viewmodel.dart';
import 'package:provider/provider.dart';
import 'placeholder_images.dart';

class SocialPostView extends StatefulWidget {
  const SocialPostView({super.key});

  @override
  State<SocialPostView> createState() => _SocialPostViewState();
}

class _SocialPostViewState extends State<SocialPostView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _headerAnimation;
  late final Animation<double> _imageAnimation;
  late final Animation<double> _contentAnimation;
  late final Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _headerAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    ));

    _imageAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
    ));

    _contentAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
    ));

    _buttonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0, curve: Curves.elasticOut),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                FadeTransition(
                  opacity: _headerAnimation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-0.2, 0),
                      end: Offset.zero,
                    ).animate(_headerAnimation),
                    child: ListTile(
                      leading: PlaceholderImages.appleLogo(),
                      title: const Text('Official.Apple.Giveaway',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text('Sponsored'),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _imageAnimation,
                  child: ScaleTransition(
                    scale: _imageAnimation,
                    child: PlaceholderImages.iphoneGiveaway(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: _contentAnimation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.2, 0),
                            end: Offset.zero,
                          ).animate(_contentAnimation),
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
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ScaleTransition(
                          scale: _buttonAnimation,
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