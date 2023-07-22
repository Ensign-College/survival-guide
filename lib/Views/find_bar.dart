import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:survival_guide/constants/colors.dart';
import '../constants/supabase.dart';

class FindBar extends StatelessWidget {
  final ValueChanged<String> onSearchTextChanged;
  final String title;
  const FindBar(
      {super.key, required this.onSearchTextChanged, required this.title});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
      stream: supabase.from('card_details').stream(primaryKey: ['id']),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          List<dynamic> cardData = snapshot.data as List<dynamic>;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TypeAheadField<String>(
              suggestionsCallback: (String query) {
                // Filtrar las sugerencias en función del texto ingresado por el usuario
                query = query.toLowerCase();
                List<String> suggestions = cardData
                    .map((data) => data['title']
                        as String) // Obtener títulos de la lista de datos
                    .where((title) => title.toLowerCase().contains(query))
                    .toList();
                return suggestions;
              },
              itemBuilder: (context, String suggestion) {
                // Construir cada elemento de la lista de sugerencias
                return ListTile(title: Text(suggestion));
              },
              onSuggestionSelected: (String suggestion) {
                // Manejar la selección de una sugerencia
                onSearchTextChanged(suggestion);
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}



// TextField(
//             onChanged: onSearchTextChanged,
//             style: const TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               labelText: 'Find in $title',
//               hintText: 'Type your search query',
//               labelStyle: const TextStyle(color: Colors.white),
//               hintStyle: const TextStyle(color: Colors.white),
//               fillColor: cardBackgroundColor,
//               filled: true,
//               border: const OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white),
//                 borderRadius: BorderRadius.all(Radius.circular(25)),
//               ),
//               focusedBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white),
//                 borderRadius: BorderRadius.all(Radius.circular(25)),
//               ),
//               enabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white),
//                 borderRadius: BorderRadius.all(Radius.circular(25)),
//               ),
//               suffixIcon: const Icon(Icons.search, color: Colors.white),
//             ),
//           ),