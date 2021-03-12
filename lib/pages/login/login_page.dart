import 'package:domotica/theme/config.dart';
import 'package:flutter/material.dart';


// import 'package:mom_mon_pressure/screens/camera_access_screen.dart';
// import 'package:mom_mon_pressure/screens/error_screen.dart';
// import 'package:mom_mon_pressure/screens/no_connection_screen.dart';
// import 'package:mom_mon_pressure/screens/no_results_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BackgroundLogin(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Domotica G10',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: currentTheme.warningColorTheme),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset('assets/images/domotica.png'),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: 'Correo o email...',
              icon: Icons.alternate_email,
              onChanged: (value) {
                print(value);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                print("passwrod!!!!");
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "LOGIN",
              color: currentTheme.warningColorTheme,
              press: () {
                print('El login!!!');
                Navigator.pushNamed(context, 'bluetooth');
              },
            ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocialIcon(
            //       iconSrc: 'assets/logos/facebook.svg',
            //       press: () {
            //         print('FACEBOOK!!!');
            //       },
            //     ),
            //     SocialIcon(
            //       iconSrc: 'assets/logos/google-gmail.svg',
            //       press: () {
            //         print('GMAIL!!!');
            //       },
            //     ),
            //   ],
            // ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "DEMO",
              color: currentTheme.cancelColorTheme,
              press: () {
                print('El demo!!!');
                // La ruta no existe
                Navigator.pushNamed(context, 'homse');
              },
            ),
            InvitarCafe(
              login: true,
              press: () {
                print('COOFFEEE!!!');
              },
            ),
          ],
        ),
      )),
    );
  }
}


class InvitarCafe extends StatelessWidget {
  final bool login;
  final Function press;

  const InvitarCafe({
    Key key,
    this.login = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'Te gusto la Demo? ' : 'Prueba la demo, ',
          style: TextStyle(color: currentTheme.warningColorTheme),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Invitame un Cafe' : 'Click en DEMO',
            style: TextStyle(
              color: currentTheme.warningColorTheme,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      style: TextStyle(
          fontWeight: FontWeight.bold, color: currentTheme.warningColorTheme),
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Contrasenia o password...",
          hintStyle:
              TextStyle(color: currentTheme.warningColorTheme.withOpacity(0.5)),
          icon: Icon(Icons.lock, color: currentTheme.warningColorTheme),
          suffixIcon:
              Icon(Icons.visibility, color: currentTheme.warningColorTheme),
          border: InputBorder.none),
    ));
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: TextStyle(
            color: currentTheme.warningColorTheme, fontWeight: FontWeight.bold),
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: currentTheme.warningColorTheme,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: currentTheme.warningColorTheme.withOpacity(0.5)),
            border: InputBorder.none),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: currentTheme.secundaryColorTheme,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: child,
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = Colors.red,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class BackgroundLogin extends StatelessWidget {
  final Widget child;

  const BackgroundLogin({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: -size.width * 0.1,
            top: -size.width * 0.1,
            child: Container(
              height: size.width * 0.5,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: currentTheme.secundaryColorTheme),
            ),
          ),
          Positioned(
            right: -size.width * 0.20,
            bottom: -size.width * 0.20,
            child: Container(
              height: size.width * 0.5,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: currentTheme.secundaryColorTheme),
            ),
          ),
          this.child,
        ],
      ),
    );
  }
}
