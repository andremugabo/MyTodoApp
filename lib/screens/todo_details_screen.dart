import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo.dart';

class TodoDetailsScreen extends StatelessWidget {
  final Todo todo;
  const TodoDetailsScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().add_jm().format(todo.createdAt);
    final primaryColor = const Color(0xFFFFA726);
    // final secondryColor = const Color(0xFFFFCC80);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Todo Details',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Created: ${formattedDate}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                todo.description?.isNotEmpty == true
                    ? todo.description!
                    : "No description provided",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                  label: Text('Back'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ],
          ),
        ));
  }
}
