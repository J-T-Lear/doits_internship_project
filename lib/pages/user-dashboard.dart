import 'package:doits_internship_project/pages/loginpage.dart';
import 'package:doits_internship_project/pages/user-createdocument.dart';
import 'package:doits_internship_project/functions.dart';
import 'package:doits_internship_project/pages/user-outbox.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key, required this.title, required this.username});

  final String username;
  final String title;

  @override
  State<UserDashboard> createState() => _UserDashboard();
}

class _UserDashboard extends State<UserDashboard> {
  String _dropdownValue = "id";

  String searchcategory = "id";
  String searchkey = "";
  String selecteduser = "";

  bool searchon = false;

  
  final searchkeycontroller = TextEditingController();
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
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CreateDocumentPage(title: "PEO", username: widget.username),
                              ));
                        },
                        child: const Icon(
                          Icons.note_add,
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
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Dashboard Pressed"),
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
                                builder: (context) =>
                                    UserOutbox(title: "PEO", username: widget.username),
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
                                          Icons.forward_to_inbox,
                                          color: Color.fromRGBO(
                                              106, 109, 150, 100),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Outbox",
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
                                  "Dashboard",
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
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("Export Pressed"),
                                      ));
                                    },
                                    child: const SizedBox(
                                      width: 48,
                                      height: 20,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.upload_file_rounded,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          Text(
                                            "Export",
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
                                    
                                    const Spacer(
                                      flex: 9,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text("Search Catergory"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Container(
                                          padding: const EdgeInsets.all(4),
                                          height: 30,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors
                                                .white, //background color of dropdown button
                                            border: Border.all(
                                                color: Colors.black38, width: 1),
                                          ),
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                              items: const [
                                                DropdownMenuItem(
                                                  value: "id",
                                                  child: Text("ID"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "doits",
                                                  child: Text("DoITS"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "sender",
                                                  child: Text("Sender"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "subject",
                                                  child: Text("Subject"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "status",
                                                  child: Text("Status"),
                                                ),
                                                DropdownMenuItem(
                                                  value: "datedue",
                                                  child: Text("Due Date"),
                                                ),
                                              ],
                                              value: _dropdownValue,
                                              underline: Container(),
                                              onChanged: (String? searchcategory) {
                                                if (searchcategory is String) {
                                                  setState(() {
                                                    _dropdownValue =
                                                        searchcategory;
                                                  });
                                                }
                                              })),
                                    ), 
                                    const Expanded(
                                      flex: 1,
                                      child: Text("Search: "),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: SizedBox(
                                          height: 30,
                                          child: TextFormField(
                                            controller: searchkeycontroller,
                                            style: const TextStyle(
                                                fontSize: 12.0,
                                                height: 1.0,
                                                color: Colors.black),
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(4),
                                                border: OutlineInputBorder()),
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: searchon
                                            ? ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _dropdownValue = "id";
                                                    searchkeycontroller.text = "";
                                                    searchon = false;
                                                  });
                                                },
                                                child: const Icon(Icons.clear))
                                            : ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    searchcategory = _dropdownValue;
                                                    searchkey = searchkeycontroller.text; 
                                                    searchon = true;
                                                  });
                                                },
                                                child:
                                                    const Icon(Icons.search)),
                                      ),
                                    ),
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
                                                "DoITS",
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
                                                "Sender",
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
                                                "Subject",
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
                                      flex: 3,
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
                                                "Status",
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
                                      flex: 3,
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
                                                "Due Date",
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
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: searchon
                                    ? StreamBuilder<List<Document>>(
                                        stream: searchDocumentsUserRecipient(username: widget.username, searchcategory: searchcategory, searchkey: searchkey),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            print(snapshot.error);
                                            return const Text(
                                                'Something went wrong');
                                          }
                                          if (snapshot.hasData) {
                                            final documents = snapshot.data!;
                                
                                            return buildDocumentsListViewDashboard(documents, context, widget.username);
                                           
                                          } else {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                        })
                                    : StreamBuilder<List<Document>>(
                                        stream: readDocumentsUserRecipient(username: widget.username),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            print(snapshot.error);
                                            return const Text(
                                                'Something went wrong');
                                          }
                                          if (snapshot.hasData) {
                                            final documents = snapshot.data!;
                                
                                            return buildDocumentsListViewDashboard(documents, context, widget.username);
                                           
                                          } else {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                        }),
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
                                        child: const Text(
                                          "ID",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 25, 48, 100),
                                          ),
                                        ),
                                      ),
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
                                        child: const Text(
                                          "DoITS",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 25, 48, 100),
                                          ),
                                        ),
                                      ),
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
                                        child: const Text(
                                          "Sender",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 25, 48, 100),
                                          ),
                                        ),
                                      ),
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
                                        child: const Text(
                                          "Subject",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 25, 48, 100),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
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
                                        child: const Text(
                                          "Status",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 25, 48, 100),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
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
                                        child: const Text(
                                          "Due Date",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 25, 48, 100),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ), 
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
