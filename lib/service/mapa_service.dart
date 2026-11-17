
import 'package:url_launcher/url_launcher.dart';

class MapaService {

  static Future<bool> abrirRota(String endereco) async {

    // Monta o endereço de navegação do Google Maps.
    final uri = Uri.https(
      'www.google.com',
      '/maps/dir/',
      {
        'api': '1',
        'destination': endereco,
      },
    );

    // Solicita a abertura do aplicativo externo.
    return await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}
