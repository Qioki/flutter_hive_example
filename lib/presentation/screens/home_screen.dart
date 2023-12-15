import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hive_example/domain/entity/category/category.dart';
import 'package:flutter_hive_example/presentation/cubits/category/category_cubit.dart';
import 'package:flutter_hive_example/presentation/screens/category_form.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title = 'Categories'});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CategoryCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) => state.when(
            initial: () => const Text('No data'),
            success: (List<Category> categories) => ListView.builder(
                itemCount: categories.length,
                itemBuilder: (c, i) {
                  return InkWell(
                      onTap: () {
                        context.go('/${categories[i].title}');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        color: Colors.blue[50],
                        child: Text(categories[i].title),
                      ));
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await modalNewCategory(context);
          if (result != null) {
            await cubit.newCategory(result);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
