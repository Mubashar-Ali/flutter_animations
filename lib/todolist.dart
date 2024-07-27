import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<TodoItem> items = [];
  var textController = TextEditingController();
  var textFocus = FocusNode();
  bool toggle = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void btnSend() {
    if (textController.text.isNotEmpty) {
      setState(() {
        final newItem = TodoItem(
          title: textController.text,
          isChecked: false,
        );
        items.add(newItem);
        _listKey.currentState?.insertItem(items.length - 1);
        textController.clear();
        textFocus.requestFocus();
      });
    }
  }

  void btnDel(int index) {
    setState(() {
      final removedItem = items.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => TodoItemWidget(
          item: removedItem,
          animation: animation,
          onEdit: () => btnEdit(index),
          onDelete: () => btnDel(index),
          onCheckedChanged: (value) {
            setState(() {
              removedItem.isChecked = value!;
            });
          },
        ),
      );
    });
  }

  void btnEdit(int index) {
    setState(() {
      textFocus.requestFocus();
      textController.text = items[index].title;
      btnDel(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Todo List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: w * .9,
          height: h * .9,
          decoration: BoxDecoration(
            color: Colors.blue.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: w * .7,
                    child: TextField(
                      controller: textController,
                      focusNode: textFocus,
                      decoration: const InputDecoration(
                        labelText: 'Enter Item',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: btnSend,
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: toggle,
                    onChanged: (value) {
                      setState(() {
                        toggle = value!;
                      });
                    },
                  ),
                  const Text(
                    'Show Finished Items',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(color: Colors.black26, indent: 10, endIndent: 10),
              Expanded(
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: items.length,
                  itemBuilder: (context, index, animation) {
                    if (!toggle && items[index].isChecked) {
                      return const SizedBox();
                    }
                    return TodoItemWidget(
                      item: items[index],
                      animation: animation,
                      onEdit: () => btnEdit(index),
                      onDelete: () => btnDel(index),
                      onCheckedChanged: (value) {
                        setState(() {
                          items[index].isChecked = value!;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoItemWidget extends StatelessWidget {
  final TodoItem item;
  final Animation<double> animation;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool?> onCheckedChanged;

  const TodoItemWidget({
    super.key,
    required this.item,
    required this.animation,
    required this.onEdit,
    required this.onDelete,
    required this.onCheckedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: ListTile(
          leading: Checkbox(
            value: item.isChecked,
            onChanged: onCheckedChanged,
          ),
          title: Text(
            item.title,
            style: TextStyle(
              decoration: item.isChecked
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: item.isChecked ? Colors.black38 : Colors.black,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoItem {
  String title;
  bool isChecked;

  TodoItem({required this.title, required this.isChecked});
}
