import 'package:avodha_test/model/profilemodel.dart';
import 'package:avodha_test/services/providers/userdetailsprovider.dart';
import 'package:avodha_test/view/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Profile2 extends StatefulWidget {
  const Profile2({super.key});

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  String theimage = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        FutureBuilder(
          future: Provider.of<UserdetailsProvider>(context).userdetailsfromapi,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              theimage = snapshot.data!.data![0].imageBinary.toString();

              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1522252234503-e356532cafd5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80')),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(70),
                              bottomRight: Radius.circular(70))),
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0, top: 45, right: 30),
                      child: Row(
                        children: [
                          Text(
                            "${snapshot.data!.data![0].username} ",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Editscreen(
                                              title: '',
                                            ))));
                              },
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(223, 240, 75, 75)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(223, 240, 75, 75),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Personal Info",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${snapshot.data!.data![0].userId}',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      Spacer(),
                                      Text('${snapshot.data!.data![0].mobile}',
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${snapshot.data!.data![0].email}',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 7, 6, 6),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_city,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      Spacer(),
                                      Text("${snapshot.data!.data![0].address}",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              );
            } else {
              return Shimmer.fromColors(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(223, 240, 75, 75),
                    ),
                  ),
                  baseColor: Color.fromARGB(223, 240, 75, 75),
                  highlightColor: Colors.grey);
            }
          },
        ),
        Positioned(
          top: 195,
          left: 15,
          child: CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                  radius: 60, backgroundImage: NetworkImage(theimage))),
        ),
      ],
    )));
  }
}
