import 'package:flutter/material.dart';
import 'package:todoapp/models/filter.dart';
import '../models/todo.dart';
import '../widgets/todo_tile.dart';
import 'todo_details_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> _todos = [];
  TodoFilter _currentFilter = TodoFilter.all;

  final primaryColor = Color(0xFFFFA726);
  final secondaryColor = Color(0xFFFFCC80);

  List<Todo> get _filteredTodos {
    switch (_currentFilter) {
      case TodoFilter.completed:
        return _todos.where((t) => t.isDone).toList();
      case TodoFilter.pending:
        return _todos.where((t) => !t.isDone).toList();
      case TodoFilter.all:
        return _todos;
    }
  }

  void _addTodo(String title, String? description) {
    setState(() {
      _todos.add(
        Todo(title: title, description: description),
      );
    });
  }

  void _toggleDone(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _showAddTodoDialog() {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Add Todo',
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtrl,
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: TextStyle(color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: primaryColor.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: descCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle: TextStyle(color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: primaryColor.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                ),
              ),
            ],
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addTodo(titleCtrl.text, descCtrl.text);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              'Save',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Todo Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: _showAddTodoDialog,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor.withAlpha(150),
                  child: Text(
                    widget.userName[0].toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Welcome, ${widget.userName}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: TodoFilter.values.map((f) {
                  final isSelected = f == _currentFilter;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(f.name),
                      selected: isSelected,
                      selectedColor: primaryColor,
                      onSelected: (_) => setState(() => _currentFilter = f),
                      labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: _filteredTodos.isEmpty
                  ? Center(
                      child: Text(
                        'No Todos Found',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.separated(
                      itemCount: _filteredTodos.length,
                      separatorBuilder: (_, __) => SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (_, i) {
                        final todo = _filteredTodos[i];
                        return Dismissible(
                          key: ValueKey(todo.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => _deleteTodo(_todos.indexOf(todo)),
                          confirmDismiss: (_) async {
                            return await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Delete Todo"),
                                content: Text(
                                    "Are you sure you want to delete this todo?"),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                    ),
                                    child: Text("Delete",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            );
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.delete,
                                color: Colors.white, size: 28),
                          ),
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        TodoDetailsScreen(todo: todo),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TodoTile(
                                  todo: todo,
                                  onChanged: (_) =>
                                      _toggleDone(_todos.indexOf(todo)),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
