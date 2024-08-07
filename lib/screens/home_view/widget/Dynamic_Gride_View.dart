import 'package:NotesApp/screens/edit_notes/Veiw/edit_notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'item_gride_view.dart';
import 'package:intl/intl.dart';

class DynamicGrideView extends StatelessWidget {
  final bool isNewFirst;

  const DynamicGrideView({
    super.key,
    required this.isNewFirst,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notes')
            .orderBy('date', descending: isNewFirst)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No notes available.'));
          }

          final items = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final timestamp = data['date'] as Timestamp?;
            final date = timestamp != null
                ? DateFormat('yyyy-MM-dd').format(timestamp.toDate())
                : 'Unknown date';
            print('Document data: $data');
            return {
              'id': doc.id,
              'title': data['title'] ?? '',
              'description': data['content'] ?? '',
              'date': date,
            };
          }).toList();

          return DynamicHeightGridView(
            shrinkWrap: true,
            itemCount: items.length,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            builder: (context, index) {
              final item = items[index];
              return ItemGridView(
                title: item['title']!,
                description: item['description']!,
                date: item['date']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditNotes(
                        noteId: item['id']!,
                        initialTitle: item['title']!,
                        initialContent: item['description']!,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
