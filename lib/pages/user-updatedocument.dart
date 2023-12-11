import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doits_internship_project/functions.dart';
import 'package:doits_internship_project/pages/loginpage.dart';
import 'package:doits_internship_project/pages/user-createdocument.dart';
import 'package:doits_internship_project/pages/user-dashboard.dart';
import 'package:doits_internship_project/pages/user-outbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class UpdateDocumentPage extends StatefulWidget {
  const UpdateDocumentPage(
      {super.key, required this.username, required this.document});

  final String username;
  final Document document;

  @override
  State<UpdateDocumentPage> createState() => _UpdateDocumentPage();
}

class _UpdateDocumentPage extends State<UpdateDocumentPage> {
  var recipient;

  String code = "A";
  String series = "";
  String largestID = "";

  String doits = "";

  DateTime selectedDate = DateTime.now();

  final subjectController = TextEditingController();
  final seriesController = TextEditingController();
  final descriptionController = TextEditingController();
  final remarksController = TextEditingController();
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('MM-dd-yyyy');
  String formatted = "";

  @override
  void initState() {
    recipient = widget.document.recipient;
    subjectController.text = widget.document.subject;
    descriptionController.text = widget.document.description;
    remarksController.text = widget.document.remarks;
    code = widget.document.code;
    seriesController.text = widget.document.series;
    super.initState();
  }

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100))
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        selectedDate = pickedDate;
        formatted = formatter.format(pickedDate);
      });
    });
  }

  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                                builder: (context) => CreateDocumentPage(
                                    title: "PEO", username: widget.username),
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

                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Logged Out"),
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
                                          builder: (context) => UserDashboard(
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
                                          builder: (context) => UserOutbox(
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
                          child: ListView(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Update Document",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 25, 48, 100),
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 20,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("To"),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                height: 30,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: Colors
                                                      .white, //background color of dropdown button
                                                  border: Border.all(
                                                      color: Colors.black38,
                                                      width: 1),
                                                ),
                                                child: StreamBuilder<
                                                    QuerySnapshot>(
                                                  stream: FirebaseFirestore
                                                      .instance
                                                      .collection('users')
                                                      .orderBy('name')
                                                      .snapshots(),
                                                  builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                    // Safety check to ensure that snapshot contains data
                                                    // without this safety check, StreamBuilder dirty state warnings will be thrown
                                                    if (!snapshot.hasData)
                                                      return Container();
                                                    // Set this value for default,
                                                    // setDefault will change if an item was selected
                                                    // First item from the List will be displayed
                                                    return DropdownButton(
                                                      isExpanded: true,
                                                      value: recipient,
                                                      items: snapshot.data?.docs
                                                          .map((value) {
                                                        return DropdownMenuItem(
                                                          value:
                                                              value.get('name'),
                                                          child: Text(
                                                              '${value.get('name')}'),
                                                        );
                                                      }).toList(),
                                                      underline: Container(),
                                                      onChanged: (value) {
                                                        debugPrint(
                                                            'selected onchange: $value');
                                                        setState(
                                                          () {
                                                            debugPrint(
                                                                'make selected: $value');
                                                            // Selected value will be stored
                                                            recipient = value
                                                                .toString();
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Subject"),
                                                SizedBox(
                                                  height: 30,
                                                  width: 300,
                                                  child: TextFormField(
                                                    controller:
                                                        subjectController,
                                                    style: const TextStyle(
                                                        fontSize: 12.0,
                                                        height: 1.0,
                                                        color: Colors.black),
                                                    decoration:
                                                        const InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            border:
                                                                OutlineInputBorder()),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Code"),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  height: 30,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors
                                                        .white, //background color of dropdown button
                                                    border: Border.all(
                                                        color: Colors.black38,
                                                        width: 1),
                                                  ),
                                                  child: DropdownButton<String>(
                                                      isExpanded: true,
                                                      items: const [
                                                        DropdownMenuItem(
                                                          value: "A",
                                                          child: Text("A"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "B",
                                                          child: Text("B"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "C",
                                                          child: Text("C"),
                                                        ),
                                                      ],
                                                      value: code,
                                                      underline: Container(),
                                                      onChanged:
                                                          (selectedAccountType) {
                                                        setState(() {
                                                          code =
                                                              selectedAccountType!;
                                                        });
                                                      })),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Series"),
                                                Container(
                                                  width: 300,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors
                                                        .white, //background color of dropdown button
                                                    border: Border.all(
                                                        color: Colors.black38,
                                                        width: 1),
                                                  ),
                                                  child: TextFormField(
                                                    controller:
                                                        seriesController,
                                                    style: const TextStyle(
                                                        fontSize: 12.0,
                                                        height: 1.0,
                                                        color: Colors.black),
                                                    decoration:
                                                        const InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            border:
                                                                OutlineInputBorder()),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 60),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Due Date"),
                                              GestureDetector(
                                                onTap: _presentDatePicker,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      border: Border.all(
                                                        width: .5,
                                                      )),
                                                  height: 30,
                                                  width: 300,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(8, 2, 8, 2),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            selectedDate != null
                                                                ? formatted
                                                                : formatter
                                                                    .format(
                                                                        now),
                                                            style: const TextStyle(
                                                                fontSize: 12.0,
                                                                height: 1.0,
                                                                color: Colors
                                                                    .black)),
                                                        const Spacer(
                                                          flex: 1,
                                                        ),
                                                        const Icon(
                                                          Icons.calendar_today,
                                                          size: 12,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Column(
                                  children: [
                                    const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Description: ")),
                                    TextFormField(
                                      controller: descriptionController,
                                      keyboardType: TextInputType.multiline,
                                      minLines:
                                          5, // Normal textInputField will be displayed
                                      maxLines: 5, //
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          height: 1.0,
                                          color: Colors.black),
                                      decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(6, 10, 6, 10),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Remarks: ")),
                                    ),
                                    TextFormField(
                                      controller: remarksController,
                                      keyboardType: TextInputType.multiline,
                                      minLines:
                                          5, // Normal textInputField will be displayed
                                      maxLines: 5, //
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          height: 1.0,
                                          color: Colors.black),
                                      decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(6, 10, 6, 10),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 20,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Files Attached",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 25, 48, 100),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                                                "Action",
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
                                                "Remarks",
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
                                                "Other Remarks",
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
                                                "Description",
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
                                    const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                                    const EdgeInsets.fromLTRB(20, 0, 20, 40),
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
                                        content: Text("Attach File Pressed"),
                                      ));
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_file,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                        Text(
                                          "Attach file",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    )),
                              ),
                              const Divider(
                                height: 12,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 40),
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
                                    onPressed: () async {
                                      series = seriesController.text;
                                      //note add code here that will take the last 2 digits of the year
                                      //to be used in doits generation
                                      doits = "23$code$series";
                                      print("DoITS: ");
                                      print(doits);

                                      print("Sender: ");
                                      print(widget.username);

                                      print("Recipient: ");
                                      print(recipient);

                                      print("Subject: ");
                                      print(subjectController.text);

                                      print("Date Sent: ");
                                      print(now.toString());

                                      print("Selected Date: ");
                                      print(selectedDate.toString());

                                      print("Description: ");
                                      print(descriptionController.text);

                                      print("Remarks: ");
                                      print(remarksController.text);

                                      print("Type: ");
                                      print("Incoming");

                                      print("Largest ID");
                                      print(largestID);

                                      updateDocument(
                                          context: context,
                                          id: widget.document.id,
                                          code: code,
                                          series: series,
                                          doits: doits,
                                          recipient: recipient,
                                          sender: widget.username,
                                          datesent: now.toString(),
                                          datedue: formatted,
                                          subject: subjectController.text,
                                          remarks: remarksController.text,
                                          description:
                                              descriptionController.text);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserDashboard(
                                                      title: "PEO",
                                                      username:
                                                          widget.username)));
                                    },
                                    child: const SizedBox(
                                      width: 48,
                                      height: 20,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.save,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          Text(
                                            "Save",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )),
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
