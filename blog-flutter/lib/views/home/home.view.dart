import 'dart:convert';

import 'package:blog/cubit/posts_cubit.dart';
import 'package:blog/model/post.dart';
import 'package:blog/utils/navigation_util.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

FilePickerResult? _result;
final _titleController = TextEditingController();
final _contentController = TextEditingController();

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostsCubit>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fake Blog'),
        ),
        body: const Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Add Post'),
                      content: const MyForm(),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await cubit.addPost(
                                title: _titleController.text,
                                content: _contentController.text,
                                file: _result!.files.first.bytes!);

                            showToast('Post added',
                                position: ToastPosition.bottom);
                            Navigation.pop();
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ));
          },
          child: const Icon(Icons.add),
        ));
  }
}

class MyForm extends StatefulWidget {
  const MyForm({
    super.key,
  });

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: const EdgeInsets.all(0),
            child: _result == null
                ? null
                : Image.memory(
                    _result!.files.first.bytes!,
                    height: 350,
                    fit: BoxFit.fill,
                  )),
        ElevatedButton(
          onPressed: () async {
            try {
              final result = await FilePickerWeb.platform.pickFiles();
              if (result != null) {
                setState(() {
                  _result = result;
                });
              } else {
                showToast('No file selected', position: ToastPosition.bottom);
              }
            } catch (e) {
              print(e);
            }
          },
          child: const Text('Pick File'),
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Title',
          ),
          controller: _titleController,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Content',
          ),
          controller: _contentController,
        ),
      ],
    ));
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(builder: (_, state) {
      switch (state.runtimeType) {
        case const (PostsLoading):
          return const Center(
            child: CircularProgressIndicator(),
          );
        case const (PostsLoaded):
          final posts = (state as PostsLoaded).posts;

          return Posts(posts: posts);
        default:
          return const Center(
            child: Text('Something went wrong'),
          );
      }
    });
  }
}

const noPhoto =
    "https://static.vecteezy.com/system/resources/thumbnails/019/879/186/small/user-icon-on-transparent-background-free-png.png";

class Posts extends StatelessWidget {
  const Posts({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return MyCard(post: post);
        },
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.post,
  });
  final Post post;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    final cubit = context.read<PostsCubit>();
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(post.author.photo ?? noPhoto),
            title: Text(post.author.name),
          ),
          if (post.photo != null)
            Image.memory(
              base64Decode(post.photo!),
              height: 200,
            ),
          ListTile(
            title: Text(post.title),
            subtitle: Text(post.content),
          ),
          const Text('Commentarios:'),
          for (var comment in post.comments)
            ListTile(
              title: Text('${comment.content}'),
            ),
          Form(
            key: formKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Comment',
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Comenta algo' : null,
                    controller: textController,
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      await cubit.comment(
                          postId: post.id, comment: textController.text);
                    },
                    child: const Text('Comment'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
