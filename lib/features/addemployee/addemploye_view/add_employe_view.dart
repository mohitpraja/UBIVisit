import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../addemploye_controller/add_employe_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:Container(

          child: Column(
            children: [
              Image.asset(
                "assets/images/addemployee.png",
                height: 50,
                width: 60,
              ),

              SafeArea(
                  child: SingleChildScrollView
                    (child:
                  Padding(padding:  EdgeInsets.symmetric(vertical:10,horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          alignment:Alignment.center,
                          child: const Text("Add New Employee",
                            style: TextStyle(fontSize: 30, color: Colors.indigo,
                                fontWeight: FontWeight.bold),

                          ),
                        ),

                        const SizedBox(height: 25,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          decoration:
                          InputDecoration(filled: true,
                            fillColor: Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Name:",
                            prefixIcon: Icon(Icons.person),
                          ),
                            validator: (value) {
                              if (value == null ||value.length<5)
                                return 'Name must be more than 5 charater';
                              else
                                return null;
                            }
                        ),

                        const SizedBox(height: 21,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          decoration:
                          InputDecoration(filled: true,
                            fillColor: Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Email:",
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                            validator: (value){
                              Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern.toString());
                              if (!regex.hasMatch(value!))
                                return 'Enter Valid Email';
                              else
                                return null;
                            }
                        ),


                        const SizedBox(height: 21,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          decoration:
                          InputDecoration(filled: true,
                            fillColor:  Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Phone: ",
                            prefixIcon: Icon(Icons.phone),
                          ),
                            validator:(value) {
                              // Indian Mobile number are of 10 digit only
                              if (value == null ||value.length<10)
                                return 'Mobile Number must be of 10 digit';
                              else
                                return null;
                            }
                        ),

                        const SizedBox(height: 21,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          decoration:
                          InputDecoration(filled: true,
                            fillColor:  Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Role: ",
                            prefixIcon: Icon(Icons.list_alt),
                          ),
                            validator: (value) {
                              if (value == null ||value.length<5)
                                return 'Enter your role';
                              else
                                return null;
                            }
                        ),


                      const SizedBox(height: 21,),
                       Obx(() => TextFormField(
                         autovalidateMode: AutovalidateMode.onUserInteraction,
                         obscureText: controller.isPassword.value,
                         decoration:
                         InputDecoration(filled: true,
                           fillColor: Colors.grey.shade400,
                           border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                           hintText: "Enter Password",
                           prefixIcon: Icon(Icons.lock_outline),
                           suffixIcon: IconButton(
                             icon: controller.isPassword.value
                               ? const Icon(Icons.visibility)
                               : const Icon(Icons.visibility_off),
                               onPressed: () {
                               controller.showPassword();
                               },

                           ),
                      ),
                           validator: (value){
                             if (value == null ||value.length<8) {
                               return "Password must be of 8 characters";
                             }
                             return null;
                           }
                       ),),


                        const SizedBox(height: 21,),
                        Obx(() => TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: controller.isPassword.value,
                          decoration:
                          InputDecoration(filled: true,
                            fillColor: Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: controller.isPassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                controller.showPassword();
                              },

                            ),
                          ),
                            validator: (value){

                              if(value == null ||value.length<8){
                                return "Enter same password again";
                              }
                              return null;
                            }
                        ),),

                        const SizedBox(
                          height: 25,

                        ),
                        Center(
                            child: ElevatedButton(
                             style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),),
                              padding: MaterialStateProperty.all
                                (EdgeInsets.symmetric(vertical: 15, horizontal: 100,),),
                              backgroundColor: MaterialStateProperty.all(Colors.indigo),
                                ),
                                onPressed: (){

                               },
                                child: Text("Save",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                                color:Colors.white, ),),
                          ),
                        ),




                          ]
                    ),
                  ),
                  ),
              ),
            ],
          ),
        ),
    );
  }



}
