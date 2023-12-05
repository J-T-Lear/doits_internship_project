import 'package:doits_internship_project/pages/admin-dashboard.dart';
import 'package:doits_internship_project/pages/admin-userspage.dart';
import 'package:doits_internship_project/pages/loginpage.dart';
import 'package:doits_internship_project/functions.dart';
import 'package:flutter/material.dart';

class AdminUpdateUserPage extends StatefulWidget {
  const AdminUpdateUserPage(
      {super.key, required this.username, required this.user});

  final String username;
  final User user;

  @override
  State<AdminUpdateUserPage> createState() => _AdminUpdateUserPage();
}

class _AdminUpdateUserPage extends State<AdminUpdateUserPage> {
  final _formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  String _accountType = "Standard";
  String _accountDepartment = "Maintenance";

  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  @override
  void initState() {
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 25, 48, 100),
                                    border: Border.all(width: 0.0),
                                    borderRadius: const BorderRadius.all(
                                        Radius.elliptical(100, 50)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Insert Logo",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            )
                          ],
                        )),
                    const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            "PEO",
                            style: TextStyle(
                              color: Color.fromARGB(255, 25, 48, 100),
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Expanded(flex: 18, child: Container()),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Refresh"),
                          ));
                        },
                        child: const Icon(
                          Icons.refresh_rounded,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      indent: 6,
                      endIndent: 6,
                      width: 0,
                    ),
                    Expanded(
                      flex: 2,
                      child: MenuAnchor(
                        childFocusNode: _buttonFocusNode,
                        menuChildren: <Widget>[
                          MenuItemButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 25, 48, 100),
                            )),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(4, 4, 20, 10),
                              child: Text(widget.username,
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          ),
                          MenuItemButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Colors.white,
                            )),
                            child: const Row(
                              children: [
                                Icon(Icons.perm_identity),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text("Profile"),
                                )
                              ],
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Profile"),
                              ));
                            },
                          ),
                          MenuItemButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Colors.white,
                            )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginPage(title: "PEO"),
                                  ));
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.power_settings_new),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text("Log Out"),
                                )
                              ],
                            ),
                          ),
                        ],
                        builder: (BuildContext context,
                            MenuController controller, Widget? child) {
                          return TextButton(
                            focusNode: _buttonFocusNode,
                            onPressed: () {
                              if (controller.isOpen) {
                                controller.close();
                              } else {
                                controller.open();
                              }
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 25, 48, 100),
                                  border: Border.all(
                                      color: Colors.black, width: 0.0),
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Logo",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 9,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: const Color.fromARGB(255, 25, 48, 100),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.all(12),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "MENU",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color:
                                          Color.fromRGBO(106, 109, 150, 100)),
                                ),
                              ),
                            )),
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AdminDashboard(
                                              title: "PEO",
                                              username: widget.username),
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.desktop_windows_outlined,
                                          color: Color.fromRGBO(
                                              106, 109, 150, 100),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Dashboard",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AdminUsersPage(
                                              title: "PEO",
                                              username: widget.username),
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color:
                                          const Color.fromARGB(156, 27, 32, 61),
                                    ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.people,
                                          color: Color.fromRGBO(
                                              106, 109, 150, 100),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Users",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            const Spacer(
                              flex: 9,
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: const Color.fromARGB(255, 233, 232, 238),
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 80),
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Update User",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 25, 48, 100),
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 2,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 30, 20, 10),
                                  child: Row(
                                    children: [
                                      const Text("Name: "),
                                      SizedBox(
                                        height: 30,
                                        width: 300,
                                        child: TextFormField(
                                          controller: nameController,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              height: 1.0,
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.all(4),
                                              border: OutlineInputBorder()),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Enter Name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Row(
                                    children: [
                                      const Text("Email: "),
                                      SizedBox(
                                        height: 30,
                                        width: 300,
                                        child: TextFormField(
                                          controller: emailController,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              height: 1.0,
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.all(4),
                                              border: OutlineInputBorder()),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Enter Email';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text("Account Type"),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors
                                                .white, //background color of dropdown button
                                            border: Border.all(
                                                color: Colors.black38,
                                                width: 1),
                                          ),
                                          child: DropdownButton<String>(
                                              items: const [
                                                DropdownMenuItem(
                                                  value: "Standard",
                                                  child: Text("Standard"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "Admin",
                                                  child: Text("Admin"),
                                                ),
                                              ],
                                              value: _accountType,
                                              underline: Container(),
                                              onChanged: (selectedAccountType) {
                                                setState(() {
                                                  _accountType =
                                                      selectedAccountType!;
                                                });
                                              })),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 0, 4, 0),
                                        child: Text("Department"),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          height: 30,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors
                                                .white, //background color of dropdown button
                                            border: Border.all(
                                                color: Colors.black38,
                                                width: 1),
                                          ),
                                          child: DropdownButton<String>(
                                              items: const [
                                                DropdownMenuItem(
                                                  value: "Maintenance",
                                                  child: Text("Maintenance"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "HR",
                                                  child: Text("HR"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "Finance",
                                                  child: Text("Finance"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "Admin",
                                                  child: Text("Admin"),
                                                ),
                                              ],
                                              value: _accountDepartment,
                                              underline: Container(),
                                              onChanged: (selectedDepartment) {
                                                setState(() {
                                                  _accountDepartment =
                                                      selectedDepartment!;
                                                });
                                              })),
                                      const Spacer(
                                        flex: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      150, 20, 150, 10),
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                              Color.fromARGB(255, 25, 48, 100),
                                            ),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)))),
                                        onPressed: () {
                                          if (_formkey.currentState!.validate()) {
                                            deleteUser(userid: widget.user.id);
                                       
                                      
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdminUsersPage(
                                                    title: "PEO",
                                                    username: widget.username,
                                                  ),
                                                ));
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                      
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text("User Deleted"),
                                            ));
                                          }
                                       
                                        },
                                        child: const Text(
                                          "Delete User",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 12),
                                        )),
                                      ),



                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                Color.fromARGB(
                                                    255, 25, 48, 100),
                                              ),
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)))),
                                          onPressed: () {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              updateUser(
                                                  context: context,
                                                  id: widget.user.id,
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  department:
                                                      _accountDepartment,
                                                  usertype: _accountType);

                                              nameController.clear();
                                              emailController.clear();
                                              _accountType = "Standard";
                                              _accountDepartment =
                                                  "Maintenance";

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AdminUsersPage(
                                                      title: "PEO",
                                                      username: widget.username,
                                                    ),
                                                  ));
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text("User Updated"),
                                              ));
                                            }
 
                                          },
                                          child: const Text(
                                            "Update User",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}


// Widget buildUpdateUserForm(BuildContext context, User user) =>