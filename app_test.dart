import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("primera prueba", () {
    // FlutterDriver driver;
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    //para login
    final campoCorreo = find.byValueKey('campoCorreo');
    final campoContra = find.byValueKey('campoContra');
    final btnIniciarSesion = find.byValueKey('botonAceptar');
    final editarButton = find.byValueKey('editar_button');
    final barra = find.byValueKey('barra');
    final opcion = find.byValueKey('opcion');
    final nombreTextField = find.byValueKey('nombre_textfield');
    final biografiaTextField = find.byValueKey('biografia_textfield');
    final confirmar_button = find.byValueKey('confirmar_button');
    final ok_button = find.byValueKey('ok_button');

    test('Iniciar sesion', () async {
      await driver.tap(campoCorreo);
      await driver.enterText("tp20007@ues.edu.sv");
      await driver.tap(campoContra);
      await driver.enterText("Minerva");
      await driver.waitFor(btnIniciarSesion);
      await driver.tap(btnIniciarSesion);

      await driver.waitFor(barra);
      await driver.tap(barra);
      await driver.waitFor(opcion);
      await driver.tap(opcion);
      await driver.waitFor(editarButton);
      await driver.tap(editarButton);

      await driver.tap(nombreTextField);
      await driver.enterText('Nuevo Nombre');
      await driver.waitFor(find.text('Nuevo Nombre'));

      await driver.tap(biografiaTextField);
      await driver.enterText('Nueva biografía');
      await driver.waitFor(find.text('Nueva biografía'));

      // Realiza una acción en un botón para simular un cambio
      final guardarCambiosButton = find.byValueKey('guardar_cambios_button');
      await driver.waitFor(guardarCambiosButton);
      await driver.tap(guardarCambiosButton);

      // Guarda los cambios en el dialogo
      await driver.waitFor(confirmar_button);
      await driver.tap(confirmar_button);
      //Confirma con ok
      await driver.waitFor(ok_button);
      await driver.tap(ok_button);

      await driver.waitFor(barra);
      await driver.tap(barra);
      await driver.waitFor(opcion);
      await driver.tap(opcion);

      // Puedes agregar más pruebas si es necesario
    });
  });
}
