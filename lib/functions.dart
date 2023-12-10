import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doits_internship_project/pages/admin-dashboard.dart';
import 'package:doits_internship_project/pages/user-dashboard.dart';
import 'package:doits_internship_project/pages/admin-userupdatepage.dart';
import 'package:flutter/material.dart';

class User {
  String id;
  final String name;
  final String email;
  final String password;
  final String department;
  final String usertype;

  User({
    this.id = "",
    required this.name,
    required this.email,
    required this.password,
    required this.department,
    required this.usertype,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'department': department,
        'usertype': usertype,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        department: json['department'],
        usertype: json['usertype'],
      );

  static User mapDocSnapshot(querySnapshot) => User(
        id: querySnapshot.value['id'],
        name: querySnapshot.value['name'],
        email: querySnapshot.value['email'],
        password: querySnapshot.value['password'],
        department: querySnapshot.value['department'],
        usertype: querySnapshot.value['usertype'],
      );
}

Future<bool> checkIfUserExists({required String userEmail}) async {
  bool _userExists = false;

  final QuerySnapshot result = await FirebaseFirestore.instance
      .collection('users')
      .where("email", isEqualTo: userEmail)
      .get();

  final List<DocumentSnapshot> documents = result.docs;

  if (result.size > 0) {
    _userExists = true;
    //exists
  } else {
    _userExists = false;
    //not exists
  }

  return _userExists;
}

Future loginUser(
    {required String useremail,
    required String userpassword,
    required BuildContext buildcontext}) async {
  final dbRef = FirebaseFirestore.instance
      .collection('users')
      .where("email", isEqualTo: useremail)
      .get()
      .then(
    (querySnapshot) {
      if (identical(querySnapshot.docs[0]["password"], userpassword)) {
        if (identical(querySnapshot.docs[0]["usertype"], "Admin")) {
          String username = querySnapshot.docs[0]["name"];
          ScaffoldMessenger.of(buildcontext).hideCurrentSnackBar();
          Navigator.push(
              buildcontext,
              MaterialPageRoute(
                builder: (context) => AdminDashboard(
                  title: "PEO",
                  username: username,
                ),
              ));
        } else {
          String username = querySnapshot.docs[0]["name"];
          ScaffoldMessenger.of(buildcontext).hideCurrentSnackBar();
          Navigator.push(
              buildcontext,
              MaterialPageRoute(
                builder: (context) => UserDashboard(
                  title: "PEO",
                  username: username,
                ),
              ));
        }
      }
      if (!identical(querySnapshot.docs[0]["password"], userpassword)) {
        ScaffoldMessenger.of(buildcontext).hideCurrentSnackBar();
        ScaffoldMessenger.of(buildcontext).showSnackBar(
          const SnackBar(
            content: Text('Incorrect Password'),
          ),
        );
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future createUser(
    {required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String department,
    required String usertype}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();

  final user = User(
    id: docUser.id,
    name: name,
    email: email,
    password: password,
    department: department,
    usertype: usertype,
  );

  final json = user.toJson();

  await docUser.set(json);
  return "User account successfully made";
}

Future updateUser(
    {required BuildContext context,
    required String id,
    required String name,
    required String email, 
    required String department,
    required String usertype}) async {
  final userRef =
      FirebaseFirestore.instance.collection("users").doc(id);
  userRef.update({
    "name": name,
    "email": email,
    "department": department,
    "usertype": usertype,
  });
  Navigator.pop(context);
}

Future deleteUser({required String userid}) async {
  final userRef = FirebaseFirestore.instance
      .collection("users")
      .doc(userid);
  userRef.delete().then(
        (doc) => print("User deleted"),
        onError: (e) => print("Error updating Violation Type $e"),
      );
}

//This part is for the list of Users display
Stream<List<User>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

//This part is for the User search display
Stream<List<User>> searchUsers(
        {required String searchcategory, required String searchkey}) =>
    FirebaseFirestore.instance
        .collection('users')
        .where(searchcategory, isEqualTo: searchkey)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

Widget buildUsersListView(List users, BuildContext context, String username) =>
    ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: ((context, index) {
          final user = users[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminUpdateUserPage(
                            username: username, user: user)));
              },
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 207, 216, 220)),
                          left: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 207, 216, 220)),
                          bottom: BorderSide(
                            width: 0,
                          ),
                        ),
                      ),
                      child: Text(
                        user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 207, 216, 220)),
                          left: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 207, 216, 220)),
                          bottom: BorderSide(
                            width: 0,
                          ),
                        ),
                      ),
                      child: Text(
                        user.usertype,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 207, 216, 220)),
                          left: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 207, 216, 220)),
                          bottom: BorderSide(
                            width: 0,
                          ),
                        ),
                      ),
                      child: Text(
                        user.department,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
 