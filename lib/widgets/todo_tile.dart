import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final Function(bool?) onChanged;

  const TodoTile({super.key, required this.todo, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFFFFA726);
    final textStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        decoration: todo.isDone ? TextDecoration.lineThrough : null,
        color: todo.isDone ? Colors.grey : Colors.black87);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: todo.isDone ? Colors.grey.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: todo.isDone,
            onChanged: onChanged,
            activeColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              todo.title,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
