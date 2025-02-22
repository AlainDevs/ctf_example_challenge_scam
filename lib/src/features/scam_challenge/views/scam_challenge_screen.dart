import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/scam_challenge_viewmodel.dart';
import '../../../core/animations/animated_content.dart';
import 'social_post_view.dart';
import 'info_collection_view.dart';
import 'warning_view.dart';

class ScamChallengeScreen extends StatelessWidget {
  const ScamChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScamChallengeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Social Media Challenge'),
          centerTitle: true,
        ),
        body: Consumer<ScamChallengeViewModel>(
          builder: (context, viewModel, child) {
            return AnimatedContent(
              key: ValueKey(viewModel.currentStep),
              child: switch (viewModel.currentStep) {
                ScamChallengeStep.socialPost => const SocialPostView(),
                ScamChallengeStep.infoCollection => const InfoCollectionView(),
                ScamChallengeStep.warning => const WarningView(),
              },
            );
          },
        ),
      ),
    );
  }
}