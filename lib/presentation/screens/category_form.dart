import 'package:flutter/material.dart';

Future<String?> modalNewCategory(BuildContext context) async {
  return showModalBottomSheet<String>(
    context: context,
    builder: (BuildContext context) {
      return const CategoryForm();
    },
  );
}

class CategoryForm extends StatefulWidget {
  const CategoryForm({super.key});
  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('New category'),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    Navigator.pop<String>(context, controller.text);
                  },
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop<String>(context);
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
    controller.dispose();
  }
}
