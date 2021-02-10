import 'package:flutter/material.dart';
import 'package:nsurv/requests/get.dart';
import 'package:json_form_generator/json_form_generator.dart';

class Login extends StatelessWidget {
  final String agentCode;

  Login({Key key, this.agentCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('nSurv'),
          backgroundColor: Color(0xFF0F4C81),
        ),
        body: FutureBuilder(
          future: fetchForms(this.agentCode),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var _formkey = GlobalKey<FormState>();
              return ListView(children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        snapshot.data != null
                            ? snapshot.data.clientName
                            : "empty",
                        style: TextStyle(
                            color: Color(0xFF0F4C81),
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 18))),
                SingleChildScrollView(
                  child: Form(
                    key: _formkey, // add the formkey here
                    child: Column(children: <Widget>[
                      JsonFormGenerator(
                        form: snapshot.data.fields,
                        onChanged: (dynamic value) {
                          print(value);
                        },
                      ),
                      new RaisedButton(
                          child: new Text('Send'),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              print(snapshot.data.toString());
                            }
                          })
                    ]),
                  ),
                )
              ]);
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                "${snapshot.error}",
                style: TextStyle(
                    fontFamily: 'Lato', fontSize: 16, color: Colors.red[700]),
              ));
            }

            // By default, show a loading spinner.
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Color(0xFF0F4C81),
            ));
          },
        ));
  }
}
