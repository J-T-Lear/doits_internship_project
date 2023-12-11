import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doits_internship_project/functions.dart';
import 'package:doits_internship_project/pages/loginpage.dart';
import 'package:doits_internship_project/pages/user-createdocument.dart';
import 'package:doits_internship_project/pages/user-dashboard.dart';
import 'package:doits_internship_project/pages/user-outbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AcknowledgeDocumentPage extends StatefulWidget {
  const AcknowledgeDocumentPage(
      {super.key, required this.username, required this.document});

  final String username;
  final Document document;

  @override
  State<AcknowledgeDocumentPage> createState() => _AcknowledgeDocumentPage();
}

class _AcknowledgeDocumentPage extends State<AcknowledgeDocumentPage> {
  var recipient;

  String code = "A";
  String series = "";
  String largestID = "";

  String doits = "";

  DateTime selectedDate = DateTime.now();

  final senderController = TextEditingController();
  final doitsController = TextEditingController();
  final datedueController = TextEditingController();
  final datesentController = TextEditingController();
  final subjectController = TextEditingController();
  final seriesController = TextEditingController();
  final descriptionController = TextEditingController();
  final remarksController = TextEditingController();
  final statusController = TextEditingController();
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('MM-dd-yyyy');
  String formatted = "";

  @override
  void initState() {
    senderController.text = widget.document.sender;
    doitsController.text = widget.document.doits;
    datedueController.text = widget.document.datedue;
    datesentController.text = widget.document.datesent;
    recipient = widget.document.recipient;
    subjectController.text = widget.document.subject;
    descriptionController.text = widget.document.description;
    remarksController.text = widget.document.remarks;
    code = widget.document.code;
    seriesController.text = widget.document.series;
    statusController.text = widget.document.status;
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
                                          builder: (context) => UserOutbox(
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
                                  "Acknowledge Document",
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
                                              const Text("From"),
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
                                                child: TextFormField(
                                                  enabled: false,
                                                  controller: senderController,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(4),
                                                      border:
                                                          OutlineInputBorder()),
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
                                                    enabled: false,
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
                                              const Text("DoITS"),
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
                                                child: TextFormField(
                                                  enabled: false,
                                                  controller: doitsController,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(4),
                                                      border:
                                                          OutlineInputBorder()),
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
                                                    enabled: false,
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
                                              0, 56, 0, 60),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Due Date"),
                                              Container(
                                                width: 300,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: Colors
                                                      .white, //background color of dropdown button
                                                  border: Border.all(
                                                      color: Colors.black38,
                                                      width: 1),
                                                ),
                                                child: TextFormField(
                                                  enabled: false,
                                                  controller: datedueController,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(4),
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 0),
                                                child: Text("Date Sent"),
                                              ),
                                              Container(
                                                width: 300,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: Colors
                                                      .white, //background color of dropdown button
                                                  border: Border.all(
                                                      color: Colors.black38,
                                                      width: 1),
                                                ),
                                                child: TextFormField(
                                                  enabled: false,
                                                  controller:
                                                      datesentController,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(4),
                                                      border:
                                                          OutlineInputBorder()),
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
                                    const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Text("Status"),
                                            ),
                                            Container(
                                              width: 300,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Colors
                                                    .white, //background color of dropdown button
                                                border: Border.all(
                                                    color: Colors.black38,
                                                    width: 1),
                                              ),
                                              child: TextFormField(
                                                enabled: false,
                                                controller: statusController,
                                                style: const TextStyle(
                                                    fontSize: 12.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(4),
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 2,
                                    )
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
                                      enabled: false,
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
                                      enabled: false,
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
                                      acknowledgeDocument(
                                          context: context,
                                          id: widget.document.id);

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
                                      width: 90,
                                      height: 20,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          Text(
                                            "Acknowledge",
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
