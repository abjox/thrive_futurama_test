import '../../redux/character_details/connector/character_details_view_model.dart';
import '../../redux/characters/connector/characters_view_model.dart';
import '../../redux/home/connector/home_view_model.dart';
import '../../redux/quiz/connector/quiz_view_model.dart';
import '../character_details/components/character_details_body_widget.dart';
import '../characters/components/character_tile_widget.dart';
import '../common/bottom_navigation_bar_widget.dart';
import '../home/components/home_body_widget.dart';
import '../quiz/components/quiz_question_page_widget.dart';
import '../quiz/components/quiz_results_page_widget.dart';

final mockInitialHomeStateViewModel = HomeViewModel(
    isLoading: false,
    homeBodyProps: HomeBodyProps(
      "Philip J. Fry is a 25 year old delivery boy living in New York City who is cryogenically frozen on New Year's 1999 for 1000 years, where he wakes up in New New York City on December 31, 2999. There, he meets Turanga Leela, a tough but loving, beautiful one-eyed alien; and Bender, an alcohol-powered bending robot who is addicted to liquor, cigars, stealing, amongst other things. Eventually, they all meet up with Fry's Great, Great, Great, etc... Nephew, Hubert J. Farnsworth. Farnsworth is a very old man who is a genius but is very senile and forgetful. Fry, Leela, and Bender wind up working for Farnsworth's Planet Express Delivery Service. They then meet their co-workers; Amy Wong, who is a Martian intern who comes from a rich family, but is still a human who is very hip. Also, there is Hermes Conrad, who manages the delivery service and is pretty strict. Hermes seems Jamaican in voice and look. And finally, there's Dr. John Zoidberg, a lobster-like alien who is the crew's doctor. Unfortunately, he knows nothing about humans. Fry, Leela, Bender, and sometimes Amy and Dr. Zoidberg travel around the universe risking life and limb delivering packages and performing charitable tasks for tax deductions.",
      "1999–2013",
      ["David X. Cohen", "Matt Groening"],
    ),
    bottomNavigationBarProps: BottomNavigationBarProps(
      BottomBarItemTypes.home,
      () {},
      () {},
      () {},
    ));

final mockInitialCharctersStateViewModel = CharactersViewModel(
  isLoading: false,
  characters: [
    CharacterProps(
      'Philip',
      'Fry',
      'https://upload.wikimedia.org/wikipedia/en/2/28/Philip_Fry.png',
      () {},
    ),
    CharacterProps(
      'Turanga',
      'Leela',
      'https://upload.wikimedia.org/wikipedia/en/d/d4/Turanga_Leela.png',
      () {},
    ),
  ],
  bottomNavigationBarProps: BottomNavigationBarProps(
    BottomBarItemTypes.home,
    () {},
    () {},
    () {},
  ),
);

final mockInitialCharcterDetailsStateViewModel = CharacterDetailsViewModel(
  isLoading: false,
  firstName: 'Philip',
  characterDetailsBodyProps: CharacterDetailsBodyProps(
    "https://upload.wikimedia.org/wikipedia/en/2/28/Philip_Fry.png",
    'Philip',
    '',
    'Fry',
    'Intergalactic Delivery Boy',
    'Male',
    'Human',
    'Earth',
    [
      "Shut up and take my money!",
      "I'm walking on sunshine, woah oh oooh",
      "This is how we do it. Pick your nose and chew it",
      "wow! I never would have thought of that.",
      "Bigfoot! He's real! I knew it! The Loch Ness Monster's book was right!",
      "I didn't ask for a completely reasonable excuse! I asked you to get busy!",
      "It's like a party in my mouth and everybody's throwing up!",
      "My God, it's full of ads!",
      "There's so many killbots behind us, I can't count them all. Three, I think.",
      "They're like sex, except I'm having them!",
      "We're in the middle of nowhere, which is the safest part of nowhere.",
      "When will young people learn that playing 'Dungeons and Dragons' doesn't make you cool!",
      "Why am I sticky and naked? Did I miss something fun?",
      "Wow! A superpowers drug you can just rub onto your skin? You'd think it would be something you'd have to freebase.",
      "Wow, you got that off the Internet? In my day, the Internet was only used to download pornography.",
      "But this is HDTV. It's got better resolution than the real world.",
      "Can I pull up my pants now?",
    ],
  ),
);

final mockInitialQuizStateViewModel = QuizViewModel(
  isLoading: false,
  questionsProps: [
    QuizQuestionPageProps(
      "What is Fry's first name?",
      ['Fred', 'Philip', 'Will', 'John'],
      (p0) {},
    ),
    QuizQuestionPageProps(
      "In 'Benders Big Score' what ailen species scam the earth?",
      ['Nibbloniens', 'Omicrons', 'Robots', 'Nudest aliens', 'Tentacals'],
      (p0) {},
    )
  ],
  quizResultsProps: QuizResultsPageProps(
    1,
    [
      QuestionResult(
        true,
        "What is Fry's first name?",
        'Philip',
      ),
      QuestionResult(
        false,
        "In 'Benders Big Score' what ailen species scam the earth?",
        'Omicrons',
      ),
    ],
    () {},
  ),
  bottomNavigationBarProps: BottomNavigationBarProps(
    BottomBarItemTypes.quiz,
    () {},
    () {},
    () {},
  ),
);
