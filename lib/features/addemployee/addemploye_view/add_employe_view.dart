import 'package:flutter/material.dart';

class AddEmployeeView extends StatefulWidget {
  const AddEmployeeView({Key? key}) : super(key: key);

  @override
  State<AddEmployeeView> createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
  bool _obsecureText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:Container(

          child: Column(
            children: [
              Image.asset(
                "assets/profile_icon-png",
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
                          decoration:
                          InputDecoration(filled: true,
                            fillColor: Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Name:",
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),

                        const SizedBox(height: 21,),
                        TextFormField(
                          decoration:
                          InputDecoration(filled: true,
                            fillColor: Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Email:",
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),


                        const SizedBox(height: 21,),
                        TextFormField(
                          decoration:
                          InputDecoration(filled: true,
                            fillColor:  Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Phone: ",
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),

                        const SizedBox(height: 21,),
                        TextFormField(
                          decoration:
                          InputDecoration(filled: true,
                            fillColor:  Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Role: ",
                            prefixIcon: Icon(Icons.list_alt),
                          ),
                        ),

                        const SizedBox(height: 21,),
                        TextFormField(
                          obscureText: _obsecureText,
                          decoration:
                          InputDecoration(filled: true,
                            fillColor: Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Enter Password",
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _obsecureText =! _obsecureText;
                                });
                              }, icon: Icon(_obsecureText? Icons.visibility: Icons.visibility_off),),
                          ),
                        ),
                        const SizedBox(height: 21,),
                        TextFormField(  obscureText: _obsecureText,
                          decoration:
                          InputDecoration(filled: true,
                            fillColor:Colors.grey.shade400,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _obsecureText =! _obsecureText;
                                });
                              }, icon: Icon(_obsecureText? Icons.visibility: Icons.visibility_off),),
                          ),
                        ),
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
                          ],
                        )



                    ),
                  ),
                  )
            ],
          ),
        ),
    );
  }
}

