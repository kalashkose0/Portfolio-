class ProjectUtils {
  final String title;
  final String description;
  final String imagePath;
  final List<String> platforms; // 'web', 'android', 'ios'

  ProjectUtils({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.platforms,
  });
}

// ###############
// HOBBY PROJECTS
// List<ProjectUtils> hobbyProjectUtils = [
//   ProjectUtils(
//     image: 'assets/projects/1.png',
//     title: 'English Learning App',
//     subtitle:
//         'This is a comprehensive English learning app for practicing and competing with each other.',
//     androidLink:
//         'https://play.google.com/store/apps/details?id=com.shohatech.eduza',
//   ),
//   ProjectUtils(
//     image: 'assets/projects/02.png',
//     title: 'English Dictionary App',
//     subtitle:
//         'This is a dictionary application for English learners to easily look up word definitions.',
//     androidLink:
//         'https://play.google.com/store/apps/details?id=com.shohatech.eduza_eng_dictionary',
//     iosLink:
//         "https://apps.apple.com/us/app/eduza-english-dictionary/id6443770339",
//   ),
//   ProjectUtils(
//       image: 'assets/projects/03.png',
//       title: 'Pocket Dictionary',
//       subtitle:
//           'This is a word memorising app to save and play your own words as quizes',
//       androidLink:
//           'https://play.google.com/store/apps/details?id=com.shohruhak.eng_pocket_dictionary',
//       iosLink:
//           'https://apps.apple.com/tr/app/pocket-dictionary-1/id6447465115'),
//   ProjectUtils(
//     image: 'assets/projects/04.png',
//     title: 'Tasbeeh Counter',
//     subtitle:
//         'This is a simple dzikr counter app for muslims with persistent storage',
//     androidLink:
//         'https://play.google.com/store/apps/details?id=com.shohatech.tasbeeh',
//   ),
//   ProjectUtils(
//     image: 'assets/projects/05.png',
//     title: 'Todo App',
//     subtitle: 'This is a simple task management app with persistent storage',
//     androidLink:
//         'https://play.google.com/store/apps/details?id=com.shohatech.todo',
//     iosLink: "https://apps.apple.com/us/app/eduza-todo/id6443970333",
//   ),
//   ProjectUtils(
//     image: 'assets/projects/06.png',
//     title: 'NotePad App',
//     subtitle: 'This is a note taking app for MacOS and Android',
//     androidLink:
//         'https://play.google.com/store/apps/details?id=com.shohatech.notepad',
//     iosLink: 'https://apps.apple.com/us/app/eduza-notepad/id6443973859',
//   ),
// ];

// // ###############
// // WORK PROJECTS
// List<ProjectUtils> workProjectUtils = [
//   ProjectUtils(
//     image: 'assets/projects/quiz image.png',
//     title: 'Quiz App',
//     subtitle:
//         'This is a quiz app for students to practice and compete with each other.',
//     webLink: '',
//   ),
//   ProjectUtils(
//     image: 'assets/projects/nexusbuild img.png',
//     title: 'Nexus Build App',
//     subtitle: 'This is a construction management app for Nexus Build company.',
//     webLink: '',
//   ),
//   ProjectUtils(
//     image: 'assets/projects/wallpaper image.png',
//     title: 'Wallpaper App',
//     subtitle: 'This is a wallpaper app for android mobile phones.',
//     webLink: '',
//   ),
// ];
final List<ProjectUtils> projectList = [
  ProjectUtils(
    title: "Quiz App",
    description:
        "This is a quiz app for students to practice and compete with each other.",
    imagePath: "assets/projects/quiz image.png",
    platforms: ['web'],
  ),
  ProjectUtils(
    title: "Nexus Build App",
    description:
        "This is a construction management app for Nexus Build company.",
    imagePath: "assets/projects/nexusbuild img.png",
    platforms: ['web'],
  ),
  ProjectUtils(
    title: "Wallpaper App",
    description: "This is a wallpaper app for android mobile phones.",
    imagePath: "assets/projects/wallpaper image.png",
    platforms: ['web'],
  ),
];
