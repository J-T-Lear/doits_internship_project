import 'package:doits_internship_project/pages/user-dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CreateDocumentPage extends StatefulWidget {
  const CreateDocumentPage({super.key, required this.title, required this.username});

  final String username;
  final String title;

  @override
  State<CreateDocumentPage> createState() => _CreateDocumentPage();
}

class _CreateDocumentPage extends State<CreateDocumentPage> { 

  String _recipient = "Houshou Marine"; 
  String _code = "A";
  String _series = "3000";

  DateTime? _selectedDate;

  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('MM/dd/yyyy');
  String formatted = "";

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
        _selectedDate = pickedDate;
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
                          const MenuItemButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 25, 48, 100),
                            )),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(4, 4, 20, 10),
                              child: Text("Username",
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
                                          builder: (context) =>
                                              UserDashboard(title: "PEO", username: widget.username),
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
                            const Spacer(
                              flex: 10,
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
                                  "Create Document",
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
                                              Text("To"),
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
                                                  child: DropdownButton<
                                                          String>(
                                                      isExpanded: true,
                                                      items: const [
                                                        DropdownMenuItem(
                                                          value:
                                                              "Houshou Marine",
                                                          child: Text(
                                                              "Houshou Marine"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value:
                                                              "Sakamata Chloe",
                                                          child: Text(
                                                              "Sakamata Chloe"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "Takane Lui",
                                                          child: Text(
                                                              "Takane Lui"),
                                                        ),
                                                      ],
                                                      value: _recipient,
                                                      underline: Container(),
                                                      onChanged:
                                                          (selectedAccountType) {
                                                        setState(() {
                                                          _recipient =
                                                              selectedAccountType!;
                                                        });
                                                      })),
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Subject"),
                                                SizedBox(
                                                  height: 30,
                                                  width: 300,
                                                  child: TextField(
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        height: 1.0,
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(4),
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
                                                  child: DropdownButton<
                                                          String>(
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
                                                      value: _code,
                                                      underline: Container(),
                                                      onChanged:
                                                          (selectedAccountType) {
                                                        setState(() {
                                                          _code =
                                                              selectedAccountType!;
                                                        });
                                                      })),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                                    child: DropdownButton<String>(
                                                        isExpanded: true,
                                                        items: const [
                                                          DropdownMenuItem(
                                                            value: "1000",
                                                            child: Text("1000"),
                                                          ),
                                                          DropdownMenuItem(
                                                            value: "2000",
                                                            child: Text("2000"),
                                                          ),
                                                          DropdownMenuItem(
                                                            value: "3000",
                                                            child: Text("3000"),
                                                          ),
                                                        ],
                                                        value: _series,
                                                        underline: Container(),
                                                        onChanged:
                                                            (selectedAccountType) {
                                                          setState(() {
                                                            _series =
                                                                selectedAccountType!;
                                                          });
                                                        })),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start, 
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
                                                    padding:
                                                        const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            _selectedDate != null
                                                                ? formatted
                                                                : formatter
                                                                    .format(now),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12.0,
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
                                child: const Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Description: ")),
                                    TextField(
                                      keyboardType: TextInputType.multiline,
                                      minLines:
                                          5, // Normal textInputField will be displayed
                                      maxLines: 5, //
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          height: 1.0,
                                          color: Colors.black),
                                      decoration: InputDecoration(
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
                                      mainAxisAlignment:MainAxisAlignment.center,
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
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("Save Pressed"),
                                      ));
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
