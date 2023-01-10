import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/features/addvisitor/controller/addvisitor_controller.dart';

class AddvisitorView extends GetView<AddvisitorController> {
  const AddvisitorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Visitor Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Text(
                  'Add Visitor Details',
                  style: TextStyle(fontSize: 35, color: Colors.black54),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 60,
                  child: Icon(
                    Icons.camera_enhance_outlined,
                    color: Colors.white10,
                    size: 80,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Name ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Phone ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Address ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                DropdownButtonFormField(
                  hint: const Text('Purpose'),
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  items: const [],
                  onChanged: (value) {},
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                DropdownButtonFormField(
                  hint: const Text('To Meet'),
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  items: const [],
                  onChanged: (value) {},
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                CustomButton(
                  title: "Submit",
                  onPress: () {},
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
