// import 'dart:io';
//
// import 'package:bb_stats/src/screens/team_edit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../providers/isar_provider.dart';
//
// class TeamTmpScreen extends StatelessWidget {
//   const TeamTmpScreen({Key? key}) : super(key: key);
//
//   @override
//   // Widget build(BuildContext context, WidgetRef ref) {
//   Widget build(BuildContext context) {
//
//     // final team = ref.watch(teamProvider(1).notifier);
//     // final teamInfo = ref.watch(teamProvider(1));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Team Profile'),
//         actions: [
//           Consumer(builder: (context, ref, _) {
//             final team = ref.watch(teamProvider(1).notifier);
//             final teamInfo = ref.watch(teamProvider(1));
//             return IconButton(
//               icon: Icon(Icons.edit),
//               onPressed: () => {
//                 team.resetPreview(),
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => TeamEditScreen(),
//                   ),
//                 )
//               },
//             );
//           }),
//         ],
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Consumer(builder: (context, ref, _) {
//               final teamInfo = ref.watch(teamProvider(1));
//               final team = ref.watch(teamProvider(1).notifier);
//               team.showImage(id: 1);
//
//               return teamInfo.image == null ?
//               const CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.blue,
//                 child: Text('No Image'),
//               )
//               :
//               (
//                 // ファイル名を変えず画像データのみの変更を検知できるようにするため、変な書き方をしています。
//                 CircleAvatar(
//                   radius: 50,
//                   // backgroundImage: AssetImage(teamInfo.image!.path),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(50),
//                     child: Image.file(
//                       // new File(teamInfo.image!.path),
//                       new File(teamInfo.image!),
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.fill,
//                     ),
//                   )
//                 )
//               );
//             }),
//             Consumer(builder: (context, ref, _) {
//               final teamInfo = ref.watch(teamProvider(1));
//               return Text(
//                 teamInfo.name,
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w800,
//                   color: Color(0xFF242629),
//                 ),
//               );
//             }),
//           ],
//         ),
//       )
//     );
//   }
// }
