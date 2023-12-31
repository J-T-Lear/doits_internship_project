import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doits_internship_project/pages/admin-dashboard.dart';
import 'package:doits_internship_project/pages/user-dashboard.dart';
import 'package:doits_internship_project/pages/admin-userupdatepage.dart';
import 'package:doits_internship_project/pages/user-updatedocument.dart';
import 'package:doits_internship_project/pages/user-acknowledgedocument.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimestamp(DateTime dateTime) {
  var format = DateFormat('M-d-y');
  return format.format(dateTime);
}

class Document {
  String id;
  final String code;
  final String series;
  final String doits;
  final String recipient;
  final String sender;
  final String datesent;
  final String datedue;
  final String subject;
  final String remarks;
  final String description;
  final String status;

  Document({
    this.id = "",
    required this.code,
    required this.series,
    required this.doits,
    required this.recipient,
    required this.sender,
    required this.datesent,
    required this.datedue,
    required this.subject,
    required this.remarks,
    required this.description,
    required this.status, 
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'series': series,
        'doits': doits,
        'recipient': recipient,
        'sender': sender,
        'datesent': datesent,
        'datedue': datedue,
        'subject': subject,
        'remarks': remarks,
        'description': description,
        'status': status, 
      };

  static Document fromJson(Map<String, dynamic> json) => Document(
        id: json['id'],
        code: json['code'],
        series: json['series'],
        doits: json['doits'],
        recipient: json['recipient'],
        sender: json['sender'],
        datesent: json['datesent'],
        datedue: json['datedue'],
        subject: json['subject'],
        remarks: json['remarks'],
        description: json['description'],
        status: json['status'],
      );

  static Document mapDocSnapshot(querySnapshot) => Document(
        id: querySnapshot.value['id'],
        code: querySnapshot.value['code'],
        series: querySnapshot.value['series'],
        doits: querySnapshot.value['doits'],
        recipient: querySnapshot.value['recipient'],
        sender: querySnapshot.value['sender'],
        datesent: querySnapshot.value['datesent'],
        datedue: querySnapshot.value['datedue'],
        subject: querySnapshot.value['subject'],
        remarks: querySnapshot.value['remarks'],
        description: querySnapshot.value['description'],
        status: querySnapshot.value['status'],
      );
}

// Future<String> getLargestDocID() async {
//   String latestDocID = "";
//   final documents = FirebaseFirestore.instance
//       .collection('documents')
//       .orderBy("id", descending: true)
//       .limit(1)
//       .get()
//       .then(
//     (querySnapshot) {
//       latestDocID = querySnapshot.docs[0]["id"];   
//     },
//     onError: (e) => print("Error completing: $e"),
//   ); 
//   print(latestDocID);
//   return latestDocID;
// }




Future createDocument(
    {required BuildContext context,
    required String code, 
    required String series,
    required String doits, 
    required String recipient,
    required String sender,
    required String datesent,
    required String datedue,
    required String subject,  
    required String remarks,
    required String description, }) async {
  final docDocument = FirebaseFirestore.instance.collection('documents').doc();
 
  String status = "Pending";

  final document = Document(
    id: docDocument.id,
    code: code,
    series: series, 
    doits: doits,
    recipient: recipient,
    sender: sender,
    datesent: datesent,
    datedue: datedue,
    subject: subject,
    remarks: remarks,
    description: description,
    status: status, 
  );

  final json = document.toJson();

  await docDocument.set(json);
  return "Document successfully made";
}

Future updateDocument(
    {required BuildContext context,
    required String id,
    required String code, 
    required String series,
    required String doits, 
    required String recipient,
    required String sender,
    required String datesent,
    required String datedue,
    required String subject,  
    required String remarks,
    required String description,}) async {
  final docRef = FirebaseFirestore.instance.collection("documents").doc(id);
  docRef.update({
    "code": code,
    "series": series, 
    "doits": doits,
    "recipient": recipient,
    "sender": sender,
    "datesent": datesent,
    "datedue": datedue,
    "subject": subject,
    "remarks": remarks,
    "description": description, 
  });  
  Navigator.pop(context);
}

Future acknowledgeDocument(
    {required BuildContext context,
    required String id, }) async {
  final docRef = FirebaseFirestore.instance.collection("documents").doc(id);
  String status = "Acknowledged";
  docRef.update({
    "status": status, 
  });  
  Navigator.pop(context);
}
 

//This part is for the list of Admin Documents display
Stream<List<Document>> readDocumentsAdmin() => FirebaseFirestore.instance
    .collection('documents')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Document.fromJson(doc.data())).toList());

//This part is for the Admin Document search display
Stream<List<Document>> searchDocumentsAdmin(
        {required String searchcategory, required String searchkey}) =>
    FirebaseFirestore.instance
        .collection('documents')
        .where(searchcategory, isEqualTo: searchkey)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Document.fromJson(doc.data())).toList());

Widget buildDocumentsListViewAdmin(
        List documents, BuildContext context, String username) =>
    ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: documents.length,
        itemBuilder: ((context, index) {
          final document = documents[index];
          return Row(
            children: [
              Expanded(
                flex: 1,
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
                            width: 3,
                            color: Color.fromARGB(255, 207, 216, 220)),
                      ),
                    ),
                    child: Text(
                      document.id,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 25, 48, 100),
                      ),
                    )),
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
                            width: 3,
                            color: Color.fromARGB(255, 207, 216, 220)),
                      ),
                    ),
                    child: Text(
                      document.doits,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 25, 48, 100),
                      ),
                    )),
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
                            width: 3,
                            color: Color.fromARGB(255, 207, 216, 220)),
                      ),
                    ),
                    child: Expanded(
                      child: Text(
                        document.sender,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      ),
                    )),
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
                            width: 3,
                            color: Color.fromARGB(255, 207, 216, 220)),
                      ),
                    ),
                    child: Expanded(
                      child: Text(
                        document.recipient,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      ),
                    )),
              ),
              Expanded(
                flex: 3,
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
                            width: 3,
                            color: Color.fromARGB(255, 207, 216, 220)),
                      ),
                    ),
                    child: Expanded(
                      child: Text(
                        document.subject,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      ),
                    )),
              ),
              Expanded(
                flex: 3,
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
                            width: 3,
                            color: Color.fromARGB(255, 207, 216, 220)),
                      ),
                    ),
                    child: Expanded(
                      child: Text(
                        document.datedue,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      ),
                    )),
              ),
            ],
          );
        }));


//This part is for the list of documents where the user is the recipient
Stream<List<Document>> readDocumentsUserRecipient({required String username}) =>
    FirebaseFirestore.instance
        .collection('documents')
        .where("recipient", isEqualTo: username)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Document.fromJson(doc.data())).toList());

Stream<List<Document>> searchDocumentsUserRecipient(
        {required String username,
        required String searchcategory,
        required String searchkey}) =>
    FirebaseFirestore.instance
        .collection('documents')
        .where("recipient", isEqualTo: username)
        .where(searchcategory, isEqualTo: searchkey)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Document.fromJson(doc.data())).toList());

Widget buildDocumentsListViewDashboard(
        List documents, BuildContext context, String username) =>
    ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: documents.length,
        itemBuilder: ((context, index) {
          final document = documents[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AcknowledgeDocumentPage(
                          username: username, document: document)));
            },
            child: Row(
              children: [
                Expanded(
                  flex: 1,
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Text(
                        document.id,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      )),
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Text(
                        document.doits,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      )),
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Expanded(
                        child: Text(
                          document.sender,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 48, 100),
                          ),
                        ),
                      )),
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Expanded(
                        child: Text(
                          document.subject,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 48, 100),
                          ),
                        ),
                      )),
                ),
                Expanded(
                  flex: 3,
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Expanded(
                        child: Text(
                          document.status,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 48, 100),
                          ),
                        ),
                      )),
                ),
                Expanded(
                  flex: 3,
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Expanded(
                        child: Text(
                          document.datedue,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 48, 100),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
        }));












//This part is for the list of documents where the user is the sender
Stream<List<Document>> readDocumentsUserSender({required String username}) =>
    FirebaseFirestore.instance
        .collection('documents')
        .where("sender", isEqualTo: username)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Document.fromJson(doc.data())).toList());

Stream<List<Document>> searchDocumentsUserSender(
        {required String username,
        required String searchcategory,
        required String searchkey}) =>
    FirebaseFirestore.instance
        .collection('documents')
        .where("sender", isEqualTo: username)
        .where(searchcategory, isEqualTo: searchkey)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Document.fromJson(doc.data())).toList());




Widget buildDocumentsListViewOutBox(
        List documents, BuildContext context, String username) =>
    ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: documents.length,
        itemBuilder: ((context, index) {
          final document = documents[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateDocumentPage(
                          username: username, document: document)));
            },
            child: Row(
              children: [
                Expanded(
                  flex: 1,
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Text(
                        document.id,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      )),
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Text(
                        document.doits,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 48, 100),
                        ),
                      )),
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Expanded(
                        child: Text(
                          document.recipient,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 48, 100),
                          ),
                        ),
                      )),
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Expanded(
                        child: Text(
                          document.subject,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 48, 100),
                          ),
                        ),
                      )),
                ),
                Expanded(
                  flex: 3,
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Expanded(
                        child: Text(
                          document.status,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 48, 100),
                          ),
                        ),
                      )),
                ),
                Expanded(
                  flex: 3,
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
                              width: 3,
                              color: Color.fromARGB(255, 207, 216, 220)),
                        ),
                      ),
                      child: Expanded(
                        child: Text(
                          document.datedue,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 48, 100),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
        }));







/////////////////////////////
///////User Stuff////////////
/////////////////////////////
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

Future<bool> checkIfUserIsAdmin({required String userEmail}) async {
  bool _userIsAdmin = false;

  final QuerySnapshot result = await FirebaseFirestore.instance
      .collection('users')
      .where("usertype", isEqualTo: "Admin")
      .where("email", isEqualTo: userEmail)
      .get();

  final List<DocumentSnapshot> documents = result.docs;

  if (result.size > 0) {
    _userIsAdmin = true;
    //exists
  } else {
    _userIsAdmin = false;
    //not exists
  }

  return _userIsAdmin;
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
  final userRef = FirebaseFirestore.instance.collection("users").doc(id);
  userRef.update({
    "name": name,
    "email": email,
    "department": department,
    "usertype": usertype,
  });
  Navigator.pop(context);
}

Future deleteUser({required String userid}) async {
  final userRef = FirebaseFirestore.instance.collection("users").doc(userid);
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
