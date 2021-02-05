import 'package:get/get_navigation/get_navigation.dart';

class MyTransalations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Fleets Downloader',
          'bottom_bar_home': 'Home',
          'bottom_bar_privacy': 'Privacy Policy',
          'bottom_bar_about': 'About',
          'download_btn': 'Download',
          'hint1_homepage': 'Type the fleets username below',
          'hint2_homepage_text_field_example': 'example: NBA',
          'dialog_msg': 'This should not be empty',
          'user_not_found': 'User not found or does not have posted fleets',
          'user_not_found_description': 'Please make sure..',
          'users_fleets_title': 'Fleets',
          'tap_to_download': 'Tap to Download',
          'snackbar_download_title': 'Fleet Downloaded!',
          'snackbar_download_message': 'Check your storage'
        },
        'es': {
          'title': 'Fleets Downloader',
          'bottom_bar_home': 'Inicio',
          'bottom_bar_privacy': 'Politicas privacidad',
          'bottom_bar_about': 'Sobre',
          'download_btn': 'Descargar',
          'hint1_homepage': 'Escribe el usuario de twitter debajo',
          'hint2_homepage_text_field_example': 'ejemplo: NBA',
          'dialog_msg': 'Favor, introducir un usuario',
          'user_not_found': 'Usuario no encontrado o no tiene Fleets',
          'user_not_found_description': 'Favor asegurarse',
          'users_fleets_title': 'Fleets',
          'tap_to_download': 'Toca para descargar',
          'snackbar_download_title': 'Fleet descargado',
          'snackbar_download_message': 'Revisa tu almacenamiento'
        },
      };
}
