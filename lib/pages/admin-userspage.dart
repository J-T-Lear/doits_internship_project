import 'package:doits_internship_project/pages/admin-dashboard.dart';
import 'package:doits_internship_project/pages/admin-usercreatepage.dart';
import 'package:doits_internship_project/pages/loginpage.dart'; 
import 'package:flutter/material.dart';

class AdminUsersPage extends StatefulWidget {
  const AdminUsersPage({super.key, required this.title});

  final String title;

  @override
  State<AdminUsersPage> createState() => _AdminUsersPage();
}

class _AdminUsersPage extends State<AdminUsersPage> {
  int _dropdownValue = 5;

  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  @override
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
                          const MenuItemButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 25, 48, 100),
                            )),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(4, 4, 20, 10),
                              child: Text("System Admin",
                                  style: TextStyle(color: Colors.white)),
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
                                          builder: (context) =>
                                              const AdminDashboard(
                                                  title: "PEO"),
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
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("User List Pressed"),
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
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Users",
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                          Color.fromARGB(255, 25, 48, 100),
                                        ),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2)))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AdminCreateUserPage(
                                                    title: "PEO"),
                                          ));
                                    },
                                    child: const SizedBox(
                                      width: 64,
                                      height: 20,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_add,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          Text(
                                            "Add User",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text("Show"),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Colors
                                              .white, //background color of dropdown button
                                          border: Border.all(
                                              color: Colors.black38, width: 1),
                                        ),
                                        child: DropdownButton<int>(
                                            items: const [
                                              DropdownMenuItem(
                                                value: 5,
                                                child: Text("5"),
                                              ),
                                              DropdownMenuItem(
                                                value: 10,
                                                child: Text("10"),
                                              ),
                                              DropdownMenuItem(
                                                value: 20,
                                                child: Text("20"),
                                              ),
                                            ],
                                            value: _dropdownValue,
                                            underline: Container(),
                                            onChanged: (int? selectedValue) {
                                              if (selectedValue is int) {
                                                setState(() {
                                                  _dropdownValue =
                                                      selectedValue;
                                                });
                                              }
                                            })),
                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text("entries"),
                                    ),
                                    const Spacer(
                                      flex: 10,
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text("Search: "),
                                    ),
                                    const Expanded(
                                        flex: 3,
                                        child: SizedBox(
                                          height: 30,
                                          child: TextField(
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                height: 1.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(4),
                                                border: OutlineInputBorder()),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 10, 4, 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "ID",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 25, 48, 100),
                                                ),
                                              ),
                                              Icon(Icons.import_export),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 10, 4, 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Name",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 25, 48, 100),
                                                ),
                                              ),
                                              Icon(Icons.import_export),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 10, 4, 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Account Type",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 25, 48, 100),
                                                ),
                                              ),
                                              Icon(Icons.import_export),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 10, 4, 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Department",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 25, 48, 100),
                                                ),
                                              ),
                                              Icon(Icons.import_export),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        color: const Color.fromARGB(
                                            255, 226, 233, 236),
                                        child: const Center(
                                            child: Text(
                                                "No Data Available in Table")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 10, 4, 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "ID",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 25, 48, 100),
                                                ),
                                              ),
                                              Icon(Icons.import_export),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 10, 4, 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Name",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 25, 48, 100),
                                                ),
                                              ),
                                              Icon(Icons.import_export),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 10, 4, 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Account Type",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 25, 48, 100),
                                                ),
                                              ),
                                              Icon(Icons.import_export),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 10, 4, 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      255, 207, 216, 220)),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Department",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 25, 48, 100),
                                                ),
                                              ),
                                              Icon(Icons.import_export),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 8,
                                        child: Text(
                                            "Showing 0 to 0 of 0 entries")),
                                    const Spacer(
                                      flex: 18,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              overlayColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              shadowColor: MaterialStateProperty
                                                  .all<Color>(Colors.white),
                                              elevation: MaterialStateProperty
                                                  .all<double>(0.1),
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      side: const BorderSide(
                                                          width: 1, // thickness
                                                          color: Colors.grey // color
                                                          ),
                                                      borderRadius: BorderRadius.circular(2)))),
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text("Previous Pressed"),
                                            ));
                                          },
                                          child: const Text(
                                            "Previous",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 0, 4, 0),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        Colors.white),
                                                foregroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        Colors.white),
                                                overlayColor: MaterialStateProperty
                                                    .all<Color>(Colors.white),
                                                shadowColor: MaterialStateProperty
                                                    .all<Color>(Colors.white),
                                                elevation: MaterialStateProperty
                                                    .all<double>(0.1),
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        side: const BorderSide(
                                                            width: 1, // thickness
                                                            color: Colors.grey // color
                                                            ),
                                                        borderRadius: BorderRadius.circular(2)))),
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text("Next Pressed"),
                                              ));
                                            },
                                            child: const Text(
                                              "Next",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
