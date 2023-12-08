import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'milestone_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Milestone> milestones = [];

  @override
  void initState() {
    super.initState();
    loadMilestones();
  }

  Future<void> loadMilestones() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? milestonesJson = prefs.getStringList('milestones');

    if (milestonesJson != null) {
      setState(() {
        milestones = milestonesJson
            .map((json) => Milestone.fromJson(jsonDecode(json)))
            .toList();
      });
    }
  }

  Future<void> saveMilestones() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> milestonesJson =
        milestones.map((milestone) => jsonEncode(milestone.toJson())).toList();
    prefs.setStringList('milestones', milestonesJson);
  }

  Future<void> showAddMilestoneDialog(BuildContext context) async {
    Milestone newMilestone =
        Milestone(id: const Uuid().v4(), date: '', type: '', notes: '');

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Milestone'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Date'),
                  onChanged: (value) => newMilestone.date = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Type'),
                  onChanged: (value) => newMilestone.type = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Notes'),
                  onChanged: (value) => newMilestone.notes = value,
                ),
                // Optionally add an image URL field
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Image (Optional)'),
                //   onChanged: (value) => newMilestone.image = value,
                // ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                addMilestone(newMilestone);
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void addMilestone(Milestone milestone) {
    setState(() {
      milestones.add(milestone);
      saveMilestones();
    });
  }

  Future<void> showEditMilestoneDialog(
      BuildContext context, Milestone milestone) async {
    Milestone editedMilestone = Milestone(
      id: milestone.id,
      date: milestone.date,
      type: milestone.type,
      notes: milestone.notes,
      image: milestone.image,
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Milestone'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: editedMilestone.date,
                  decoration: const InputDecoration(labelText: 'Date'),
                  onChanged: (value) => editedMilestone.date = value,
                ),
                TextFormField(
                  initialValue: editedMilestone.type,
                  decoration: const InputDecoration(labelText: 'Type'),
                  onChanged: (value) => editedMilestone.type = value,
                ),
                TextFormField(
                  initialValue: editedMilestone.notes,
                  decoration: const InputDecoration(labelText: 'Notes'),
                  onChanged: (value) => editedMilestone.notes = value,
                ),
                // Optionally add an image URL field
                // TextFormField(
                //   initialValue: editedMilestone.image ?? '',
                //   decoration: InputDecoration(labelText: 'Image (Optional)'),
                //   onChanged: (value) => editedMilestone.image = value,
                // ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                editMilestone(editedMilestone);
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ],
        );
      },
    );
  }

  void editMilestone(Milestone editedMilestone) {
    setState(() {
      int index = milestones
          .indexWhere((milestone) => milestone.id == editedMilestone.id);
      if (index != -1) {
        milestones[index] = editedMilestone;
        saveMilestones();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Milestone Tracker'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddMilestoneDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: milestones.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                'Date: ${milestones[index].date} \nType: ${milestones[index].type}'),
            subtitle: Text('Notes: ${milestones[index].notes}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showEditMilestoneDialog(context, milestones[index]);
              },
            ),
            // Optionally display the image
            // leading: milestones[index].image != null ? Image.network(milestones[index].image!) : null,
          );
        },
      ),
    );
  }
}
