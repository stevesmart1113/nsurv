import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:nsurv/pages/formmain.dart';
import 'package:json_form_generator/json_form_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController _agentCodeController;
  TextEditingController _passwordController;

  void initState() {
    super.initState();
    /***********************************
     *  Form controllers initialized ...
     ***********************************/
    _agentCodeController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    _agentCodeController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FLAppBarTitle(
          title: 'nSurv',
          subtitle: 'Agent Data Collection App',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0F4C81),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            Center(
              child: FLMarqueeLabel(
                text: 'Welcome to nSurv v1',
                style: TextStyle(
                    color: Color(0xFF0F4C81), fontSize: 16, fontFamily: 'Lato'),
                loop: false,
                velocity: 0.7,
                backgroundColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                style: TextStyle(fontFamily: 'Lato'),
                keyboardType: TextInputType.number,
                controller: _agentCodeController,
                decoration: new InputDecoration(
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    hintText: 'Enter Agent Code',
                    enabled: true,
                    hintStyle: TextStyle(fontFamily: 'Lato'),
                    filled: true,
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF0F4C81), width: 2.0)),
                    focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF0F4C81), width: 2.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 2, 20, 5),
              child: TextField(
                style: TextStyle(fontFamily: 'Lato'),
                controller: _passwordController,
                decoration: new InputDecoration(
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    hintText: 'Enter Password',
                    enabled: true,
                    hintStyle: TextStyle(fontFamily: 'Lato'),
                    filled: true,
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF0F4C81), width: 2.0)),
                    focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xFF0F4C81), width: 2.0))),
              ),
            ),
            Builder(
              builder: (context) => FlatButton(
                color: Colors.white,
                height: 50,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                onPressed: () {
                  _onLoading(context);
                },
                child: Text('SIGN IN',
                    style: TextStyle(
                        color: Color(0xFF0F4C81),
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),

            //.asset('images/back.png', height: 200, width: 200, alignment: Alignment.bottomCenter,)
          ],
        ),
      ),
    );
  }

  void _onLoading(context) {
    /**************************************
     *  Switches Route to Agent Form View .
     **************************************/
    new Future.delayed(new Duration(seconds: 1), () {
      if (_agentCodeController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        final snackBar = SnackBar(
            content: Text('Kindly make sure all fields are not empty.',
                style: TextStyle(
                  color: Colors.red[700],
                  fontFamily: 'Lato',
                )));
        Scaffold.of(context).showSnackBar(snackBar);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Login(
                      agentCode: _agentCodeController.text,
                    )));
        _agentCodeController.clear();
        _passwordController.clear();
      }
    });
  }
}
