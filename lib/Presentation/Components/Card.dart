import 'package:flutter/material.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/just_a_class.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late List<Proces> processData;

  @override
  void initState() {
    super.initState();
    // Initialize your data (in this case, using sample data)
    processData = _getSampleData();
  }

  List<Proces> _getSampleData() {
    // Replace this with your actual data or use a generator function
    return List.generate(
      10,
          (index) => Proces(
        proces_id: index,
        date: DateTime.now().toString(),
        // Add other properties as needed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: processData.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(26, 16, 26, 0),
          elevation: 10,
          shape: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 8)),
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 10),
            leading: Icon(Icons.calendar_month_outlined),
            title: Text(
              'FAM',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _formatDate(processData[index].date),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle onTap event
            },
          ),
        );
      },
    );
  }

  String _formatDate(String date) {
    // You can implement your own date formatting logic here
    // For simplicity, this example just returns the input date
    return date;
  }
}

// Placeholder for the Proces class
class Proces {
  final int proces_id;
  final String date;

  Proces({required this.proces_id, required this.date});
}
