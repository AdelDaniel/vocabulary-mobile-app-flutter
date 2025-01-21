import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:voca_app/app_router.dart';
import 'package:voca_app/feature/home/models/word_ui_model.dart';
import 'package:voca_app/feature/home/widgets/daily_challenge_hint.dart';
import 'package:voca_app/feature/home/widgets/paging_swipe_to_refresh_page_view_widget.dart';
import 'package:voca_app/feature/home/widgets/upper_row_widgets.dart';
import 'package:voca_app/feature/home/widgets/word_page_widget.dart';
import 'package:voca_app/feature/widgets/background/background_wrapper.dart';
import 'package:voca_app/utils/lottie/swipe_lottie_widget.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({super.key});

  static void open({required BuildContext context, int? index}) {
    context.go(AppRouter.homeScreenRouteName);
  }

  @override
  State<AppNavigationScreen> createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends State<AppNavigationScreen> {
  final PageController _pageController = PageController(keepPage: true);

  final List<WordUiModel> _words = [
    const WordUiModel(
      word: 'Principality',
      description: 'A state ruled by a prince.',
      pronunciation: 'prin-si-pal-i-tee',
      exampleSentence: 'The principality was known for its beautiful castles.',
      partOfSpeech: 'Noun',
      synonyms: ['domain', 'dukedom', 'territory'],
      antonyms: ['republic', 'democracy'],
    ),
    const WordUiModel(
      word: 'Ebullient',
      description: 'Cheerful and full of energy.',
      pronunciation: 'ih-buhl-yuhnt',
      exampleSentence:
          'Her ebullient personality made her the life of the party.',
      partOfSpeech: 'Adjective',
      synonyms: ['exuberant', 'buoyant', 'joyful'],
      antonyms: ['depressed', 'apathetic'],
    ),
    const WordUiModel(
      word: 'Incongruous',
      description:
          'Not in harmony or keeping with the surroundings or other aspects of something.',
      pronunciation: 'in-kon-gru-uhs',
      exampleSentence: 'His outfit was incongruous with the formal occasion.',
      partOfSpeech: 'Adjective',
      synonyms: ['incompatible', 'inappropriate', 'unsuitable'],
      antonyms: ['consistent', 'harmonious'],
    ),
    const WordUiModel(
      word: 'Nature',
      description:
          'The phenomena of the physical world collectively, including plants, animals, the landscape, and other features and products of the earth, as opposed to humans or human creations.',
      pronunciation: 'ney-cher',
      exampleSentence:
          'She loved to explore the beauty of nature during her hikes.',
      partOfSpeech: 'Noun',
      synonyms: ['environment', 'ecosystem', 'wilderness'],
      antonyms: ['urban', 'man-made'],
    ),
    const WordUiModel(
      word: 'Serendipity',
      description:
          'The occurrence of events by chance in a happy or beneficial way.',
      pronunciation: 'ser-uhn-dip-i-tee',
      exampleSentence: 'Finding that old photograph was pure serendipity.',
      partOfSpeech: 'Noun',
      synonyms: ['fluke', 'chance', 'coincidence'],
      antonyms: ['misfortune', 'bad luck'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) async {
        _onBackPressed();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            BackgroundWrapper(
              child: PagingSwipeToRefreshPageViewWidget(
                controller: _pageController,
                itemWidget: (index) => WordPageWidget(word: _words[index % 5]),
                pageViewKey: const ValueKey("Words"),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: UpperRowWidgets(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: DailyChallengeHint(
                hintMessage: "Solve Day 20 Challenge",
              ),
            ),
            const SwipeLottieWidget(),
          ],
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////
  /////////////////// Helper methods ////////////////////////
  ///////////////////////////////////////////////////////////

  void _onBackPressed() async {
    final canBack = await showDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Exit"),
          content: const Text("Are you sure you want to exit the Application?"),
          actions: <Widget>[
            CupertinoButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            CupertinoButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (canBack == true) {
      SystemNavigator.pop();
    }
  }
}
