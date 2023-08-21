import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/presenter/bloc/rick_and_morty_bloc.dart';
import 'package:rick_and_morty/features/presenter/bloc/rick_and_morty_event.dart';
import 'package:rick_and_morty/features/presenter/bloc/rick_and_morty_state.dart';

class RickAndMortyPage extends StatefulWidget {
  const RickAndMortyPage({Key? key}) : super(key: key);

  @override
  _RickAndMortyPageState createState() => _RickAndMortyPageState();
}

class _RickAndMortyPageState extends State<RickAndMortyPage> {
  late final RickAndMortyBloc _rickAndMortyBloc;
  @override
  void initState() {
    _rickAndMortyBloc = RickAndMortyBloc();
    _rickAndMortyBloc.inputCharactersController
        .add(GetRickAndMortyCharacterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and morty characters'),
      ),
      body: StreamBuilder<RickAndMortyCharactersState>(
        stream: _rickAndMortyBloc.outputCharactersController,
        builder: (context, state) {
          if (state is RickAndMortyStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.data is RickAndMortyStateLoaded) {
            final characters = state.data?.characters.character ?? [];
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(characters[index].name),
                  subtitle: Text(characters[index].location.name),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.amber,
                    child: Image.network(characters[index].image),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('Erro'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          _rickAndMortyBloc.inputCharactersController
              .add(GetRickAndMortyCharacterEvent());
        },
      ),
    );
  }

  @override
  void dispose() {
    _rickAndMortyBloc.inputCharactersController.close();
    super.dispose();
  }
}
