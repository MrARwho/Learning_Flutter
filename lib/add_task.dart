import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddTask extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 300,
                  child: FormBuilder(
                    key: _formKey,
                    child: FormBuilderTextField(name: 'task',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your Task',
                      ),
                    ),
                  )
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(onPressed: () {
                  _formKey.currentState!.save();
                  final formData = _formKey.currentState?.value;
                  print(formData?['task']);
                  Navigator.pop(context, formData?['task']);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2d7df2),
                  side: BorderSide(color: const Color(0xFFe907fe), width: 2.0)
                )
                , child: Text("Add Task" , style: TextStyle(color: Colors.white),)),
              ),
            ],
          ),
          ]
      ),
    );
  }
}
