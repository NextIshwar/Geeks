import 'package:GeeksVila/bloc/bloc.dart';
import 'package:GeeksVila/bloc/events.dart';
import 'package:GeeksVila/bloc/states.dart';
import 'package:GeeksVila/employee/model/formfield_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeePage extends StatefulWidget {
  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final _formKey = GlobalKey<FormState>();
  List<FocusNode> textFieldsNode = new List(3);
  List<TextEditingController> _controller = List<TextEditingController>(3);
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _controller[i] = new TextEditingController();
      textFieldsNode[i] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text("Employee Registration"),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          List<Widget> _layoutStack = new List();
          _layoutStack.add(
            Form(
              key: _formKey,
              child: Container(
                alignment: Alignment.center,
                height: height,
                width: width,
                child: Container(
                  height: height * 0.7,
                  width: width * 0.8,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return (index != 3)
                          ? Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    keyboardType: (index != 0)
                                        ? TextInputType.number
                                        : TextInputType.name,
                                    textInputAction: (index != 2)
                                        ? TextInputAction.next
                                        : TextInputAction.done,
                                    focusNode: textFieldsNode[index],
                                    controller: _controller[index],
                                    decoration: new InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[200])),
                                      hintText: FieldNames.fieldName[index],
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(
                                        FieldNames.icons[index],
                                        color: Colors.black,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please enter ${FieldNames.fieldName[index]}";
                                      } else if (!RegExp(
                                              FieldNames.regex[index])
                                          .hasMatch(value)) {
                                        return FieldNames.regexError[index];
                                      } else
                                        return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                )
                              ],
                            )
                          : Container(
                              height: height * 0.06,
                              width: width * 0.3,
                              child: RaisedButton(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    BlocProvider.of<EmployeeBloc>(context).add(
                                      AddEmployeeEvent(
                                          name: _controller[0].text,
                                          age: _controller[1].text,
                                          salary: _controller[2].text),
                                    );
                                  }
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                              ),
                            );
                    }),
                  ),
                ),
              ),
            ),
          );
          if (state is EmployeeLoadingState) {
            _layoutStack.add(Center(child: CircularProgressIndicator()));
          }
          if (state is EmployeeAddedState) {
            _layoutStack.add(
              AlertDialog(
                title:
                    Text("Employee has been added. Your Emp Id: ${state.id}"),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  ),
                ],
              ),
            );
          }
          return Stack(
            children: _layoutStack,
          );
        },
      ),
    );
  }
}
