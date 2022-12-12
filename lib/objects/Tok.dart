import 'package:flutter/material.dart';

const String col_taskid = 'task_id';
const String col_assigned = 'assigned_by';
const String col_title = 'task_tittle';
const String col_description = 'description';
const String col_Category_id = 'tag';
const String col_assignto = 'assign_to';
const String col_creation_date = 'creation_date';
const String col_deadline_date = 'complete_by_date';
const String col_reassign_time = 'time_reassigned';
const String col_completed_time = 'completed_time';
const String col_completed_date = 'complete_date';
const String col_status = 'status';

//const String col_ = '';

class Tok {
  int task_id, category;

  String assigned_by,
      task_title,
      description,
      assign_to,
      creation_date,
      deadline_date,
      reassign_time,
      completed_time,
      completed_date,
      status;

  Tok({
    required this.task_id,
    required this.task_title,
    required this.description,
    required this.category,
    required this.assign_to,
    required this.assigned_by,
    required this.creation_date,
    required this.reassign_time,
    required this.completed_time,
    required this.deadline_date,
    required this.completed_date,
    required this.status,
  });

  factory Tok.fromMap(Map<String, dynamic> map) => Tok(
        task_id: map[col_taskid],
        assigned_by: map[col_assigned],
        task_title: map[col_title],
        description: map[col_description],
        category: map[col_Category_id],
        assign_to: map[col_assignto],
        creation_date: map[col_creation_date],
        completed_date: map[col_completed_date],
        deadline_date: map[col_deadline_date],
        completed_time: map[col_completed_time],
        reassign_time: map[col_reassign_time], status: map[col_status],
        // : map[col_],
      );

  String todata() =>
      '$task_id,$task_title,$description,$category,$assign_to,$assigned_by';
}
