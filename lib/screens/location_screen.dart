import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcycle/blocs/blocs.dart';

class LocationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              BlocProvider.of<LocationBloc>(context).add(
                FetchLocation(),
              );
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationEmpty) {
              return Center(child: Text('No Location'));
            }
            if (state is LocationLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is LocationLoaded) {
              final placemarks = state.placemarks;
              return Text(placemarks[0].postalCode);
            }
            if (state is LocationError) {
              return Text(
                'Could not find your Location!',
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Text(
                'Could not find your Location!',
                style: TextStyle(color: Colors.red),
              );
            }
          },
        ),
      ),
    );
  }
}
