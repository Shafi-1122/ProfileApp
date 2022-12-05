import 'package:avodha_test/model/postmodel.dart';
import 'package:avodha_test/services/providers/postdataprovider.dart';
import 'package:avodha_test/services/providers/userdetailsprovider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Editscreen extends StatefulWidget {
  const Editscreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Editscreen> createState() => _MyHomePageState();
}

final TextEditingController namecontroller = TextEditingController();
final TextEditingController mobilecontroller = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController useridController = TextEditingController();

class _MyHomePageState extends State<Editscreen> {
  @override
  Widget build(BuildContext context) {
    String imagePath = '';
    String username = namecontroller.text.trim();
    String mobile = mobilecontroller.text.trim();
    String email = emailController.text.trim();
    String address = addressController.text.trim();
    String userid = useridController.text.trim();

    UserDetails userDetails = UserDetails(
        imagePath: imagePath,
        username: username,
        email: email,
        mobile: mobile,
        address: address,
        userId: userid);
    Future<void> createuser() async {
      var provider = Provider.of<DataClass>(context, listen: false);

      return provider.postData(userDetails);
    }
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FutureBuilder(
                              future: Provider.of<UserdetailsProvider>(context)
                                  .userdetailsfromapi,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return GestureDetector(
                                    onTap: () {
                                      Provider.of<UserdetailsProvider>(context,
                                              listen: false)
                                          .cameraImage();
                                    },
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [CircleAvatar(
                                        radius: 38,
                                        backgroundColor: Colors.white,
                                        child: Consumer<UserdetailsProvider>(
                                          builder: (context, value, child) {
                                            if (value.image != null) {
                                              return CircleAvatar(
                                                  radius: 34,
                                                  backgroundImage:
                                                      FileImage(value.image));
                                            } else {
                                              return CircleAvatar(
                                                radius: 38,
                                                backgroundColor: Colors.white,
                                                child: CircleAvatar(
                                                  radius: 34,
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data!.data![0]
                                                          .imageBinary
                                                          .toString()),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                             Icon(Icons.add_a_photo)
                                      ]
                                    ),
                                  );
                                } else {
                                  return CircleAvatar(
                                    radius: 38,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 34,
                                      backgroundImage: NetworkImage(snapshot
                                          .data!.data![0].imageBinary
                                          .toString()),
                                    ),
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text(
                                "Edit Profile ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                             ),
                            hintText: 'name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'email',
                            border: OutlineInputBorder(
                               ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: mobilecontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                               ),
                            hintText: 'mobile',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                               ),
                            hintText: 'address',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: useridController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                ),
                            hintText: 'id',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor:MaterialStateProperty.all( Color.fromARGB(223, 240, 75, 75)) ),
                              onPressed: () {
                                setState(() {
                                  if(namecontroller.text.isNotEmpty&&useridController.text.isNotEmpty&&emailController.text.isNotEmpty&&addressController.text.isNotEmpty){
                                    createuser();
                                    
                                     showDialog(context: context, builder: (context){
                                    return AlertDialog(title: Text('Restart App to View updates'),actions: [TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child:  Text('Ok'))],);
                                  } );
                                  }
                                  else{
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(title: Text('Missing Field'),actions: [TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child:  Text('Ok'))],);
                                  } );
                                  }
                                  
                                });
                              },
                              child: const Text('create album')),
                        ],
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
