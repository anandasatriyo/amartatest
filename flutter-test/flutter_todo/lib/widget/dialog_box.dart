import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_todo/common/text_validator_auto_capital.dart';

class DialogBox extends StatelessWidget {
  final void Function(String) onSave;

  DialogBox({
    super.key,
    required this.onSave,
  });
  final TextEditingController cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: FittedBox(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:
                    const EdgeInsets.only(top: 8, right: 4, bottom: 8, left: 4),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Add a new todo item',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    TextFormField(
                      key: const Key('TFFnote'),
                      textCapitalization: TextCapitalization.characters,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      inputFormatters: [UpperCaseTextFormatter()],
                      controller: cont,
                      style: GoogleFonts.poppins(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Type your new todo',
                        labelStyle: GoogleFonts.poppins(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperStyle: GoogleFonts.poppins(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () => onSave(cont.text),
                    child: Text(
                      'Add',
                      key: const Key('btnAdd'),
                      style: GoogleFonts.poppins(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
