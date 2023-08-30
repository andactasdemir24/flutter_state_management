// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:state_management/model/post.dart';

class ListViewState {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([
    Post(
      userId: 1,
      id: 1,
      title: "sunt aut facere repellat provident occaecati excepturi optio ",
      body:
          "quia et suscipitsuscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
    ),
    Post(
      userId: 1,
      id: 2,
      title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body:
          "quia et suscipitsuscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
    ),
    Post(
      userId: 1,
      id: 3,
      title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body:
          "quia et suscipitsuscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
    ),
    Post(
      userId: 1,
      id: 4,
      title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body:
          "quia et suscipitsuscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
    ),
    Post(
      userId: 1,
      id: 5,
      title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body:
          "quia et suscipitsuscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
    ),
    Post(
      userId: 1,
      id: 6,
      title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body:
          "quia et suscipitsuscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
    ),
  ]);

  void postRemoved(Post postToRemoved) {
    print(posts.value.length);
    posts.value.remove(postToRemoved);
    posts.value = List<Post>.from(posts.value);
    print(posts.value.length);
  }

  void postAdd(Post postToAdd) {
    posts.value.add(postToAdd);
    posts.value = List<Post>.from(posts.value);
  }
}
