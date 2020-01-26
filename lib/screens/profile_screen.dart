import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcycle/blocs/authentication_bloc/bloc.dart';
import 'package:readcycle/blocs/blocs.dart';

class ProfileScreen extends StatefulWidget {
  final FirebaseUser user;

  ProfileScreen({Key key, @required this.user}) : super(key: key);

  _ProfileScreenState createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {

    final String name = widget.user.displayName;
    final String email = widget.user.email;
    final String photoURL = widget.user.photoUrl;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
              photoURL,
            ),
            radius: 50,
            backgroundColor: Colors.transparent,
          ),
          Center(child: Text('Welcome $name!')),
          Center(child: Text('$email')),
          Center(
            child: BlocBuilder<UserLocationBloc, UserLocationState>(
              builder: (context, state) {
                if (state is UserLocationError) {
                  return Center(child: Text('Error Loading User Location'));
                }
                if (state is UserLocationLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is UserLocationLoaded) {
                  final location = state.userLocation.name + ", " + state.userLocation.locality + "," + state.userLocation.postalCode + "," + state.userLocation.country;
                  return Text(location);
                }
                else {
                  return Text(
                    'Could not find your Location!',
                    style: TextStyle(color: Colors.red),
                  );
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              BlocProvider.of<UserLocationBloc>(context).add(UpdateUserLocation());
            },
          )
        ],
      ),
    );
  }
}
