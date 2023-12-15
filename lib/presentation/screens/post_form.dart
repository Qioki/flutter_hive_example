import 'package:flutter/material.dart';
import 'package:flutter_hive_example/domain/entity/post/post.dart';

Future<Post?> modalNewPost(BuildContext context) async {
  return showModalBottomSheet<Post>(
    context: context,
    builder: (BuildContext context) {
      return const PostForm();
    },
  );
}

class PostForm extends StatefulWidget {
  const PostForm({super.key});
  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('New post'),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    Navigator.pop<Post>(context,
                        Post(titleController.text, descriptionController.text));
                  },
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop<Post>(context);
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }
}
