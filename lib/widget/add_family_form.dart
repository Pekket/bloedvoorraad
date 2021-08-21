import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './type_chooser.dart';
import '../model/blood_type.dart';

class AddFamilyMember extends StatefulWidget {
  final Function addMember;

  const AddFamilyMember(this.addMember);

  @override
  _AddFamilyMemberState createState() => _AddFamilyMemberState();
}

class _AddFamilyMemberState extends State<AddFamilyMember> {
  String _name = "";
  BloodType? _bloodType;

  void _updateBloodType(BloodType bt) => setState(() {
        _bloodType = bt;
      });

  void _updateName(String name) => setState(() {
        _name = name;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.familyTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextField(
            autofocus: true,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.familyNameLabel,
            ),
            onChanged: _updateName,
          ),
          Container(
            height: 200,
            child: BloodTypeChooser(_bloodType, _updateBloodType),
          ),
          ElevatedButton(
            onPressed: _name.isNotEmpty && _bloodType != null
                ? () => widget.addMember(_name, _bloodType)
                : null,
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ],
      ),
    );
  }
}
