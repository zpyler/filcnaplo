import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/data/models/subject.dart';
import 'package:filcnaplo/ui/pages/evaluations/subjects/view.dart';
import 'package:filcnaplo/utils/colors.dart';
import 'package:filcnaplo/utils/format.dart';
import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  final Subject subject;
  final double studentAvg;
  final double classAvg;

  SubjectTile(this.subject, this.studentAvg, this.classAvg);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                capital(subject.name),
                style: TextStyle(fontSize: 18.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            classAvg != null && classAvg.round() != 0
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      border: Border.all(
                        width: 3.0,
                        color: app.theme.evalColors[(classAvg.round() - 1).clamp(0, 4)],
                      ),
                    ),
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      app.settings.language == "en"
                          ? classAvg.toStringAsFixed(2)
                          : classAvg.toStringAsFixed(2).split(".").join(","),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(45.0)),
                color: app.theme.evalColors[(studentAvg.round() - 1).clamp(0, 4)],
              ),
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(left: 8.0),
              child: Text(
                app.settings.language == "en"
                    ? studentAvg.toStringAsFixed(2)
                    : studentAvg.toStringAsFixed(2).split(".").join(","),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor(
                    app.theme.evalColors[(studentAvg.round() - 1).clamp(0, 4)],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SubjectView(subject, studentAvg, classAvg)));
      },
    );
  }
}