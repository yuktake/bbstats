// import 'dart:math';
//
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../providers/isar_provider.dart';
//
// class ProfileDataTable extends ConsumerWidget {
//   ProfileDataTable({Key? key}) : super(key: key);
//
//   var _isAscending = true;
//   var _currentSortColumn = 0;
//
//   // final List<Map> _list = List.generate(15, (index) => {
//   //   'PLAYER': index,
//   //   '#':  index,
//   //   'POS': index,
//   //   'HEIGHT': Random().nextDouble() + 1,
//   //   'WEIGHT': Random().nextDouble() + 1,
//   // },);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final homeInfo = ref.watch(homeProvider);
//     // final home = ref.watch(homeProvider.notifier);
//     final documentPath = ref.watch(documentPathProvider);
//
//     return
//       SizedBox(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           child: DataTable2(
//             fixedLeftColumns: 1,
//             sortColumnIndex: _currentSortColumn,
//             sortAscending: _isAscending,
//             columnSpacing: 12,
//             horizontalMargin: 12,
//             minWidth: 600,
//             columns: [
//               DataColumn(
//                 label: Text('PLAYER'),
//               ),
//               DataColumn(
//                 label: Text('POS'),
//               ),
//               DataColumn(
//                 label: Text('HEIGHT'),
//                 onSort: (columnIndex, isAscending) {
//                   // setState(() {
//                   //   _currentSortColumn = columnIndex;
//                   //   if (_isAscending == true) {
//                   //     _isAscending = false;
//                   //     //高い順
//                   //     _list.sort(
//                   //           (a, b) => b['HEIGHT'].compareTo(a['HEIGHT']),
//                   //     );
//                   //   } else {
//                   //     _isAscending = true;
//                   //     //安い順
//                   //     _list.sort((a, b) => a['HEIGHT'].compareTo(b['HEIGHT']));
//                   //   }
//                   // });
//                 },
//               ),
//             ],
//             rows: homeInfo.players
//                 .map(
//                   (e) => DataRow(
//                 cells: [
//                   DataCell(
//                     Text('${e.name}'),
//                   ),
//                   DataCell(
//                     Text(''),
//                   ),
//                   DataCell(
//                     Text(''),
//                   ),
//                 ],
//               ),
//             ).toList(),
//           ),
//         );
//   }
// }