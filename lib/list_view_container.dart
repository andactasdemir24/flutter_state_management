import 'package:flutter/material.dart';
import 'package:state_management/list_view_state.dart';
import 'package:state_management/service/service_locator.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<ListViewState>();
    return ListView(
      children: state.posts
          .map((post) => Card(
                child: ListTile(
                  title: Text(post.title!),
                  subtitle: Text(post.body!),
                  leading: CircleAvatar(
                    child: Text(post.id.toString()),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
