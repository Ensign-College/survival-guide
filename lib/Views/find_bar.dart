import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:survival_guide/constants/colors.dart';
import '../constants/supabase.dart';
import 'details_view.dart';

class FindBar extends StatefulWidget {
  final ValueChanged<String> onSearchTextChanged;
  final String title;
  final void Function() onPressed;
  const FindBar(
      {super.key,
      required this.onSearchTextChanged,
      required this.title,
      required this.onPressed});

  @override
  State<FindBar> createState() => _FindBarState();
}

class _FindBarState extends State<FindBar> {
  TextEditingController _textEditingController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.onPressed();
      } else if (_focusNode.hasFocus) {
        widget.onPressed();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
      stream: supabase.from('card_details').stream(primaryKey: ['id']),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }

        if (snapshot.hasData) {
          List<dynamic> cardData = snapshot.data as List<dynamic>;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TypeAheadField<String>(
              debounceDuration: const Duration(milliseconds: 500),
              textFieldConfiguration: TextFieldConfiguration(
                onTap: () {},
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Find in ${widget.title}',
                  hintText: 'Type your search query',
                  labelStyle: const TextStyle(color: Colors.white),
                  hintStyle: const TextStyle(color: Colors.white),
                  fillColor: cardBackgroundColor,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
              suggestionsCallback: (String query) {
                query = query.toLowerCase();
                List<String> suggestions = cardData
                    .map((data) => data['title'] as String)
                    .where((title) => title.toLowerCase().contains(query))
                    .toList();
                return suggestions;
              },
              itemBuilder: (context, String suggestion) {
                final suggestionData =
                    cardData.firstWhere((data) => data['title'] == suggestion);

                // Obtener el contenido de 'text' y limitar a 20 caracteres después del índice de búsqueda
                String searchText = _textEditingController.text.toLowerCase();
                int startIndex = suggestion.toLowerCase().indexOf(searchText);
                int endIndex = startIndex + searchText.length + 20;
                String subtitleText = suggestionData['text'] as String;
                if (endIndex < subtitleText.length) {
                  subtitleText = subtitleText.substring(startIndex, endIndex);
                } else {
                  subtitleText = subtitleText.substring(startIndex);
                }

                return ListTile(
                  title: Text(suggestion),
                  subtitle:
                      Text(subtitleText), // Mostrar la sugerencia formateada
                );
              },
              // ignore: sized_box_for_whitespace
              noItemsFoundBuilder: (context) => Container(
                height: 100,
                child: const Center(
                  child: Text(
                    'No Data',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              onSuggestionSelected: (String suggestion) async {
                final idResponse = await supabase
                    .from('card_details')
                    .select('id')
                    .eq('title', suggestion)
                    .single();

                int id = idResponse['id'] as int;

                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsViewModel(
                      detailsId: id,
                      title: suggestion,
                    ),
                  ),
                );
                widget.onSearchTextChanged(suggestion);
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
