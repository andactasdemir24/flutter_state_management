import 'package:flutter/material.dart';
import 'package:state_management/list_view_state.dart';
import 'package:state_management/model/post.dart';
import 'package:state_management/service/service_locator.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<ListViewState>();
    return ValueListenableBuilder<List<Post>>(
        valueListenable: state.posts,
        builder: (context, postsValue, _) {
          return ListView(
            children: postsValue
                .map((post) => Card(
                      child: ListTile(
                        title: Text(post.title!),
                        subtitle: Text(post.body!),
                        leading: CircleAvatar(
                          child: Text(post.id.toString()),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              state.postRemoved(post);
                            },
                            icon: const Icon(Icons.remove_circle_outline)),
                      ),
                    ))
                .toList(),
          );
        });
  }
}
