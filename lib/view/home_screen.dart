import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/colors.dart';
import 'package:note_app/view/widgets/buidnote/buildnote.dart';
import 'package:note_app/view/widgets/textform.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _discriptionController = TextEditingController();

  // List<Map> notes = [];

  ValueNotifier<List<Map>> notifierNotes = ValueNotifier<List<Map>>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Notes",
                style: TextStyle(
                    color: amber, fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.edit,
              color: amber,
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
            valueListenable: notifierNotes,
            builder: (context, List<Map> notes, _) {
              return StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  // itemCount: imageList.length,
                  children: List.generate(notes.length, (index) {
                    Map note = notes[index];
                    return GestureDetector(
                      onLongPress: () {
                        notes.removeAt(index);
                        notifierNotes.notifyListeners();
                      },
                      child: BuildNote(
                        note: note,
                        index: index,
                      ),
                    );
                  }));
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: amber,
          // ignore: prefer_const_constructors
          child: Icon(
            Icons.add,
            color: white,
          ),
          onPressed: () {
            bottomSheet(context);
          }),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius:
                const BorderRadius.vertical(top: const Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Write your Notes",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: amber,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              notifierNotes.value.add({
                                "title": _titleController.text,
                                "description": _discriptionController.text,
                              });
                              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                              notifierNotes.notifyListeners();
                              _titleController.clear();
                              _discriptionController.clear();
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.check, color: amber))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        TextFeald(controller: _titleController, title: "Title"),
                        const SizedBox(height: 10),
                        TextFeald(
                            controller: _discriptionController,
                            title: "Disccription"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ));
  }
}


