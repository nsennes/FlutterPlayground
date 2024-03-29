// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    Color DogwoodRose = Color(0xffC62E65);
    Color PapayaWhip = Color(0xffFDF0D5);
    Color TeaRoseRed = Color(0xffE0B7B7);

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 22),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 121, 19, 57),
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(9.5),
            )
          ],
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: TeaRoseRed,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      color: PapayaWhip,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Color.fromARGB(255, 77, 1, 49)),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: DogwoodRose, borderRadius: BorderRadius.circular(13.5)),
        ),
      ),
    );
  }
}
