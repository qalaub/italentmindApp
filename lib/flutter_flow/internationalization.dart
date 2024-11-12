import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomeSearch
  {
    'fjog2ymk': {
      'en': 'Search',
      'es': 'Buscar',
    },
  },
  // User
  {
    'mcfan5zh': {
      'en': 'User',
      'es': 'Usuario',
    },
  },
  // Filtros
  {
    'pyd4pn6r': {
      'en': 'Filters',
      'es': 'Filtros',
    },
    '492p0d8k': {
      'en': 'Search Distance: ',
      'es': 'Distancia:',
    },
    'jmmkn9lf': {
      'en': 'Show Ages:',
      'es': 'Edades:',
    },
    '77ulpook': {
      'en': 'Young (18-25) years',
      'es': 'Joven (18-25) años',
    },
    '8oeao6yc': {
      'en': 'Adult (25-40) years',
      'es': 'Adulto (25-40) años',
    },
    'rdzt36xy': {
      'en': 'Senior (40-65+) years',
      'es': 'Mayor (40-65+) años',
    },
    'os94esnn': {
      'en': 'Type of service:',
      'es': 'Tipo de servicio:',
    },
    'dx3sprmo': {
      'en': 'Support Workers',
      'es': 'Trabajadores de apoyo',
    },
    'zv7t0fli': {
      'en': 'Support Coordinators',
      'es': 'Coordinadores de apoyo',
    },
    '0f4smc8a': {
      'en': 'Recovery Coaches',
      'es': 'Entrenadores de recuperación',
    },
    'gt1j3p2u': {
      'en': 'Therapeutic Supports',
      'es': 'Apoyos terapéuticos',
    },
    'fgbjo5fz': {
      'en': 'Home Maintenance ',
      'es': 'Mantenimiento del hogar',
    },
    'vjtjhw0a': {
      'en': 'Select work days:',
      'es': 'Seleccione días laborables:',
    },
    '482ig40l': {
      'en': 'Monday ',
      'es': 'Lunes',
    },
    '5v95pukd': {
      'en': 'Tuesday',
      'es': 'Martes',
    },
    '311vqeaa': {
      'en': 'Wednesday',
      'es': 'Miercoles',
    },
    'vmar720g': {
      'en': 'Thursday',
      'es': 'Jueves',
    },
    'zpamtqro': {
      'en': 'Friday ',
      'es': 'VIernes',
    },
    '4nl5fopb': {
      'en': 'Saturday',
      'es': 'Sabado',
    },
    'xyp9ipwq': {
      'en': 'Sunday',
      'es': 'Domingo',
    },
    'r3ptqzb9': {
      'en': 'Clear filters',
      'es': 'Limpiar filtros',
    },
    'so72tztn': {
      'en': 'Search',
      'es': 'Buscar',
    },
    'oe85i7gs': {
      'en': 'Favorites',
      'es': 'Favoritos',
    },
  },
  // Favorites1
  {
    'pyke1r87': {
      'en': 'Favorites',
      'es': 'Favoritos',
    },
    'i1eolnw4': {
      'en': 'Favorites',
      'es': 'Favoritos',
    },
  },
  // RegisterUser1
  {
    '2iqhtl98': {
      'en': 'Create Account',
      'es': 'Crear Cuenta',
    },
    'm647jg73': {
      'en': '* First name',
      'es': '* Nombre',
    },
    'wtdsy0s8': {
      'en': '* Last name',
      'es': '* Apellido',
    },
    'ir0by4gc': {
      'en': '* Date of birth',
      'es': '* Fecha de nacimiento',
    },
    'ecjf911m': {
      'en': 'DD/MM/YYYY',
      'es': 'DD/MM/AAAA',
    },
    'f9r6x7ek': {
      'en': ' ',
      'es': '',
    },
    'trgoibj2': {
      'en': '* Email address',
      'es': '* Dirección de correo',
    },
    'a5fwk8t2': {
      'en': 'This email already has an account, use another email',
      'es': 'Este correo ya existe, usa un correo diferente',
    },
    '6374m3tb': {
      'en': '  * Confirm email address',
      'es': '* Confirmar dirección de correo ',
    },
    '6jzg633h': {
      'en': 'Email has to be the same',
      'es': 'El correo debe ser el mismo',
    },
    'y4chlyob': {
      'en': '* Enter your phone number          ',
      'es': '* Ingrese su numero de teléfono',
    },
    '398i591j': {
      'en': 'Example (XXX) XXX-XXXX',
      'es': 'Ejemplo (XXX) XXX-XXXX',
    },
    'p7bqj01f': {
      'en': '* Select your suburb',
      'es': '* Seleccione su ubicación',
    },
    'iayxow22': {
      'en': 'Select your suburb',
      'es': 'Seleccione su ubicación',
    },
    'srwzpw4c': {
      'en': 'Invalid suburb',
      'es': 'Ubicación invalida',
    },
    'af33qbcp': {
      'en': ' ',
      'es': '',
    },
    'bmrgrcxv': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'odyckplf': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'o6oxssdc': {
      'en': 'Please enter a valid name. Special characters are not allowed.',
      'es':
          'Por favor, ingrese un nombre válido. No se permiten caracteres especiales.',
    },
    '08dd6dic': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    't0x8upzg': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'vxs56bma': {
      'en': 'Please enter a valid name. Special characters are not allowed.',
      'es':
          'Por favor, ingrese un nombre válido. No se permiten caracteres especiales.',
    },
    'krq0rpao': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'xg1vg1fk': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'aj42z9e3': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '33ukxv9t': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '3zqno7cv': {
      'en': 'Please enter a valid e-mail addres',
      'es': 'Por favor ingresa un email valido',
    },
    'n8p91h2y': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'bv81mrlb': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '1u5g403u': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '9fbw1som': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'g5929gef': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '2c7yj7bz': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'fbivjllr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'yk1yjjta': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // RegisterUser2
  {
    '72td12is': {
      'en': 'Create Account',
      'es': 'Crear Cuenta',
    },
    'vauixge8': {
      'en': 'NDIS participant number',
      'es': 'número NDIS ',
    },
    'df977wen': {
      'en': 'Enter your NDIS  (XXXXXXXXX)',
      'es': 'Ingresa tu NDIS  (XXXXXXXXX)',
    },
    'stcd2q6r': {
      'en': '* Type of disability',
      'es': '* Tipo de discapacidad',
    },
    'ezzeaa18': {
      'en': 'Autism',
      'es': 'Autismo',
    },
    'yj71a9tb': {
      'en': 'Behavioural\nEarly Intervention',
      'es': 'Intervención\ntemprana conductual',
    },
    'beyrba68': {
      'en': 'Chronic Medical Conditions',
      'es': 'Condiciones médicas crónicas',
    },
    'at8pks6o': {
      'en': 'Hearing Loss',
      'es': 'Pérdida de audición',
    },
    'djcup6o5': {
      'en': 'Intellectual/Development',
      'es': 'Intelectual/Desarrollo',
    },
    'omaxu7zb': {
      'en': 'Neurological ',
      'es': 'Neurológico',
    },
    'brcjky0b': {
      'en': 'Physical ',
      'es': 'Físico',
    },
    'v5qqg86z': {
      'en': 'Psychosocial/Mental Health',
      'es': 'Salud psicosocial/mental',
    },
    'i72380gs': {
      'en': 'Vision Impairment ',
      'es': 'Deterioro de la visión',
    },
    'n4k1lf5s': {
      'en': 'Type of disability',
      'es': 'Tipo de discapacidad',
    },
    'jcjvpbo3': {
      'en': 'Search for an item...',
      'es': 'Buscar un campo',
    },
    'ir059jk3': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'tvq02gxq': {
      'en': ' ',
      'es': '',
    },
    'doorbb0o': {
      'en': '* Password',
      'es': '* Contraseña',
    },
    '89nps03s': {
      'en': 'Example:  Carlos123@',
      'es': 'Ejemplo: Carlos123@',
    },
    '7snfssac': {
      'en': ' ',
      'es': '',
    },
    'mvgiizta': {
      'en': '* Password has to be the same',
      'es': '* La contraseña debe ser la misma',
    },
    'sx0dmy8s': {
      'en': 'Example:  Carlos123@',
      'es': 'Ejemplo: Carlos123@',
    },
    'brz6x6xt': {
      'en': ' ',
      'es': '',
    },
    'aewjt8q7': {
      'en': 'I agree to the ITalentMind app\'s privacy policy',
      'es': 'Acepto la política de privacidad de la aplicación ITalentMind',
    },
    'ca50z2vh': {
      'en': 'Please accept T&Cs to create your account',
      'es': 'Acepte los términos y condiciones para crear su cuenta',
    },
    'rc64jtxn': {
      'en': 'Create',
      'es': 'Crear',
    },
    'wheoub19': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'b80jemfy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'g73ivk02': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'bzmj0s5v': {
      'en': 'Please enter a valid e-mail addres',
      'es': 'Por favor, introduzca una dirección de correo electrónico válida',
    },
    'xp5nw5ty': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'hr2hbnyb': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '0qham2a8': {
      'en': 'Password: 8+ charts, e.g., Abc123!@',
      'es': 'Contraseña: 8+ carácteres, p. ej., Abc123!@',
    },
    'z9d8bw3u': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'opxsmquw': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'd65ouj4g': {
      'en': 'Password: 8+ charts, e.g., Abc123!@',
      'es': 'Contraseña: 8+ carácteres, p. ej., Abc123!@',
    },
    'vr5an8j5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '4estglol': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // RegisterProfessional1
  {
    'rbzf15sf': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    '23pkwjvi': {
      'en': '* First name',
      'es': '* Nombre',
    },
    'r5rbz3er': {
      'en': '* Last name',
      'es': '* Apellido',
    },
    'gaure8n3': {
      'en': '* Company name',
      'es': '* Nombre de empresa',
    },
    '79b773na': {
      'en': '* Email address',
      'es': '* Dirección de correo electrónico',
    },
    'dmo4wwc3': {
      'en': 'This email already has an account, use another email',
      'es': 'Este correo ya tiene una cuenta, utilice otro correo',
    },
    'aezsi4ns': {
      'en': '  * Confirm email address',
      'es': '* Confirmar el correo',
    },
    '9kefs5ox': {
      'en': 'Email has to be the same',
      'es': 'El correo electrónico debe ser el mismo',
    },
    'wvofvg0o': {
      'en': '* Enter your phone number          ',
      'es': '* Ingrese su numero de teléfono',
    },
    '8g2x0r5t': {
      'en': 'Example (XXX) XXX-XXXX',
      'es': 'Ejemplo (XXX) XXX-XXXX',
    },
    'c98kzcju': {
      'en': '* Select your suburb',
      'es': '* Seleccione su ubicación',
    },
    'bhn2qp92': {
      'en': 'Select your suburb',
      'es': 'Seleccione su ubicación',
    },
    'awbkrqr6': {
      'en': 'Invalid suburb',
      'es': 'Suburbio no válido',
    },
    '4wfsk31l': {
      'en': ' ',
      'es': '',
    },
    'oj3gamhx': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'x4wbpr34': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '8818zy37': {
      'en': 'Please enter a valid name. Special characters are not allowed.',
      'es': 'Please enter a valid name. Special characters are not allowed.',
    },
    'vptd1g0e': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'gr573sh4': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '44sdtdk3': {
      'en': 'Please enter a valid name. Special characters are not allowed.',
      'es':
          'Por favor, ingrese un nombre válido. No se permiten caracteres especiales.',
    },
    'nkw7v2an': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'bxhkdo6j': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '0f63n5nz': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'o8ytua4k': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '1op1850p': {
      'en': 'Please enter a valid e-mail addres',
      'es': 'Por favor, introduzca una dirección de correo electrónico válida',
    },
    '2168kt8r': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'l3iouyyg': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'h3jttvxx': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '437stbtz': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'larmryvu': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'x8gtptod': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'vrjvcogl': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '0l13b2lg': {
      'en': 'Home',
      'es': '',
    },
  },
  // RegisterProfessional2
  {
    '4u26lcwe': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'zsslqptz': {
      'en': '* Type of service offered',
      'es': '*Tipo de servicio ofrecido',
    },
    'ua7tsib3': {
      'en': 'Support Workers',
      'es': 'Trabajadores de apoyo',
    },
    'yfcb8p6w': {
      'en': 'Support Coordinators',
      'es': 'Coordinadores de apoyo',
    },
    '6d22dt8n': {
      'en': 'Recovery Coaches',
      'es': 'Entrenadores de recuperación',
    },
    'h3ukg2kf': {
      'en': 'Therapeutic Supports',
      'es': 'Apoyos terapéuticos',
    },
    'dsynxuyb': {
      'en': 'Home Maintenance',
      'es': 'Mantenimiento del hogar',
    },
    '8d5ilpkv': {
      'en': 'Type of service offered',
      'es': 'Tipo de servicio ofrecido',
    },
    'wcvprqgy': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'jgb4phlw': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'gtb6b50m': {
      'en': ' ',
      'es': '',
    },
    'w37w5rch': {
      'en': 'NDIS registration status',
      'es': 'Estado de registro del NDIS',
    },
    '5qnsc1th': {
      'en': 'Unregistered',
      'es': 'No registrado',
    },
    '4dyh2baf': {
      'en': 'Registered',
      'es': 'Registrado',
    },
    '24muvs17': {
      'en': 'Registered or Unregistered ',
      'es': 'Registrado o no registrado',
    },
    'ieln1je7': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'ghw531k8': {
      'en': 'Enter your NDIS  (XXXXXXXXX)',
      'es': 'Ingrese su NDIS (XXXXXXXXX)',
    },
    '38zuaw29': {
      'en': '* Years of experience',
      'es': '* Años de experiencia',
    },
    'rzh89cig': {
      'en': '* Age',
      'es': '* Edad',
    },
    'acq3q1l8': {
      'en': '18-25 years',
      'es': '18-25 años',
    },
    'fqwdcxzw': {
      'en': '25-40 years',
      'es': '25-40 años',
    },
    'd8ehtmxo': {
      'en': '40-65+ years',
      'es': '40-65+ años',
    },
    '3jub7e58': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
    },
    'lf6cgfao': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'qxgseefl': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '7aownaza': {
      'en': ' ',
      'es': '',
    },
    '7p3lyjh2': {
      'en': '* Password',
      'es': '* Contraseña',
    },
    'my0rtqx3': {
      'en': 'Example:  Carlos123@',
      'es': 'Ejemplo: Carlos123@',
    },
    't1cnviqz': {
      'en': ' ',
      'es': '',
    },
    '1dwcgec4': {
      'en': '* Password has to be the same',
      'es': '* La contraseña debe ser la misma',
    },
    'equcclqq': {
      'en': 'Example:  Carlos123@',
      'es': 'Ejemplo: Carlos123@',
    },
    'qwk67x3g': {
      'en': ' ',
      'es': '',
    },
    '7mkqpzqn': {
      'en': 'I agree to the ITalentMind app\'s privacy policy',
      'es': 'Acepto la política de privacidad de la aplicación ITalentMind',
    },
    '8jeu8yll': {
      'en': 'Please accept T&Cs to create your account',
      'es': 'Acepte los términos y condiciones para crear su cuenta',
    },
    '0m6usrax': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'bdbf0z8o': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'esz6jfy4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'yf1f1z5j': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'but5z8wm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'hglxnisf': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '4mzt8tvu': {
      'en': 'Password: 8+ charts, e.g., Abc123!@',
      'es': 'Contraseña: 8+ gráficos, p. ej., Abc123!@',
    },
    'iawjo2cq': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'pny1i64n': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'nkeok52c': {
      'en': 'Password: 8+ charts, e.g., Abc123!@',
      'es': 'Contraseña: 8+ gráficos, p. ej., Abc123!@',
    },
    'w7hdplvi': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'o48feet5': {
      'en': 'Home',
      'es': '',
    },
  },
  // Login
  {
    'agbd4cwr': {
      'en': 'Log in to your ITalentMind account',
      'es': 'Inicie sesión en su cuenta de ITalentMind',
    },
    'so3hdls2': {
      'en': 'User Name',
      'es': 'Nombre de usuario',
    },
    'lkvbw8go': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'j01gol0r': {
      'en': 'Log in',
      'es': 'Iniciar sesión',
    },
    'a9d781wx': {
      'en': 'Don\'t have an account ? ',
      'es': ' ¿No tienes una cuenta ? ',
    },
    'xf8yq72c': {
      'en': ' Sign up for ITalentMind',
      'es': ' Regístrate en ITalentMind',
    },
    '33ws4vq0': {
      'en': 'Don\'t Have An Account? ',
      'es': '¿No tienes una cuenta?',
    },
    '50xau5y9': {
      'en': 'Forgot your password',
      'es': 'Olvidaste tu contraseña',
    },
    'audraq8t': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'pa1zrth2': {
      'en': 'Has to be a valid email address.',
      'es': 'Debe ser una dirección de correo electrónico válida.',
    },
    'xz5uwsry': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'j7c0duts': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '7ryyha9d': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'sh1qgeet': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Escoger_Usuario
  {
    'bxuhytvi': {
      'en': 'What type of account would you like to register?',
      'es': '¿Qué tipo de cuenta te gustaría registrar?',
    },
    'sphvnamy': {
      'en': 'Participant account ',
      'es': 'Cuenta de participante',
    },
    'ssuika2j': {
      'en': 'Professional account ',
      'es': 'Cuenta profesional',
    },
    'uszpwx9b': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // userprofile
  {
    'ajizgdzt': {
      'en': 'Sign out',
      'es': 'Cerrar sesión',
    },
    'h7t6rb17': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // chat_2_Details
  {
    '7mdla21g': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // chat_2_main
  {
    'fptdjbnb': {
      'en': 'Messages',
      'es': 'Mensajes',
    },
    'w7icb90c': {
      'en': 'Group Chat',
      'es': 'Chat grupal',
    },
    'xu3vf04w': {
      'en': 'No Chats',
      'es': 'Sin chats',
    },
    '226s2ivn': {
      'en': 'You don\'t have any chats created. ',
      'es': 'No tiene ningún chat creado.',
    },
    '7l6rrcdd': {
      'en': 'Participants',
      'es': 'Participantes',
    },
    '211duocj': {
      'en': 'This message is for  ',
      'es': 'Este mensaje es para',
    },
    'c0s5q421': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'es':
          'Esto fue realmente genial, estoy muy contento de que pudiéramos ponernos al día este fin de semana.',
    },
    'fiql1wgj': {
      'en': 'No Chats',
      'es': 'Sin chats',
    },
    'foup1hq1': {
      'en': 'You don\'t have any chats created. ',
      'es': 'No tiene ningún chat creado.',
    },
    'iurbbxt7': {
      'en': 'Employees',
      'es': 'Empleados',
    },
    '9jk05fne': {
      'en': 'No Chats',
      'es': 'Sin chats',
    },
    'kg6fjnhd': {
      'en': 'You don\'t have any chats created. ',
      'es': 'No tiene ningún chat creado.',
    },
    'i4r2sseo': {
      'en': 'Messages',
      'es': 'Mensajes',
    },
    'fhhb760d': {
      'en': '__',
      'es': '__',
    },
  },
  // image_Details
  {
    '1pi5hda5': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Profilesettings
  {
    '7zo6r85o': {
      'en': 'My Profile',
      'es': 'Mi perfil',
    },
    '4m3i4bja': {
      'en': 'Profile Picture',
      'es': 'Foto de perfil',
    },
    'm72rvraz': {
      'en': 'Highly recommended',
      'es': 'Muy recomendable',
    },
    'f2n00629': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'kf121bjs': {
      'en':
          'You can modify your username with the one you feel  most comfortable with.',
      'es':
          'Podrá modificar su nombre de usuario con el que se sienta más cómodo',
    },
    'tr3z56l2': {
      'en': 'Name-user',
      'es': 'Nombre de usuario',
    },
    '8vbzfam0': {
      'en': 'name',
      'es': 'nombre',
    },
    'oduyu3he': {
      'en': 'Type of service offered',
      'es': 'Tipo de servicio ofrecido',
    },
    '6fxbv6rp': {
      'en': 'You can modify what your service is offered to participants',
      'es': 'Puede modificar el servicio que ofrecen a los participantes',
    },
    '1tw37dkq': {
      'en': 'Support Worker',
      'es': 'Trabajador de apoyo',
    },
    'q62rsvsz': {
      'en': 'Therapeutic Supports',
      'es': 'Apoyos terapéuticos',
    },
    'muuph88i': {
      'en': ' Coordinator',
      'es': 'Coordinador',
    },
    'in96dw5e': {
      'en': 'Home Maintence',
      'es': 'Mantenimiento del hogar',
    },
    '7pcim84z': {
      'en': 'Recovery Coaches',
      'es': 'Entrenadores de recuperación',
    },
    's3ie7asf': {
      'en': 'Please select...',
      'es': 'Por favor selecciona...',
    },
    'lz18vnzw': {
      'en': 'Search for an item...',
      'es': 'Buscar un servicio...',
    },
    '1s2kozve': {
      'en': 'Support Workers',
      'es': 'Trabajadores de apoyo',
    },
    '0hjjvisv': {
      'en': 'Support Coordinators',
      'es': 'Coordinadores de apoyo',
    },
    '0163gnk2': {
      'en': 'Recovery Coaches',
      'es': 'Entrenadores de recuperación',
    },
    '4ch6537f': {
      'en': 'Therapeutic Supports',
      'es': 'Apoyos terapéuticos',
    },
    'gg7l92u0': {
      'en': 'Home Maintenance',
      'es': 'Mantenimiento del hogar',
    },
    'kh83yowt': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
    },
    'tyswjwvf': {
      'en': 'Search for an item...',
      'es': 'Buscar un servicio...',
    },
    'unuu2ml5': {
      'en': 'Age',
      'es': 'Edad',
    },
    'ik5xkalg': {
      'en': 'Select your age group',
      'es': 'Por favor seleccione su grupo de edad',
    },
    'i3v7yyw1': {
      'en': '18-25 years',
      'es': '18-25 años',
    },
    'uwzmt35c': {
      'en': '25-40 years',
      'es': '25-40 años',
    },
    '3jfgqqas': {
      'en': '40-65+ years',
      'es': '40-65+ años',
    },
    'wiixdm8t': {
      'en': 'Please select...',
      'es': 'Por favor selecciona...',
    },
    'lsdq0hxm': {
      'en': 'Search for an item...',
      'es': 'Buscar un servicio...',
    },
    '6g93kbrq': {
      'en': 'Change avatar',
      'es': 'Descripción',
    },
    '8tlx9xox': {
      'en': 'Change avatar',
      'es': 'Cambiar avatar',
    },
    'is91gg3j': {
      'en': 'Description',
      'es': 'Descripción',
    },
    'tb3o0s7o': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
    'p3whjsti': {
      'en': 'Tell us more about yourself',
      'es': 'Cuéntenos más sobre usted',
    },
    'f5fml3pk': {
      'en': 'Video of you',
      'es': 'Vídeo suyo',
    },
    'hen98tgd': {
      'en':
          'In this video you can make a short presentation of yourself, it will help you meet more participants',
      'es':
          'En este video podrá hacer una pequeña presentación suya, le ayudará a conocer a más participantes.',
    },
    'lrgrdhjg': {
      'en': 'Upload video',
      'es': 'Subir video',
    },
    'm174zwpn': {
      'en': 'Save changes',
      'es': 'Guardar cambios',
    },
    '91muxfqs': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // listofcollaborators
  {
    'ne4o1aq8': {
      'en': 'List Of Collaborators',
      'es': 'Lista de colaboradores',
    },
    'j75in7au': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // ProfileInfo
  {
    'u3pklca0': {
      'en': 'Profile',
      'es': 'Perfil',
    },
    'qhoq8sm4': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // peoplewhoputyouinfavorites
  {
    'f2lthfbx': {
      'en': 'Likes',
      'es': 'Me gustas',
    },
    '4f6rimb3': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // peoplewhoputyouinfavoriteBasic
  {
    '9vqrypg5': {
      'en': 'No new likes',
      'es': 'No hay nuevos me gusta',
    },
    'fn62mw5p': {
      'en':
          'When someone likes your profile,\n a notification will appear here.\nUdgrade to standard',
      'es':
          'Cuando a alguien le guste su perfil, aparecerá una notificación aquí.\n Actualizar a estándar',
    },
    'olj1n9no': {
      'en': 'Upgrade Now',
      'es': 'Actualizar ahora',
    },
    'hubaglfd': {
      'en': 'Likes',
      'es': 'Me gusta',
    },
    'iyz2hhke': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // favV2
  {
    '2owg0jwu': {
      'en': 'Favorites',
      'es': 'Favoritos',
    },
    'mwa6u4pu': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // RegisterProfessional3
  {
    'b35dldum': {
      'en':
          'Register a new business profile\n(This option is for any provider or professional that delivers services under the NDIS umbrella, including sole traders and/or companies)',
      'es':
          'Registrar un nuevo perfil comercial\n(Esta opción es para cualquier proveedor o profesional que preste servicios bajo el paraguas del NDIS, incluidos comerciantes individuales y/o empresas)',
    },
    'a0ekxe2q': {
      'en':
          'Register a new business profile (This option is for any provider or professional offering support services, including sole traders and/or companies).',
      'es':
          'Registra un nuevo perfil de negocio\n(Esta opción es para cualquier proveedor o profesional que ofrezca servicios de apoyo, incluyendo trabajadores independientes y/o empresas).',
    },
    'm9ysesh3': {
      'en':
          'Use existing company code (This option is for employees of an existing company who wish to create their employee profile)',
      'es':
          'Utilizar código de empresa existente (Esta opción es para empleados de una empresa existente que desean crear su perfil de empleado)',
    },
    'dvamtw5i': {
      'en': 'Company name',
      'es': 'Nombre de empresa',
    },
    '84bdr1m1': {
      'en': 'Company name',
      'es': 'Nombre de empresa',
    },
    '5dna6hu9': {
      'en': 'Search for a business...',
      'es': 'Buscar una empresa...',
    },
    'cqiddhfk': {
      'en': 'Enter your guest code',
      'es': 'Introduce tu código de invitado',
    },
    '0ia1rq3n': {
      'en': 'AMFEONFEGE',
      'es': 'AMFEONFEGE',
    },
    'frayxrb4': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'mcbvpeil': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'hoic0x5c': {
      'en': 'Password: 8+ chars, e.g., Abc123!@',
      'es': 'Contraseña: 8+ caracteres, p. ej., Abc123!@',
    },
    'xwci364x': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'fqsjn96i': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // MembresiasV2
  {
    '9whfvmci': {
      'en': 'BASIC',
      'es': 'BÁSICO',
    },
    'x9p0cvux': {
      'en': '\$8.99 / monthly ',
      'es': '\$8,99/mensual',
    },
    'g64wr78s': {
      'en': '(basic membership one month)',
      'es': '(membresia basica un mes)',
    },
    '3pvi5eqw': {
      'en': 'Connect with a wide range of support service providers.',
      'es':
          'Conéctese con una amplia gama de proveedores de servicios de apoyo.',
    },
    'mzxzm446': {
      'en': 'Customise your profile, including bio, photos, and videos.',
      'es': 'Personalice su perfil, incluyendo biografía, fotos y videos.',
    },
    'y8k8cofp': {
      'en':
          'Get notified when participants like your profile. Commence service right away.',
      'es':
          'Reciba una notificación cuando a los participantes les guste su perfil.\nComience a prestar el servicio de inmediato.',
    },
    'xp8xjno7': {
      'en': 'STANDARD',
      'es': 'ESTÁNDAR',
    },
    'qortziij': {
      'en': '\$17.99 / monthly ',
      'es': '\$17,99/mensual',
    },
    'tiv69x2a': {
      'en': '(standard membership one month)',
      'es': '(membresia estandar un mes)',
    },
    'p9mfbera': {
      'en':
          'Connect with a wide range of support service providers. Send and receive messages instantly.',
      'es':
          'Conéctese con una amplia gama de proveedores de servicios de apoyo. Envíe y reciba mensajes al instante.',
    },
    'lxbjnild': {
      'en':
          'Be seen more quickly by being placed higher on the search list. Customise your profile, including bio, photos, and videos.',
      'es':
          'Hágase visible más rápidamente al aparecer en una posición más alta en la lista de búsqueda. Personalice su perfil, incluyendo biografía, fotos y videos.',
    },
    'pllpaatl': {
      'en':
          'Utilise our innovative map feature to see how many participants are in your area',
      'es':
          'Utilice nuestra innovadora función de mapas para ver cuántos participantes hay en su área.',
    },
    'm99xfm7y': {
      'en': 'PREMIUM',
      'es': 'PREMIUM',
    },
    '7wturm2y': {
      'en': '\$28.99 / monthly',
      'es': '\$28,99/mensual',
    },
    'a1205doc': {
      'en': '(Premium membership one month)',
      'es': '(membresia de primera calidad un mes)',
    },
    'nx522rqg': {
      'en':
          'List multiple staff members, including coordinators or support workers, to increase your chances of connecting with support service providers. Gain access to our map features.',
      'es':
          'Enumere a varios miembros del personal, incluidos coordinadores o trabajadores de apoyo, para aumentar sus posibilidades de conectarse con proveedores de servicios de apoyo. Obtenga acceso a nuestras funciones de mapas.',
    },
    'utda3bnw': {
      'en':
          'Be seen more quickly by being placed higher on the search list. Your employees can customise their profiles and appear as part of your organisation.',
      'es':
          'Sea visto más rápidamente al aparecer en una posición más alta en la lista de búsqueda. Sus empleados pueden personalizar sus perfiles y aparecer como parte de su organización.',
    },
    '2yd7q069': {
      'en':
          'Receive notifications when participants like one of your listed employees. Send and receive messages with support service providers about your staff members.',
      'es':
          'Recibir notificaciones cuando a los participantes les gusta alguno de sus empleados enlistados. Envíe y reciba mensajes con los proveedores de servicios de apoyo sobre los miembros de su personal.',
    },
    'xwjba9im': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'jdyg4xjl': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // RegisterBusiness1
  {
    'ngissn9q': {
      'en': 'Create Account',
      'es': 'Crear una Cuenta',
    },
    '0vh9393z': {
      'en': '*First name',
      'es': '*Nombre',
    },
    'eh8ceevs': {
      'en': '* Last name',
      'es': '* Apellido',
    },
    'b8408ni3': {
      'en': '* Company name',
      'es': '* Nombre de empresa',
    },
    '4ak6m4wj': {
      'en': '* Email address',
      'es': '* Dirección de correo electrónico',
    },
    'ivkkgckb': {
      'en': 'This email already has an account, use another email',
      'es': 'Este correo ya tiene una cuenta, utilice otro correo',
    },
    '8u8yabxe': {
      'en': '  * Confirm email address',
      'es': '* Confirmar el correo',
    },
    '7pk8fev9': {
      'en': 'Email has to be the same',
      'es': 'El correo electrónico debe ser el mismo',
    },
    'i3w1obqw': {
      'en': '* Enter your phone number          ',
      'es': '* Ingrese su numero de teléfono',
    },
    '8t59l3cg': {
      'en': 'Example (XXX) XXX-XXXX',
      'es': 'Ejemplo (XXX) XXX-XXXX',
    },
    'rcfnlny4': {
      'en': '* Select your suburb',
      'es': '* Seleccione su ubicación',
    },
    'brjs43vm': {
      'en': 'Select your suburb',
      'es': 'Seleccione su ubicación',
    },
    'luu5k7qp': {
      'en': 'Invalid suburb',
      'es': 'Ubicación invalida',
    },
    'jiwdlypt': {
      'en': ' ',
      'es': '',
    },
    'cs50djy9': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'lidokb31': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'iyq3g3ls': {
      'en': 'Please enter a valid name. Special characters are not allowed.',
      'es':
          'Por favor, ingrese un nombre válido. No se permiten caracteres especiales.',
    },
    'd2tve3as': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '8prxesl5': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '7mmnd2vm': {
      'en': 'Please enter a valid name. Special characters are not allowed.',
      'es':
          'Por favor, ingrese un nombre válido. No se permiten caracteres especiales.',
    },
    'ci7ub1k2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'ldq5p7l9': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'eg7n4vm2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'q2v9deq7': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'e0d8s6fi': {
      'en': 'Please enter a valid e-mail addres',
      'es': 'Por favor, introduzca una dirección de correo válida',
    },
    'ixo6rcuf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'q1569hrn': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'v9p36n5h': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '8v5azx26': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '1a2clxub': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'fbqka0py': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'uu9uu7o9': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'pe0s6nj9': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // RegisterBusiness2
  {
    'qh4hgpdu': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'cplsmw7i': {
      'en': '* Type of service offered',
      'es': '*Tipo de servicio ofrecido',
    },
    'dqv8ryo2': {
      'en': 'Support Workers',
      'es': 'Trabajadores de apoyo',
    },
    '21z9x2nr': {
      'en': 'Support Coordinators',
      'es': 'Coordinadores de apoyo',
    },
    '62xdux38': {
      'en': 'Recovery Coaches',
      'es': 'Entrenadores de recuperación',
    },
    'qiegagqu': {
      'en': 'Therapeutic Supports',
      'es': 'Apoyos terapéuticos',
    },
    'z0c0evfh': {
      'en': 'Home Maintenance',
      'es': 'Mantenimiento del hogar',
    },
    '9gt2m9as': {
      'en': 'Type of service offered',
      'es': 'Tipo de servicio ofrecido',
    },
    'epxix747': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'd1cwoe85': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '8ekbl80j': {
      'en': ' ',
      'es': '',
    },
    '2x0t24c9': {
      'en': 'NDIS registration status',
      'es': 'Estado de registro del NDIS',
    },
    'ja11ts6t': {
      'en': 'Unregistered',
      'es': 'No registrado',
    },
    'viv9lxz8': {
      'en': 'Registered',
      'es': 'Registrado',
    },
    'o9cgz8se': {
      'en': 'Registered or Unregistered ',
      'es': 'Registrado o no registrado',
    },
    'y1mjf821': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'nhjdgino': {
      'en': 'Enter your NDIS  (XXXXXXXXX)',
      'es': 'Ingrese su NDIS (XXXXXXXXX)',
    },
    'ggs17b9t': {
      'en': '* Age',
      'es': '* Edad',
    },
    'chbh76s7': {
      'en': '18-25 years',
      'es': '18-25 años',
    },
    'gtfujuze': {
      'en': '25-40 years',
      'es': '25-40 años',
    },
    'g4y9q1x4': {
      'en': '40-65+ years',
      'es': '40-65+ años',
    },
    'mjxr0vo2': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
    },
    'uahq4k2x': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '9s63f58d': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'fcadynsm': {
      'en': ' ',
      'es': '',
    },
    'gjd9jqse': {
      'en': '* Password',
      'es': '* Contraseña',
    },
    'del7pbli': {
      'en': 'Example:  Carlos123@',
      'es': 'Ejemplo: Carlos123@',
    },
    'rsdqyy15': {
      'en': ' ',
      'es': '',
    },
    'l4b9nuaf': {
      'en': '* Password has to be the same',
      'es': '* La contraseña debe ser la misma',
    },
    'xe66g293': {
      'en': 'Example:  Carlos123@',
      'es': 'Ejemplo: Carlos123@',
    },
    'ma39d73q': {
      'en': ' ',
      'es': '',
    },
    'wrexpraz': {
      'en': 'I agree to the ITalentMind app\'s privacy policy',
      'es': 'Acepto la política de privacidad de la aplicación ITalentMind',
    },
    'n9zeysic': {
      'en': 'Please accept T&Cs to create your account',
      'es': 'Acepte los términos y condiciones para crear su cuenta',
    },
    'bfd29psr': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'k7ev48sz': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'entlx8rz': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'o8aome6s': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'wt22ng1j': {
      'en': 'Password: 8+ charts, e.g., Abc123!@',
      'es': 'Contraseña: 8+ gráficos, p. ej., Abc123!@',
    },
    'hk19zb3o': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'rdt6nbx9': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'yk69e1rk': {
      'en': 'Password: 8+ charts, e.g., Abc123!@',
      'es': 'Contraseña: 8+ gráficos, p. ej., Abc123!@',
    },
    'mxe5tzmg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'fk3zyycj': {
      'en': 'Home',
      'es': 'HomeCampo necesario',
    },
  },
  // RegisterBusiness3
  {
    'w6wgpm6y': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'wzt3j3yi': {
      'en': '* Years of experience',
      'es': '* Años de experiencia',
    },
    'k789sfid': {
      'en': '* Gender',
      'es': '* Género',
    },
    'i1h80z0t': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'hcge08c7': {
      'en': 'Female',
      'es': 'Femenino',
    },
    'f6vrm0uk': {
      'en': 'Other',
      'es': 'Otro',
    },
    'sajjlboo': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
    },
    '0ko4fkt0': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '1r22q9vc': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'm2docu2y': {
      'en': ' ',
      'es': '',
    },
    'ou2ffnab': {
      'en':
          '*  Tell us more about yourself, include your experience within the disability sector.',
      'es':
          '* Cuéntenos más sobre usted, incluir su experiencia dentro del sector de la discapacidad.',
    },
    'gzss571j': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'lvgj7iu7': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'tfvr4fnj': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'n4ostk4r': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'g11hex4q': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'y4s57ouh': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // RegisterBusiness4
  {
    'qavqkozt': {
      'en': 'Add Photos',
      'es': 'Añadir fotos',
    },
    '8czwal2x': {
      'en':
          'Let’s complete your profile! Upload a photo where your face is clear and visible. Don\'t forget to review before submitting!',
      'es':
          '¡Complete su perfil! Suba una foto en la que se vea claramente su rostro. ¡No olvide revisarla antes de enviarla!',
    },
    'l8jkva1f': {
      'en':
          'Please upload photos to complete your profile. Make sure your face is clear and visible, don’t forget to',
      'es':
          'Sube fotos para completar tu perfil. Asegúrate de que tu rostro esté claro y visible, no olvides',
    },
    'fnclc38k': {
      'en': 'Create Profile',
      'es': 'Crear perfil',
    },
    '1b3uq9o4': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // tinderv2C1
  {
    'ege5y2c8': {
      'en': 'View Profile',
      'es': 'Ver perfil',
    },
    'gvjxcell': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // news
  {
    'gkbr94yf': {
      'en': 'Notification',
      'es': 'Notificación',
    },
    'gnqd5pjz': {
      'en': 'New ',
      'es': 'Nuevo',
    },
    'dj74n30o': {
      'en': 'Previous',
      'es': 'Anterior',
    },
    'tr48yp6t': {
      'en': '__',
      'es': '__',
    },
  },
  // BlockList
  {
    'b01rt5ya': {
      'en': 'Blocked list',
      'es': 'Lista bloqueada',
    },
    'ikqbokgw': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // STANDAR
  {
    '2tbfsa6i': {
      'en': 'Get Standard',
      'es': 'Obtener estándar',
    },
    'g2bvdrzz': {
      'en':
          'Unlock all the power of this mobile tool and enjoy a digital experience like never before!',
      'es':
          '¡Desbloquea todo el poder de esta herramienta móvil y disfruta de una experiencia digital como nunca antes!',
    },
    'hksq23z1': {
      'en': 'Annual',
      'es': 'Anual',
    },
    'xohkkpp5': {
      'en': 'Then \$117/Year',
      'es': 'Luego \$117/año',
    },
    'kfrgg2po': {
      'en': 'Best Value',
      'es': 'Mejor valor',
    },
    'hgdwe8j4': {
      'en': 'Monthly',
      'es': 'Mensual',
    },
    'ncfsx34n': {
      'en': '  \$17.99 / monthly ',
      'es': '\$17,99/mensual',
    },
    'dr3fgq6m': {
      'en': 'Do you accept the terms and conditions?',
      'es': '¿Acepta los términos y condiciones?',
    },
    'qv8m1lsy': {
      'en': 'Get started Standard',
      'es': 'Empezar Estándar',
    },
    'f5l10ux7': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Premium
  {
    'iqmdxrgl': {
      'en': 'Get Premium',
      'es': 'Obtener Premium',
    },
    'xrji1t4b': {
      'en':
          'Business profile suitable for companies. Your collaborators will be better positioned.',
      'es':
          'Perfil empresarial apto para empresas. Sus colaboradores estarán mejor posicionados.',
    },
    'xwq4lgbe': {
      'en': 'Annual',
      'es': 'Anual',
    },
    'qx8luo3f': {
      'en': 'Then \$288/Year',
      'es': 'Luego \$288/año',
    },
    '1o9p06vk': {
      'en': 'Best Value',
      'es': 'Mejor valor',
    },
    'qb7rmuds': {
      'en': 'Monthly',
      'es': 'Mensual',
    },
    's2smd1wj': {
      'en': '\$28.99 / monthly ',
      'es': '\$28,99/mensual',
    },
    '6vyxmbbp': {
      'en': 'Do you accept the terms and conditions?',
      'es': '¿Acepta los términos y condiciones?',
    },
    'pa4jxn6m': {
      'en': 'Get started Premium',
      'es': 'Empezar Premium',
    },
    '3jv9cyc7': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // BASIC
  {
    'l71211n4': {
      'en': 'Get Basic',
      'es': 'Obtener lo básico',
    },
    '4zw6k7m9': {
      'en':
          'You go out in search of caregivers. You can use the map to navigate.',
      'es':
          'Sales a buscar cuidadores. Puedes utilizar el mapa para orientarte.',
    },
    'thjizh0a': {
      'en': 'Annual',
      'es': 'Anual',
    },
    'nery97jx': {
      'en': 'Then \$108/Year',
      'es': 'Luego \$108/año',
    },
    '2s6nnlj0': {
      'en': 'Best Value',
      'es': 'Mejor valor',
    },
    'wzf83okr': {
      'en': 'Monthly',
      'es': 'Mensual',
    },
    'xuw3ixif': {
      'en': ' \$8.99 / monthly ',
      'es': '\$8,99/mensual',
    },
    'eedt21sn': {
      'en': 'Do you accept the terms and conditions?',
      'es': '¿Acepta los términos y condiciones?',
    },
    'fh29go9j': {
      'en': 'Get started Basic',
      'es': 'Comenzar Básico',
    },
    'cc7gp14y': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // MySubscriptionStandard
  {
    'f5w0ny4t': {
      'en': 'Standard Account',
      'es': 'Cuenta estándar',
    },
    'vm05tydz': {
      'en':
          'Unlock all the power of this mobile tool and enjoy digital experience like never before!',
      'es':
          '¡Desbloquee todo el poder de esta herramienta móvil y disfrute de una experiencia digital como nunca antes!',
    },
    'bt7u9yc1': {
      'en': '\$',
      'es': '\$',
    },
    'eb2jqmgq': {
      'en': '17.99 / monthly',
      'es': '17,99 / mensual',
    },
    'k1ylwzic': {
      'en': '\$9,99',
      'es': '\$9,99',
    },
    'za2sznbd': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
    },
    'y20f3ond': {
      'en': 'Remaining Days',
      'es': 'Días restantes',
    },
    'psjahp3z': {
      'en': 'Date of Expiry',
      'es': 'Fecha de caducidad',
    },
    'rpv0xugy': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    '3pyigs17': {
      'en':
          'Connect with a wide range of support service providers. Send and receive messages instantly.',
      'es':
          'Conéctese con una amplia gama de proveedores de servicios de apoyo. Envíe y reciba mensajes al instante.',
    },
    'cj648e30': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    '9a0cx31a': {
      'en':
          'Be seen quicker as you placed higher on the search list. Customise your own profile, including BIO, photos and videos',
      'es':
          'Hágase visible más rápido al ubicarse en un lugar más alto de la lista de búsqueda. Personalice su propio perfil, incluyendo BIO, fotos y videos.',
    },
    'fzlzw425': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    'mrqcxjm5': {
      'en':
          'Utilise our innovative map feature to see how many participants are around your area ',
      'es':
          'Utilice nuestra innovadora función de mapas para ver cuántos participantes hay en su zona.',
    },
    's2uk79e1': {
      'en': 'Return',
      'es': 'Devolver',
    },
    '5p6grq32': {
      'en': 'My Subscription',
      'es': 'Mi suscripción',
    },
    'eu611td4': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // MySubscriptionPremium
  {
    'eqdjf3ce': {
      'en': 'Premium Account',
      'es': 'Cuenta Premium',
    },
    'fedbmksi': {
      'en':
          'Business profile suitable for companies,\nYour collaborators will be better positioned',
      'es':
          'Perfil empresarial apto para empresas,\nSus colaboradores estarán mejor posicionados',
    },
    'vrekgyz3': {
      'en': '\$',
      'es': '\$',
    },
    'sv3tisho': {
      'en': '28.99 / monthly ',
      'es': '28,99 / mensual',
    },
    'rw9va5fs': {
      'en': '\$9,99',
      'es': '\$9,99',
    },
    '5a8pyybq': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
    },
    'votxjfy9': {
      'en': 'Remaining Days',
      'es': 'Días restantes',
    },
    'igaeawhh': {
      'en': 'Date of Expiry',
      'es': 'Fecha de caducidad',
    },
    'kwdlqso3': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    '6kjg63vd': {
      'en':
          'List multiple staff members, including coordinators or support workers, to increase your chances of connecting with support service providers. Gain access to our map features.',
      'es':
          'Enumere a varios miembros del personal, incluidos coordinadores o trabajadores de apoyo, para aumentar sus posibilidades de conectarse con proveedores de servicios de apoyo. Obtenga acceso a nuestras funciones de mapas.',
    },
    'qfqaiwo9': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    '072wajnm': {
      'en':
          'Be seen quicker as you placed higher on the search list. Your employees can customise their profiles and appear as part of your organisation. ',
      'es':
          'Sea visto más rápido al aparecer en una posición más alta en la lista de búsqueda. Sus empleados pueden personalizar sus perfiles y aparecer como parte de su organización.',
    },
    'ocao8eyl': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    'w0w3w27g': {
      'en':
          'Receive notifications when participants like one of your listed employees. Send and receive messages with support service providers about your staff members.',
      'es':
          'Recibir notificaciones cuando a los participantes les gusta alguno de sus empleados enlistados. Envíe y reciba mensajes con los proveedores de servicios de apoyo sobre los miembros de su personal.',
    },
    '2eqv0a3h': {
      'en': 'Return',
      'es': 'Devolver',
    },
    'zmnrzosm': {
      'en': 'My Subscription',
      'es': 'Mi suscripción',
    },
    '07svgdde': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // MySubscriptionBasic
  {
    'anlq3q8b': {
      'en': 'Basic Account',
      'es': 'Cuenta básica',
    },
    'ffe5nbhs': {
      'en':
          'Unlock all the power of this mobile tool and enjoy digital experience like never before!',
      'es':
          '¡Desbloquee todo el poder de esta herramienta móvil y disfrute de una experiencia digital como nunca antes!',
    },
    '063z7o2l': {
      'en': '\$',
      'es': '\$',
    },
    'v0e2zmmr': {
      'en': '8.99 / monthly',
      'es': '8,99 / mensual',
    },
    'aae1z1k4': {
      'en': '\$9,99',
      'es': '\$9,99',
    },
    'bpmmmwn7': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
    },
    'zchjxqqn': {
      'en': 'Remaining Days',
      'es': 'Días restantes',
    },
    'mp4jse3w': {
      'en': 'Date of Expiry',
      'es': 'Fecha de caducidad',
    },
    'd0lvhi3j': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    'w89wnrfh': {
      'en': 'Connect with a wide range of support service providers.',
      'es':
          'Conéctese con una amplia gama de proveedores de servicios de apoyo.',
    },
    'tayfat9i': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    'jhc8u0dt': {
      'en': 'Customise your own profile, including BIO, photos and videos',
      'es': 'Personalice su propio perfil, incluyendo BIO, fotos y videos.',
    },
    '8ggrn534': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    'fs1fjese': {
      'en':
          'Get notified when participants like your profile, commence service right away ',
      'es':
          'Reciba una notificación cuando a los participantes les guste su perfil y comience el servicio de inmediato',
    },
    'uxusz2xk': {
      'en': 'Benefits of Membership',
      'es': 'Beneficios de la membresía',
    },
    'i4jyssq3': {
      'en': 'You can attach standard and basiccaregivers as your collaborators',
      'es': 'Puede adjuntar cuidadores estándar y básicos como colaboradores.',
    },
    'wkyd83y0': {
      'en': 'Return',
      'es': 'Devolver',
    },
    'alwqsse6': {
      'en': 'My Subscription',
      'es': 'Mi suscripción',
    },
    'kvy2iny0': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // report
  {
    'nql3ibcq': {
      'en': 'Select an issue to report',
      'es': 'Seleccione un problema para informar',
    },
    '4455pzhh': {
      'en':
          'We will not notify the person who reported it,if you are in imminent danger, call the corresponding authorities.',
      'es':
          'No avisaremos a la persona que lo reportó, si estás en peligro inminente, llama a las autoridades correspondientes.',
    },
    '61ebxzx7': {
      'en': 'Harassment',
      'es': 'Acoso',
    },
    '1mj4qoe9': {
      'en': 'He pretends to be someone else',
      'es': 'Él se hace pasar por otra persona',
    },
    'u845sjct': {
      'en': 'Share inappropriate content',
      'es': 'Compartir contenido inapropiado',
    },
    'hekwh489': {
      'en': 'Language that incites hatred',
      'es': 'Lenguaje que incita al odio',
    },
    'ug2qtoco': {
      'en': 'Unauthorized sales',
      'es': 'Ventas no autorizadas',
    },
    '5868joma': {
      'en': 'Scams',
      'es': 'Estafas',
    },
    'rpqkw71g': {
      'en': 'Others',
      'es': 'Otros',
    },
    'xvbejene': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // reportSection
  {
    '6bwq77pv': {
      'en':
          'A system employee reviews \nmessages to verify if they violate\n community standards, if so the \naccount will be suspended.',
      'es':
          'Un empleado del sistema revisa \nlos mensajes para verificar si violan\nlos estándares de la comunidad.\nSi es así, la cuenta será suspendida.',
    },
    '40pxjkye': {
      'en': 'Send report',
      'es': 'Enviar reporte',
    },
    '62x1kne8': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // favV3Copy
  {
    'sgzeqrp6': {
      'en': 'Favorites',
      'es': 'Favoritos',
    },
    '9qtzt03l': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // pantainci1
  {
    'ryp1ywwv': {
      'en': 'Skip this screen next time',
      'es': 'Omitir esta pantalla la próxima vez',
    },
    'ls2neb7x': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    '0dgrq10d': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // RegisterPfofesional4
  {
    '8j7d3y3q': {
      'en': 'Add Photos',
      'es': 'Añadir fotos',
    },
    'itq41t3p': {
      'en':
          'Let’s complete your profile! Upload a photo where your face is clear and visible. Don\'t forget to review before submitting!',
      'es':
          '¡Complete su perfil! Suba una foto en la que se vea claramente su rostro. ¡No olvide revisarla antes de enviarla!',
    },
    'igyk7a5j': {
      'en':
          'Please upload photos to complete your profile. Make sure your face is clear and visible, don’t forget to',
      'es':
          'Sube fotos para completar tu perfil. Asegúrate de que tu rostro esté claro y visible, no olvides',
    },
    'b7vxqp3g': {
      'en': 'Create Profile',
      'es': 'Crear perfil',
    },
    'uq0tneg4': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // cuestionario
  {
    'odr2f45r': {
      'en': 'Find Your Membership',
      'es': 'Encuentra tu membresía',
    },
    'kmmdrzk7': {
      'en': '* Do you need instant messaging for your team?',
      'es': '* ¿Necesita mensajería instantánea para su equipo?',
    },
    'k2cu0c4n': {
      'en': 'Yes',
      'es': 'Sí',
    },
    '1nj10c7u': {
      'en': 'No',
      'es': 'No',
    },
    'za0mm7rw': {
      'en':
          '* Do you require detailed map features to locate service providers?',
      'es':
          '* ¿Necesita funciones de mapas detalladas para localizar proveedores de servicios?',
    },
    'enzi3y6i': {
      'en': 'Yes',
      'es': 'Sí',
    },
    'i1hm57a0': {
      'en': 'No',
      'es': 'No',
    },
    'as2gptpv': {
      'en':
          '* Do you need to create detailed team profiles for your organization?',
      'es':
          '* ¿Necesita crear perfiles de equipo detallados para su organización?',
    },
    'u6k7m7tl': {
      'en': 'Yes',
      'es': 'Sí',
    },
    'hek1v9lo': {
      'en': 'No',
      'es': 'No',
    },
    '2zbdcuw1': {
      'en': '* Do you require enhanced search visibility for your services?',
      'es': '* ¿Necesita una mejor visibilidad de búsqueda para sus servicios?',
    },
    'frigsuts': {
      'en': 'Yes',
      'es': 'Sí',
    },
    'rom23jvu': {
      'en': 'No',
      'es': 'No',
    },
    '11pthoc7': {
      'en': 'Recommended Plan',
      'es': 'Plan recomendado',
    },
    's4v8eh57': {
      'en': 'Based on your answers, we recommend the',
      'es': 'En función de sus respuestas, le recomendamos lo siguiente:',
    },
    'y45s3saf': {
      'en': ' Basic',
      'es': ' Básico',
    },
    'h6wvrndf': {
      'en': '  plan.',
      'es': ' plan.',
    },
    'w93n251p': {
      'en': 'Based on your answers, we recommend the Premium plan.',
      'es': 'En base a tus respuestas te recomendamos el plan Premium.',
    },
    '96e0uyxq': {
      'en': 'The Basic plan includes:',
      'es': 'El plan Basico incluye:',
    },
    'e82w1tm2': {
      'en': '• Instant messaging for your team',
      'es': '• Mensajería instantánea para su equipo',
    },
    'a2h1884j': {
      'en': '\n• Detailed map features to locate service providers',
      'es':
          '\n• Funciones de mapas detallados para localizar proveedores de servicios.',
    },
    'e1e0cjph': {
      'en': '\n• Customizable team profiles',
      'es': '\n• Perfiles de equipo personalizables',
    },
    'omp6fk3x': {
      'en': '\n• Enhanced search visibility for your services',
      'es': '\n• Visibilidad de búsqueda mejorada para sus servicios',
    },
    'hsvlye5v': {
      'en': 'Based on your answers, we recommend the Premium plan.',
      'es': 'En base a tus respuestas te recomendamos el plan Premium.',
    },
    '2wtpck8h': {
      'en': 'Recommended Plan',
      'es': 'Plan recomendado',
    },
    'qj8glsap': {
      'en': 'Based on your answers, we recommend the',
      'es': 'En base a sus respuestas le recomendamos lo siguiente:',
    },
    '5l8cbxjy': {
      'en': ' Standar',
      'es': ' Estándar',
    },
    '28mt6gpb': {
      'en': ' plan.',
      'es': ' plan.',
    },
    'd5tnh1u4': {
      'en': 'Based on your answers, we recommend the Premium plan.',
      'es': 'En base a tus respuestas te recomendamos el plan Premium.',
    },
    'az3uhu6n': {
      'en': 'The Standar plan includes:',
      'es': 'El plan Estandar incluye:',
    },
    '2b5373wv': {
      'en': '• Instant messaging for your team',
      'es': '• Mensajería instantánea para su equipo',
    },
    'jvjcheen': {
      'en': '\n• Detailed map features to locate service providers',
      'es':
          '\n• Funciones de mapas detallados para localizar proveedores de servicios.',
    },
    '9qtk8zu5': {
      'en': '\n• Customizable team profiles',
      'es': '\n• Perfiles de equipo personalizables',
    },
    '3oy4cnuc': {
      'en': '\n• Enhanced search visibility for your services',
      'es': '\n• Visibilidad de búsqueda mejorada para sus servicios',
    },
    'w8hxm7lq': {
      'en': 'Based on your answers, we recommend the Premium plan.',
      'es': 'En base a tus respuestas te recomendamos el plan Premium.',
    },
    'o1ei6x6q': {
      'en': 'Recommended Plan',
      'es': 'Plan recomendado',
    },
    '8eax5b8v': {
      'en': 'Based on your answers, we recommend the',
      'es': 'En base a sus respuestas te recomendamos lo siguiente:',
    },
    'rajr4igr': {
      'en': ' Premium',
      'es': ' De primera calidad',
    },
    '7o84rm6d': {
      'en': ' plan.',
      'es': ' plan.',
    },
    'vlef7pr3': {
      'en': 'Based on your answers, we recommend the Premium plan.',
      'es': 'En base a tus respuestas te recomendamos el plan Premium.',
    },
    'tpk3bvld': {
      'en': 'The Premium plan includes:',
      'es': 'El plan Premium incluye:',
    },
    'k109xm4v': {
      'en': '• Instant messaging for your team\n',
      'es': '• Mensajería instantánea para Su equipo',
    },
    'l4q4czd4': {
      'en': '\n• Detailed map features to locate service providers',
      'es':
          '\n• Funciones de mapas detallados para localizar proveedores de servicios.',
    },
    'fwhldbmf': {
      'en': '\n• Customizable team profiles',
      'es': '\n• Perfiles de equipo personalizables',
    },
    '2pf4y776': {
      'en': '\n• Enhanced search visibility for your services',
      'es': '\n• Visibilidad de búsqueda mejorada para sus servicios',
    },
    'p34mjfey': {
      'en': 'Based on your answers, we recommend the Premium plan.',
      'es': 'En base a tus respuestas te recomendamos el plan Premium.',
    },
    '8ha4o8or': {
      'en': 'Choose Membership',
      'es': 'Elija Membresía',
    },
    't28uvrir': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'fxy4c1ae': {
      'en': 'Please enter a valid name.',
      'es': 'Por favor, introduzca un nombre válido.',
    },
    'o5op3gnt': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'ih5jrhbl': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'bblqnwmf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '73ec3h8m': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'imol2n7y': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'iscww40i': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'wruhvfqb': {
      'en': 'Please enter a valid e-mail addres',
      'es': 'Por favor, introduzca una dirección de correo electrónico válida',
    },
    'qs3kx3ch': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '7w8qt57r': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '0lpuujtu': {
      'en': 'Invalid format. Use 0453463465',
      'es': 'Formato no válido. Utilice 0453463465',
    },
    'b0qj9fig': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    '4b85f53f': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '8tbhshcp': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'icp3etyi': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // MapAument
  {
    'hs6jej3t': {
      'en': 'Search',
      'es': 'Buscar',
    },
  },
  // recuperarcontrasea
  {
    '73uid1kf': {
      'en': 'Password Recovery',
      'es': 'Recuperación de contraseña',
    },
    'nf0tgbtp': {
      'en': 'Enter your email address',
      'es': 'Introduzca su dirección de correo electrónico',
    },
    'fc8b6td1': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'fxi4pmwo': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    '2w5v76uc': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
    'piek9dkj': {
      'en': 'Give link',
      'es': 'Dar enlace',
    },
  },
  // Deleteaccount
  {
    'p2lgxd7f': {
      'en': 'Delete account',
      'es': 'Eliminar cuenta',
    },
    'x6d6bhar': {
      'en':
          'Deleting your account will be permanent, you will lose all your information and access to the current app, keep in mind that this is an irreversible process.',
      'es':
          'Su cuenta será eliminada permanentemente, perderá toda su información y el acceso a la app actual, tenga en cuenta que este es un proceso irreversible.',
    },
    'eyhsvphq': {
      'en': '  Are you sure you want to delete your account?',
      'es': ' ¿Esta seguro de que desea eliminar su cuenta?',
    },
    'zrdqn1o7': {
      'en':
          'Deleting your account will be permanent, you will lose all your information and access to the current app, keep in mind that this is an irreversible process. Are you sure you want to delete your account?',
      'es':
          'Eliminar tu cuenta será permanente, perderás toda tu información y acceso a la aplicación actual, ten en cuenta que este es un proceso irreversible. ¿Estás seguro que deseas eliminar tu cuenta?',
    },
    'gl23liof': {
      'en': 'Yes, delete',
      'es': 'Sí, eliminar',
    },
    '6qw9g1uf': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // cadari0
  {
    '2qw6woik': {
      'en': 'Select work days',
      'es': 'Seleccione días laborables',
    },
    '9hy7meui': {
      'en': 'Monday',
      'es': 'Lunes',
    },
    'i3e714zc': {
      'en': 'Tuesday',
      'es': 'Martes',
    },
    'l5hvk66b': {
      'en': 'Wednesday',
      'es': 'Miércoles',
    },
    '1w5uvjhn': {
      'en': 'Thursday',
      'es': 'Jueves',
    },
    'ytb4vz7u': {
      'en': 'Friday',
      'es': 'Viernes',
    },
    'atcdek5p': {
      'en': 'Saturday',
      'es': 'Sábado',
    },
    'qxzdps64': {
      'en': 'Sunday',
      'es': 'Domingo',
    },
    'rcehxi7g': {
      'en': 'Monday',
      'es': 'Lunes',
    },
    'n8l6e8uy': {
      'en': 'Tuesday',
      'es': 'Martes',
    },
    'niogyk4n': {
      'en': 'Wednesday',
      'es': 'Miércoles',
    },
    '5pfbnjw8': {
      'en': 'Thursday',
      'es': 'Jueves',
    },
    '88119xh3': {
      'en': 'Friday',
      'es': 'Viernes',
    },
    'ypirayh1': {
      'en': 'Saturday',
      'es': 'Sábado',
    },
    'rvfian52': {
      'en': 'Sunday',
      'es': 'Domingo',
    },
    'rv2w3vi2': {
      'en': 'Continue',
      'es': 'Continuar',
    },
  },
  // chat_2_DetailsCopy
  {
    'qx4wvffu': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // avatars
  {
    'ethpzizz': {
      'en': 'Choose your AVATAR',
      'es': 'Elija su AVATAR',
    },
    '48nxm60o': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    'k8v60e2k': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Rejectedlist
  {
    'm4mi5bv5': {
      'en': 'Rejected list',
      'es': 'Lista de rechazados',
    },
    'j4y1hy57': {
      'en': 'Home',
      'es': 'Home',
    },
  },
  // Barradebusqueda
  {
    '2q5z3tn9': {
      'en': 'Your Location',
      'es': 'Tu ubicación',
    },
    'jnnxjhxn': {
      'en': 'Filter',
      'es': 'Filtros',
    },
  },
  // PerfilProfesionalMapa
  {
    '0q2rammg': {
      'en': 'Experience',
      'es': 'Experiencia',
    },
    'ujhvrxew': {
      'en': 'Qualified And Certified \npersonnel',
      'es': 'Personal calificado y certificado',
    },
    'x9egkggc': {
      'en': '4,5',
      'es': '4,5',
    },
    '6u9krlbv': {
      'en': '(1278)',
      'es': '(1278)',
    },
  },
  // chat_ThreadComponent
  {
    'ts7tjzm6': {
      'en': 'No Messages',
      'es': 'No hay mensajes',
    },
    'to3q3afl': {
      'en': 'You have not sent any messages in this chat yet.',
      'es': 'Aún no ha enviado ningún mensaje en este chat.',
    },
    'y9zx02b6': {
      'en': 'Start typing here...',
      'es': 'Comience a escribir aquí...',
    },
    '8nmaun8u': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'y6mmlz46': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
  },
  // listofcollaboratorsPERFIL
  {
    '9hu1nn51': {
      'en': 'Experience',
      'es': 'Experiencia',
    },
    'm9sa00wg': {
      'en': 'Qualified And Certified',
      'es': 'Calificado y certificado',
    },
  },
  // NavbarPremiun
  {
    'iwnqjn9l': {
      'en': 'Home',
      'es': 'Home',
    },
    'iyf9pw8y': {
      'en': 'Colaborators',
      'es': 'Colaboradores',
    },
    '2qrk0gy0': {
      'en': 'Message',
      'es': 'Mensajes',
    },
    '6aobns3w': {
      'en': 'News',
      'es': 'Nuevas',
    },
    '2ky1d272': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // Profesional_view
  {
    'xd0pzi1d': {
      'en': 'Migues Reyes Smit',
      'es': 'Miguel Reyes Smit',
    },
    'dwydsl0d': {
      'en': '32 years',
      'es': '32 años',
    },
    'p1ftiuqd': {
      'en':
          'I met Dylan and I understood the meaning of understanding. He is a very protective and kind person who helped me socialize more with the people around me and the conversations are comfortable.',
      'es':
          'Conocí a Dylan y entendí el significado de la comprensión. Es una persona muy protectora y amable que me ayudó a socializar más con las personas que me rodean y las conversaciones son cómodas.',
    },
    'nni9655x': {
      'en': 'telfer psychologist',
      'es': 'psicólogo telfer',
    },
    '1u04gdol': {
      'en': 'MARCH 1, 2024',
      'es': '1 DE MARZO DE 2024',
    },
  },
  // tinderv2C0
  {
    'sumldv79': {
      'en': ' years of Exp',
      'es': 'años de Exp',
    },
    'u273thdj': {
      'en': 'expe',
      'es': 'expe',
    },
  },
  // HomeVistaCuidador
  {
    '3xvbswtx': {
      'en': 'There are  ',
      'es': 'Hay  ',
    },
    'd4c9r5af': {
      'en': 'NDIS Participants \nnear your ',
      'es': 'Participantes cerca\n de usted',
    },
  },
  // DescripcionProfesional
  {
    'hf498zjb': {
      'en': 'Description',
      'es': 'Descripción',
    },
    'sg6ti0nl': {
      'en': 'Experience',
      'es': 'Experiencia',
    },
    'ncsao3xb': {
      'en': 'Qualified And Certified \nPersonnel',
      'es': 'Personal calificado y certificado',
    },
    '9x3iutr3': {
      'en': 'Official ID document.',
      'es': 'Documento de identidad oficial.',
    },
  },
  // DescripcionUser
  {
    'qi6cj2f5': {
      'en': 'Description',
      'es': 'Descripción',
    },
  },
  // optionsMessage
  {
    'ms8eabq6': {
      'en': 'Block User',
      'es': 'Bloquear usuario',
    },
    '7zfllcgm': {
      'en': 'View Profile',
      'es': 'Ver perfil',
    },
    'sk3uz8xx': {
      'en': 'Report User',
      'es': 'Reportar usuario',
    },
  },
  // newNotifcations
  {
    '815vkgde': {
      'en': ' likes your collaborator ',
      'es': ' Le gusta su colaborador ',
    },
  },
  // UserBlockOptions
  {
    'm2jml2va': {
      'en': 'Unlock user',
      'es': 'Desbloquear usuario',
    },
    '83easc4k': {
      'en': 'View Profile',
      'es': 'Ver perfil',
    },
  },
  // UserUnlockConfirm
  {
    '7gaszfgp': {
      'en': 'Unlock user',
      'es': 'Desbloquear usuario',
    },
    'nh56jdj5': {
      'en':
          'Surely you want to unblock USER, he will be able to send messages again and interact with you',
      'es':
          'Estas seguro que deseas desbloquear al USUARIO, él podrá volver a enviar mensajes e interactuar contigo',
    },
    '7sy73i0q': {
      'en': 'Unlock',
      'es': 'Descubrir',
    },
    'ro3iqdm1': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // v3fv0rites
  {
    'vgesylzd': {
      'en': 'Experience  ',
      'es': 'Experiencia ',
    },
    'tjj4xff2': {
      'en': '  years',
      'es': ' años',
    },
    'wzy3mdby': {
      'en': 'Experience',
      'es': 'Experiencia',
    },
    'q1iwx1nf': {
      'en': 'Qualified And Certified \npersonnel',
      'es': 'Personal calificado y certificado',
    },
  },
  // MenjsaDeAlerta
  {
    'gxirv60i': {
      'en':
          'Please upload photos to complete your profile. Make sure your face is clear and visible, don’t forget to',
      'es':
          'Sube fotos para completar tu perfil. Asegúrate de que tu rostro esté claro y visible, no olvides',
    },
  },
  // NavbarProfessional
  {
    'ojk01ls6': {
      'en': 'Home',
      'es': 'Home',
    },
    'g6t0s28n': {
      'en': 'Likes',
      'es': 'Me gusta',
    },
    'uizwmrzg': {
      'en': 'Message',
      'es': 'Mensajes',
    },
    '0ebx9rck': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // NavbarUser
  {
    'glu35bsm': {
      'en': 'Home',
      'es': 'Home',
    },
    'ifxvzrem': {
      'en': 'Favorite',
      'es': 'Favoritos',
    },
    'v8534d86': {
      'en': 'Message',
      'es': 'Mensajes',
    },
    '9zftbvge': {
      'en': 'Maps',
      'es': 'Mapas',
    },
    'whb1ptmq': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // MapButton
  {
    '8xqm114z': {
      'en': 'City Or Zip Code',
      'es': 'Ciudad o código postal',
    },
    'eb4rjv4r': {
      'en': 'Filter',
      'es': 'Filtros',
    },
  },
  // likesV3
  {
    '3blsmgx7': {
      'en': ':  ',
      'es': ': ',
    },
    '0rovwbhn': {
      'en': 'Therapeut',
      'es': 'Terapeuta',
    },
    'ndx7rkvf': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
    'd5fsigxw': {
      'en': ':  ',
      'es': ': ',
    },
    'oil7fmgv': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
  },
  // v3fv0ritesv3
  {
    'u87hndgk': {
      'en': 'Experience  ',
      'es': 'Experiencia ',
    },
    'f8p9xpwy': {
      'en': ' years',
      'es': ' años',
    },
    '7u1agvmc': {
      'en': 'Experience',
      'es': 'Experiencia',
    },
  },
  // chat_ThreadComponentCopy
  {
    'pyf0ka04': {
      'en': 'No Messages',
      'es': 'No hay mensajes',
    },
    'etillks0': {
      'en': 'You have not sent any messages in this chat yet.',
      'es': 'Aún no ha enviado ningún mensaje en este chat.',
    },
    'd4y1t6bx': {
      'en': 'Start typing here...',
      'es': 'Comience a escribir aquí...',
    },
    'iu5uvngo': {
      'en': 'Field is required',
      'es': 'Campo necesario',
    },
    'klwjpxi0': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor selecciona una opción',
    },
  },
  // Eliminar_mensaje
  {
    'mm8yxrkf': {
      'en': 'ACCOUNT DELETION SUCCESSFUL',
      'es': 'ELIMINACIÓN DE CUENTA EXITOSA',
    },
    'bei0ybwd': {
      'en':
          'Your account has been successfully deleted, you will no longer be able to log in with that account, and all account data has been removed.',
      'es':
          'Su cuenta ha sido eliminada exitosamente, ya no podrá iniciar sesión con esa cuenta y todos los datos de la cuenta han sido eliminados.',
    },
  },
  // Miscellaneous
  {
    '1czujlt9': {
      'en': '',
      'es': '',
    },
    '6ix0wovz': {
      'en': '',
      'es': '',
    },
    'wj6ip3w8': {
      'en': '',
      'es': '',
    },
    'r7zc1kjj': {
      'en': '',
      'es': '',
    },
    '5lqzw70i': {
      'en': '',
      'es': '',
    },
    'jpjmmdcn': {
      'en': '',
      'es': '',
    },
    'edpup1h1': {
      'en': '',
      'es': '',
    },
    '5v7yyw2v': {
      'en': '',
      'es': '',
    },
    '4ujm9cho': {
      'en': '',
      'es': '',
    },
    '98gykpb8': {
      'en': '',
      'es': '',
    },
    '5pohp55a': {
      'en': '',
      'es': '',
    },
    'bwzfqklo': {
      'en': '',
      'es': '',
    },
    'gg0kwnnf': {
      'en': '',
      'es': '',
    },
    '2lem2wgg': {
      'en': '',
      'es': '',
    },
    '1zh0whro': {
      'en': '',
      'es': '',
    },
    'sdcsjgot': {
      'en': '',
      'es': '',
    },
    '0og4gpws': {
      'en': '',
      'es': '',
    },
    't3y8jfi4': {
      'en': '',
      'es': '',
    },
    'vi5fudue': {
      'en': '',
      'es': '',
    },
    'a7qytta7': {
      'en': '',
      'es': '',
    },
    '75l37pdp': {
      'en': '',
      'es': '',
    },
    'qvcdnbor': {
      'en': '',
      'es': '',
    },
    'rt995dau': {
      'en': '',
      'es': '',
    },
    'tm2i6fdi': {
      'en': '',
      'es': '',
    },
    'p1s9wlk5': {
      'en': '',
      'es': '',
    },
    'stc8sikk': {
      'en': '',
      'es': '',
    },
    'r81f157e': {
      'en': '',
      'es': '',
    },
    '4lhqsagj': {
      'en': '',
      'es': '',
    },
    'ypi05efm': {
      'en': '',
      'es': '',
    },
    '1y9p01on': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
