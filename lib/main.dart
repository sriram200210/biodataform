// ignore_for_file: unnecessary_new, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
final namevalue = TextEditingController();
final phonevalue = TextEditingController();
final dobvalue = TextEditingController();
final emailvalue = TextEditingController();
final addressvalue = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter Form ';
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Center(child: Text(appTitle)),
        ),
        body: const SingleChildScrollView(reverse: true, child: MyCustomForm()),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: TextFormField(
              controller: namevalue,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter your full name',
                labelText: 'Name',
              ),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          TextFormField(
            controller: phonevalue,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter valid phone number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: dobvalue,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
            keyboardType: TextInputType.datetime,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter valid date';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailvalue,
            decoration: const InputDecoration(
                icon: Icon(Icons.email_sharp),
                hintText: ' Enter email address',
                labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter valid email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: addressvalue,
            decoration: const InputDecoration(
                icon: Icon(Icons.place),
                hintText: ' Enter address',
                labelText: 'Address'),
            keyboardType: TextInputType.streetAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter valid Address';
              }
              return null;
            },
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom)),
          Container(
            padding: const EdgeInsets.only(left: 140, top: 40.0),

            // ignore: deprecated_member_use
            child: Column(
              children: [
                new RaisedButton(
                  color: Colors.red,
                  child: const Text('Submit'),
                  onPressed: () {
                    // It returns true if the form is valid, otherwise returns false
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a Snackbar.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondRoute()));
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Form')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(90, 150, 3.0, 4.0),
          child: Center(
            child: Column(children: [
              ListTile(
                  title: Text("Name : ${namevalue.text}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              ListTile(
                  title: Text("\nPhone number : ${phonevalue.text}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              ListTile(
                  title: Text("\nDOB : ${dobvalue.text}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              ListTile(
                  title: Text("\nE-mail : ${emailvalue.text}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              ListTile(
                  title: Text("\nAddress : ${addressvalue.text}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)))
            ]),
          ),
        ),
      ),
    );
  }
}
