// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fpdart/fpdart.dart';

// import '../../../core/common_widgets/my_app_bar.dart';
// import '../../../models/user_model.dart';
// import '../../../providers/utils_providers.dart';
// import '../controllers/search_controller.dart';

// class SearchScreen extends ConsumerStatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends ConsumerState<SearchScreen> {
//   late List<String> searched;
//   @override
//   Widget build(BuildContext context) {
//     List<MyUserModel> users = ref.read(searchControllerProvider);
//     return Scaffold(
//       appBar: MyAppBar(context, title: 'Search'),
//       body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: ref.watch(searchFutureProvider()).when(
//                 data: (d) => SearchAnchor.bar(
//                     onSubmitted: (v) {
//                       print(v);
//                     },
//                     barHintText: 'Look for people you may know!',
//                     barHintStyle: const MaterialStatePropertyAll(
//                         TextStyle(color: Colors.grey)),
//                     suggestionsBuilder: (context, controller) {
//                       if (controller.text.isEmpty) {
//                         return ref.read(myUserProvider)!.searched.map((e) {
//                           MyUserModel user =
//                               users.filter((user) => user.uid == e).first;
//                           return MatchTile(
//                             user: user,
//                             history: true,
//                             onDelete: () async {
//                               await ref
//                                   .read(searchControllerProvider.notifier)
//                                   .searchClear(e);
//                               print(ref.read(myUserProvider)!.searched);
//                             },
//                           );
//                         });
//                       }
//                       return ref
//                           .read(searchControllerProvider.notifier)
//                           .searchUser(controller.text)
//                           .map((e) => MatchTile(
//                               user: e,
//                               onTap: () async => await ref
//                                   .read(searchControllerProvider.notifier)
//                                   .searchClicked(e.uid)));
//                     }),
//                 error: (e, t) => const Icon(Icons.close),
//                 loading: () => const CircularProgressIndicator()),
//           )),
//     );
//   }
// }
