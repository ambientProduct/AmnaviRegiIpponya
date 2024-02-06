import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ja', 'en'];

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
    String? jaText = '',
    String? enText = '',
  }) =>
      [jaText, enText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'jh8qtg9z': {
      'ja': '店舗名',
      'en': '',
    },
    '88bho03k': {
      'ja': '使用ガイド',
      'en': '',
    },
    'oknith7p': {
      'ja': '注文管理',
      'en': '',
    },
    'uyvm1lk6': {
      'ja': '進行中の注文',
      'en': '',
    },
    'f5uevr6l': {
      'ja': '1',
      'en': '',
    },
    'vh3izotd': {
      'ja': '会計管理',
      'en': '',
    },
    'bbxpsjek': {
      'ja': '利用中のテーブル',
      'en': '',
    },
    'ux1jr4re': {
      'ja': '1',
      'en': '',
    },
    '8yt5jocn': {
      'ja': '営業データ',
      'en': '',
    },
    'em175res': {
      'ja': '商品管理',
      'en': '',
    },
    'bin2tb91': {
      'ja': '120',
      'en': '',
    },
    '4jd92pol': {
      'ja': '在庫管理',
      'en': '',
    },
    'jk8tt4hf': {
      'ja': '120',
      'en': '',
    },
    'h3whiaud': {
      'ja': '営\n業\n中',
      'en': '',
    },
    'ba5ov856': {
      'ja': 'Home',
      'en': '',
    },
  },
  // salesdatatotal
  {
    'n32jswaa': {
      'ja': '売上集計',
      'en': '',
    },
    '4d52vria': {
      'ja': '商品別売上',
      'en': '',
    },
    'b5morhft': {
      'ja': 'グラフ',
      'en': '',
    },
    '5kmdelss': {
      'ja': '時間別売上',
      'en': '',
    },
    'wgjnvtws': {
      'ja': '日別売上',
      'en': '',
    },
    '54qtgmvq': {
      'ja': '月別売上',
      'en': '',
    },
    '6cewe1k8': {
      'ja': '2023-12-13',
      'en': '',
    },
    'h1yzs5do': {
      'ja': '一般注文',
      'en': '',
    },
    'q12rsbty': {
      'ja': 'テイクアウト',
      'en': '',
    },
    'qc88i8yr': {
      'ja': 'デリバリー',
      'en': '',
    },
    '92lpoxn7': {
      'ja': '売上推移',
      'en': '',
    },
    'pr4sbqks': {
      'ja': 'Home',
      'en': '',
    },
  },
  // menumanagement
  {
    '9y1bw6tb': {
      'ja': '商品カテゴリー',
      'en': '',
    },
    'f8shj6wr': {
      'ja': '商品追加',
      'en': '',
    },
    '7f4m6z7f': {
      'ja': 'モジュール追加',
      'en': '',
    },
    '627f930u': {
      'ja': '税率設定',
      'en': '',
    },
    '0gk4kutg': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'fegzg1z6': {
      'ja': 'カテゴリー',
      'en': '',
    },
    '521z9ncw': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'thq6ndk7': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'kpm95ojn': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'pgh67x67': {
      'ja': 'カテゴリー',
      'en': '',
    },
    '9c7pjvl7': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'n5yq9fow': {
      'ja': 'カテゴリー',
      'en': '',
    },
    '2juzwpnb': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'v75h3vbo': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'f6gzzui1': {
      'ja': '¥',
      'en': '',
    },
    'uw41podd': {
      'ja': '（税込）',
      'en': '',
    },
    '9tv6uh8s': {
      'ja': 'アルコール商品',
      'en': '',
    },
    'iambxrxd': {
      'ja': '食べ飲み放題商品',
      'en': '',
    },
    '0m4or0o7': {
      'ja': '店内表示',
      'en': '',
    },
    'lx6k0v17': {
      'ja': 'オンライン表示',
      'en': '',
    },
    '3ewzxce0': {
      'ja': '編集',
      'en': '',
    },
    'lm810t7g': {
      'ja': 'Home',
      'en': '',
    },
  },
  // categorymanagement
  {
    'zdlrvhgv': {
      'ja': '日本語',
      'en': '',
    },
    'gtv1l75g': {
      'ja': '英語翻訳',
      'en': '',
    },
    'wfolh3j3': {
      'ja': '中国語翻訳',
      'en': '',
    },
    'lslzm22v': {
      'ja': '韓国語翻訳',
      'en': '',
    },
    'cz8p33n7': {
      'ja': 'カテゴリー名',
      'en': '',
    },
    'd7wl43h6': {
      'ja': '編集',
      'en': '',
    },
    '7i03xzft': {
      'ja': '保存する',
      'en': '',
    },
    '7tlvtlcg': {
      'ja': 'Home',
      'en': '',
    },
  },
  // MenuSettings
  {
    'd1xuzpgn': {
      'ja': '日本語',
      'en': '',
    },
    '7pfz8wjz': {
      'ja': '英語翻訳',
      'en': '',
    },
    'hwsj336x': {
      'ja': '中国語翻訳',
      'en': '',
    },
    '5ncbg5c9': {
      'ja': '韓国語翻訳',
      'en': '',
    },
    'jmewo4xs': {
      'ja': '商品名',
      'en': '',
    },
    'y8op2xix': {
      'ja': 'Label here...',
      'en': '',
    },
    'pc9kgg75': {
      'ja': '商品名を入力してください',
      'en': '',
    },
    'lqmuxlem': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'sz4xziix': {
      'ja': '商品説明を入力してください（任意）',
      'en': '',
    },
    'ayz1ut3v': {
      'ja': '価格（￥）',
      'en': '',
    },
    'o2a1s4ie': {
      'ja': '価格を入力してください',
      'en': '',
    },
    '25y6708l': {
      'ja': '割引（￥）',
      'en': '',
    },
    'm5mczvp4': {
      'ja': 'Label here...',
      'en': '',
    },
    '3gv881rz': {
      'ja': '商品名を入力してください',
      'en': '',
    },
    'n8kbux1j': {
      'ja': '原価',
      'en': '',
    },
    'ga68ix18': {
      'ja': 'Label here...',
      'en': '',
    },
    'pzqar71m': {
      'ja': '商品名を入力してください',
      'en': '',
    },
    'vm2f0486': {
      'ja': '消費税設定',
      'en': '',
    },
    'ggp1in1g': {
      'ja': '税込',
      'en': '',
    },
    '5nlgd90n': {
      'ja': '税抜',
      'en': '',
    },
    '0nboddzi': {
      'ja': '税率',
      'en': '',
    },
    'xff0pkls': {
      'ja': '10%（標準）',
      'en': '',
    },
    '9bau269o': {
      'ja': 'メニュー表示',
      'en': '',
    },
    'gyoz8xlu': {
      'ja': '店内表示',
      'en': '',
    },
    'dni9cbr8': {
      'ja': '店内非表示',
      'en': '',
    },
    'ebztq9bn': {
      'ja': 'アルコール商品設定',
      'en': '',
    },
    'isqgmy8l': {
      'ja': 'アルコールあり',
      'en': '',
    },
    'kozfhev1': {
      'ja': 'アルコールなし',
      'en': '',
    },
    '3q6vpdmc': {
      'ja': 'オプション',
      'en': '',
    },
    '63c0l7jg': {
      'ja': '＋オプションを追加',
      'en': '',
    },
    'xv5m9oq0': {
      'ja': '画像',
      'en': '',
    },
    'l57alvno': {
      'ja': '商品説明',
      'en': '',
    },
    'akkw0ipl': {
      'ja': '商品説明を入力してください（任意）',
      'en': '',
    },
    'oc8axmum': {
      'ja': '保存する',
      'en': '',
    },
    'u6owyim6': {
      'ja': 'Home',
      'en': '',
    },
  },
  // Settings
  {
    'oq4iwbin': {
      'ja': '日本語',
      'en': '',
    },
    'qume4ntk': {
      'ja': '英語翻訳',
      'en': '',
    },
    '4igfnk72': {
      'ja': '中国語翻訳',
      'en': '',
    },
    'p3kl0ubn': {
      'ja': '韓国語翻訳',
      'en': '',
    },
    'wnid2mjq': {
      'ja': '店舗UID',
      'en': '',
    },
    'x4huz3vq': {
      'ja': 'UID:0000',
      'en': '',
    },
    '8agy3p83': {
      'ja': '登録者名',
      'en': '',
    },
    '9ielb27r': {
      'ja': '店舗名',
      'en': '',
    },
    '7okshzes': {
      'ja': 'パスワード変更',
      'en': '',
    },
    'zc7da26x': {
      'ja': '支払い方法設定',
      'en': '',
    },
    'p3jv8qtx': {
      'ja': 'パスコード',
      'en': '',
    },
    '1r1kf12g': {
      'ja': '税率設定',
      'en': '',
    },
    'hpfsta66': {
      'ja': '会計管理設定',
      'en': '',
    },
    'awg3bzic': {
      'ja': '注文管理設定',
      'en': '',
    },
    'jwkhcxp3': {
      'ja': '呼び出し設定',
      'en': '',
    },
    'b2djmmkt': {
      'ja': '担当者設定',
      'en': '',
    },
    'xq3drgbe': {
      'ja': 'レジプリンター設定',
      'en': '',
    },
    'yp6agz3g': {
      'ja': 'セキュリティ',
      'en': '',
    },
    'o07vahif': {
      'ja': 'ログアウト',
      'en': '',
    },
    'zwhcawev': {
      'ja': 'Home',
      'en': '',
    },
  },
  // tablecode
  {
    'qt1qxgn4': {
      'ja': 'テーブルリスト(10)',
      'en': '',
    },
    'het6c3ha': {
      'ja': 'テーブルを追加',
      'en': '',
    },
    '71iy3sqv': {
      'ja': 'テーブル　T1',
      'en': '',
    },
    '4i3kk335': {
      'ja': 'コード発行',
      'en': '',
    },
    'zf83fk6v': {
      'ja': '二次元コードを一括発行する',
      'en': '',
    },
    '6hm4ttlz': {
      'ja': 'Home',
      'en': '',
    },
  },
  // qrcode
  {
    'nwok0656': {
      'ja': 'ロゴ',
      'en': '',
    },
    'd1a2u1e3': {
      'ja': 'テーブル',
      'en': '',
    },
    'cg1d0zoo': {
      'ja': '店\n舗\n名',
      'en': '',
    },
    '62svdtua': {
      'ja': 'ロゴ',
      'en': '',
    },
    '6el4jsq0': {
      'ja': 'テーブル',
      'en': '',
    },
    'f0kiwgz2': {
      'ja': '店\n舗\n名',
      'en': '',
    },
    'ek4rgeo1': {
      'ja': '保存する',
      'en': '',
    },
    '9k6f2ujf': {
      'ja': 'Home',
      'en': '',
    },
  },
  // abouttheresutaurant
  {
    '0v3wq4wq': {
      'ja': '店舗名',
      'en': '',
    },
    '3ai3bsfy': {
      'ja': '一本屋トヨタ店',
      'en': '',
    },
    't79qorqu': {
      'ja': 'メールアドレス',
      'en': '',
    },
    'n5815ksy': {
      'ja': 'gmail.com',
      'en': '',
    },
    'j22zzejq': {
      'ja': '電話番号',
      'en': '',
    },
    'kfntl9dt': {
      'ja': '0000000',
      'en': '',
    },
    'hw7mql67': {
      'ja': '定休日',
      'en': '',
    },
    '71gqo660': {
      'ja': '月曜日',
      'en': '',
    },
    '8cup2lad': {
      'ja': '火曜日',
      'en': '',
    },
    '0a1l0im6': {
      'ja': '水曜日',
      'en': '',
    },
    '6bkbc3aw': {
      'ja': '木曜日',
      'en': '',
    },
    '85ygmzt6': {
      'ja': '金曜日',
      'en': '',
    },
    'ydj8kph3': {
      'ja': '土曜日',
      'en': '',
    },
    '7lo8sn7t': {
      'ja': '日曜日',
      'en': '',
    },
    'h8mkh7mi': {
      'ja': '祝日',
      'en': '',
    },
    '3jaim4hu': {
      'ja': '営業除外日',
      'en': '',
    },
    '5zgs1776': {
      'ja': '＋営業除外日を追加する',
      'en': '',
    },
    'uy0nwe1w': {
      'ja': '営業時間',
      'en': '',
    },
    'gtrkhzhb': {
      'ja': '09:00-21:00',
      'en': '',
    },
    '7qnbd0np': {
      'ja': '＋営業時間帯を追加する',
      'en': '',
    },
    '54hiv3bu': {
      'ja': '郵便番号',
      'en': '',
    },
    'slladcqa': {
      'ja': '473-001',
      'en': '',
    },
    'tzw9u8ma': {
      'ja': '都道府県',
      'en': '',
    },
    'heu0cgsx': {
      'ja': '愛知県',
      'en': '',
    },
    'tk47avlb': {
      'ja': '市町村区',
      'en': '',
    },
    'kul2yor7': {
      'ja': '473-001',
      'en': '',
    },
    '54hncn7p': {
      'ja': '町名番地',
      'en': '',
    },
    'a82o2ewq': {
      'ja': '愛知県',
      'en': '',
    },
    'hltd1ih5': {
      'ja': 'ビル名等',
      'en': '',
    },
    '9p0mvse5': {
      'ja': '473-001',
      'en': '',
    },
    'jr5w5lns': {
      'ja': 'GPS情報',
      'en': '',
    },
    '32z1knvs': {
      'ja': '緯度\n経度',
      'en': '',
    },
    'xxyq9r69': {
      'ja': '店舗ロゴ',
      'en': '',
    },
    'ykeuj6r7': {
      'ja': '店舗写真',
      'en': '',
    },
    '1qnhjis4': {
      'ja': '店舗紹介',
      'en': '',
    },
    'm725dlgh': {
      'ja': '0000000',
      'en': '',
    },
    'e5fomtc1': {
      'ja': '保存する',
      'en': '',
    },
    'eogzf0tf': {
      'ja': 'Home',
      'en': '',
    },
  },
  // paswordSettings
  {
    'ae8ytny9': {
      'ja':
          'このページを編集するには現在のパスワードを入力する必要があります。\nパスワードを忘れた場合は「パスワードをお忘れの場合」で再設定して下さい。',
      'en': '',
    },
    't056ph59': {
      'ja': 'パスワード設定',
      'en': '',
    },
    'nd55573x': {
      'ja': '現在のパスワード',
      'en': '',
    },
    'r9k9ev7f': {
      'ja': '現在のパスワードを入力して下さい',
      'en': '',
    },
    'fxmnpl1f': {
      'ja': '＋パスワードをお忘れの場合',
      'en': '',
    },
    'tpp4t0zn': {
      'ja': '新しいパスワード',
      'en': '',
    },
    '79yssk93': {
      'ja': 'パスワードを変更しない場合は空欄',
      'en': '',
    },
    'ek9ogqmg': {
      'ja': '入力確認',
      'en': '',
    },
    '4u62fwl6': {
      'ja': 'パスワードを変更しない場合は空欄',
      'en': '',
    },
    'b1uqzdkg': {
      'ja': 'パスコード変更',
      'en': '',
    },
    'ivtcynu9': {
      'ja': '４桁数字、変更しない場合は空欄',
      'en': '',
    },
    '41v4keon': {
      'ja': '保存する',
      'en': '',
    },
    '103bgz8u': {
      'ja': 'Home',
      'en': '',
    },
  },
  // PaymentSettings
  {
    '6gbsv6la': {
      'ja':
          'オン状態の支払い方法は客様のスマホに表示されますので、必ず対応できる支払い方法のみ設定してください\nまた、支払い方法の登録もできるようになりました。ぜひご活用ください！',
      'en': '',
    },
    '4iad8eke': {
      'ja': '決済方法設定',
      'en': '',
    },
    '65m52kic': {
      'ja': '現金',
      'en': '',
    },
    '43ocz8c7': {
      'ja': 'Squareリーダー/スタンド',
      'en': '',
    },
    'xk5byoxw': {
      'ja': '＋登録する',
      'en': '',
    },
    'tum6hz88': {
      'ja': '保存する',
      'en': '',
    },
    'gfnzdhmj': {
      'ja': 'Home',
      'en': '',
    },
  },
  // PascodeSettings
  {
    'sc97t5ye': {
      'ja':
          'このページを編集するには現在のパスコードを入力する必要があります\nパスコードを忘れた場合は「パスコード変更」ページで再設定してください。\n設定がオンの機能にアクセスする際にパスコードが求められます',
      'en': '',
    },
    '0i3lwfpi': {
      'ja': 'パスコード設定',
      'en': '',
    },
    'vj4st0sy': {
      'ja': '現在のパスコード',
      'en': '',
    },
    'bfxh2bk4': {
      'ja': '現在のパスコードを入力して下さい',
      'en': '',
    },
    'i2i19mil': {
      'ja': '＋パスワードをお忘れの場合',
      'en': '',
    },
    '9qkckhmf': {
      'ja': '注文管理',
      'en': '',
    },
    '77rxymwp': {
      'ja': '決済履歴',
      'en': '',
    },
    'zt5k2cr0': {
      'ja': '営業データ',
      'en': '',
    },
    '9om4ecka': {
      'ja': 'テーブルコード',
      'en': '',
    },
    'nxj640rg': {
      'ja': '商品管理',
      'en': '',
    },
    'd7enou2j': {
      'ja': '店舗情報',
      'en': '',
    },
    'lc2v8pig': {
      'ja': '保存する',
      'en': '',
    },
    '812646bq': {
      'ja': 'Home',
      'en': '',
    },
  },
  // taxsettings
  {
    'qz62u7i1': {
      'ja': '税率設定',
      'en': '',
    },
    '92gkwcvy': {
      'ja': '税率設定',
      'en': '',
    },
    'kf3ymd4q': {
      'ja': '税込表示',
      'en': '',
    },
    'nus3g85j': {
      'ja': '税抜表示',
      'en': '',
    },
    'tvbs0bol': {
      'ja': '標準税率',
      'en': '',
    },
    'ywnonvs9': {
      'ja': '10%',
      'en': '',
    },
    'ydnmygoa': {
      'ja': '軽減税率',
      'en': '',
    },
    '7htzi8b1': {
      'ja': '8%',
      'en': '',
    },
    '1us521oa': {
      'ja': '非課税',
      'en': '',
    },
    'c9m5dbva': {
      'ja': '0%',
      'en': '',
    },
    'mqg4zbpm': {
      'ja': '保存する',
      'en': '',
    },
    'ppedja25': {
      'ja': 'Home',
      'en': '',
    },
  },
  // accountingsettings
  {
    'fbuebpgz': {
      'ja': '会計設定',
      'en': '',
    },
    '7frd779g': {
      'ja': '端数の切り捨て',
      'en': '',
    },
    '31zdgtc7': {
      'ja': '割り勘余分の徴収',
      'en': '',
    },
    'd1wxnem3': {
      'ja': '客数入力（客単価集計）',
      'en': '',
    },
    'wbrqzfab': {
      'ja': '注文ページでの入力',
      'en': '',
    },
    'vzma255o': {
      'ja': 'サービス料機能',
      'en': '',
    },
    '68g7r24b': {
      'ja': 'レジ残金の自動繰越',
      'en': '',
    },
    'qjgfwuar': {
      'ja': '日付変更時刻',
      'en': '',
    },
    'iwyoxko1': {
      'ja': '保存する',
      'en': '',
    },
    'jx8wtc4f': {
      'ja': 'Home',
      'en': '',
    },
  },
  // ordersettings
  {
    'ckxa763i': {
      'ja': '注文管理設定',
      'en': '',
    },
    '8qcs6d66': {
      'ja': '新規・追加タグの表示',
      'en': '',
    },
    'r6q1mzw2': {
      'ja': '商品の一部提出機能',
      'en': '',
    },
    'n8n73051': {
      'ja': '保存する',
      'en': '',
    },
    '5bjf8iid': {
      'ja': 'Home',
      'en': '',
    },
  },
  // CallSettings
  {
    'ohiul9vj': {
      'ja': '呼び出し設定',
      'en': '',
    },
    'gzw59dy2': {
      'ja': '呼び出し機能',
      'en': '',
    },
    'bwzowp0f': {
      'ja': 'おしぼり',
      'en': '',
    },
    'ujlcuvrp': {
      'ja': '網交換',
      'en': '',
    },
    'ksslpkl2': {
      'ja': '取り分け皿',
      'en': '',
    },
    'q2j9psvp': {
      'ja': 'その他',
      'en': '',
    },
    '7w05chr8': {
      'ja': 'ラストオーダー通知機能',
      'en': '',
    },
    'pjucf9aq': {
      'ja': '通知時間',
      'en': '',
    },
    'dormjcvh': {
      'ja': 'ラストオーダー前',
      'en': '',
    },
    '45qch80f': {
      'ja': '保存する',
      'en': '',
    },
    'h31ulbts': {
      'ja': 'Home',
      'en': '',
    },
  },
  // ManegerSettings
  {
    'k9jy9eaf': {
      'ja': '担当者設定',
      'en': '',
    },
    'jzey0opc': {
      'ja': '指定なし',
      'en': '',
    },
    '19w4cvnj': {
      'ja': 'デフォルト',
      'en': '',
    },
    '7juzofxy': {
      'ja': '＋登録する',
      'en': '',
    },
    'l20rnxt0': {
      'ja': '保存する',
      'en': '',
    },
    '6j00kp99': {
      'ja': 'Home',
      'en': '',
    },
  },
  // security
  {
    'h7jtop3y': {
      'ja':
          '本機能をオンにすれば、お客さまが注文する際にGPS機能の使用が求められます\n拒否された場合、ブラウザからの注文ができなくなります。\n他のアプリからコードをスキャンするようご提示ください',
      'en': '',
    },
    'j1nt0fdv': {
      'ja': 'セキュリティ',
      'en': '',
    },
    '2zcnj1x2': {
      'ja': 'GPS認証機能',
      'en': '',
    },
    'z8fg1mrs': {
      'ja': 'GPS認証レベル',
      'en': '',
    },
    'skadxh1n': {
      'ja': '普通',
      'en': '',
    },
    'p76ba7ed': {
      'ja': '注文ページの有効期間',
      'en': '',
    },
    'hxtoynxx': {
      'ja': '90分',
      'en': '',
    },
    'fwap7tej': {
      'ja': 'セーフモード',
      'en': '',
    },
    '06wveapu': {
      'ja': '保存する',
      'en': '',
    },
    '1oeg8tgu': {
      'ja': 'Home',
      'en': '',
    },
  },
  // printerSettings
  {
    '209iv2q3': {
      'ja':
          'iPad-「設定」-「Bluetooth」にて、プリンターとペアリングしてください\n「利用中のプリンター」で対応プリンターの型番を確認することができます',
      'en': '',
    },
    '20tyjfui': {
      'ja': 'プリンター機能',
      'en': '',
    },
    'xzit7qek': {
      'ja': '利用中のプリンター',
      'en': '',
    },
    'vjmt3lbm': {
      'ja': '接続中...',
      'en': '',
    },
    'l3u6bowj': {
      'ja': '紙幅',
      'en': '',
    },
    '3y9qaygw': {
      'ja': '58mm',
      'en': '',
    },
    'gv1jwqvc': {
      'ja': '領収書の印字方向',
      'en': '',
    },
    'one44m2n': {
      'ja': '横向き',
      'en': '',
    },
    'hpfecdzn': {
      'ja': 'テスト印字',
      'en': '',
    },
    't3c5yit8': {
      'ja': '実行する',
      'en': '',
    },
    'p0b24uub': {
      'ja': '0円オプションの印字',
      'en': '',
    },
    '4m4toj5r': {
      'ja': '0円商品の印字',
      'en': '',
    },
    'kkg8xskk': {
      'ja': '放題商品の印字',
      'en': '',
    },
    'dx62jt99': {
      'ja': '会計完了時自動印刷',
      'en': '',
    },
    'gjrr4hje': {
      'ja': '精算完了時自動印刷',
      'en': '',
    },
    '84zv2kqj': {
      'ja': '一本屋トヨタ店',
      'en': '',
    },
    'c5pv9ihz': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    'jjn4xris': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    'az7evcfv': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    '5w2npkcg': {
      'ja': '包み牛タン',
      'en': '',
    },
    'ny0cfkx9': {
      'ja': '1',
      'en': '',
    },
    'mauyak22': {
      'ja': '¥',
      'en': '',
    },
    'wrhmq6e8': {
      'ja': '1,290',
      'en': '',
    },
    '2zq888p6': {
      'ja': '小計（税込）',
      'en': '',
    },
    'jy256emq': {
      'ja': '¥',
      'en': '',
    },
    'l5t3v531': {
      'ja': '1,290',
      'en': '',
    },
    '5a664bev': {
      'ja': '合計（税込）',
      'en': '',
    },
    'fhu976tp': {
      'ja': '¥',
      'en': '',
    },
    'j65h4v85': {
      'ja': '1,290',
      'en': '',
    },
    '9gf1i8oh': {
      'ja': '内消費税',
      'en': '',
    },
    'e2tkpts4': {
      'ja': '¥',
      'en': '',
    },
    'utp29yxj': {
      'ja': '1,290',
      'en': '',
    },
    'fx54hfr4': {
      'ja': '保存する',
      'en': '',
    },
    '1huaziup': {
      'ja': 'Home',
      'en': '',
    },
  },
  // CloudService
  {
    '2k5dl2gp': {
      'ja': 'テイクアウト',
      'en': '',
    },
    '4v0pb0n7': {
      'ja': 'デリバリー',
      'en': '',
    },
    'iyxdhvf4': {
      'ja': '決済履歴',
      'en': '',
    },
    'cg9ngjwl': {
      'ja': 'square連携',
      'en': '',
    },
    '48a5w48q': {
      'ja': 'stera pack連携',
      'en': '',
    },
    '83vllc5j': {
      'ja': 'ハードウェア',
      'en': '',
    },
    '1ha9gz7l': {
      'ja': 'Home',
      'en': '',
    },
  },
  // takeout
  {
    'gubwitxe': {
      'ja': 'テイクアウト機能',
      'en': '',
    },
    'wjd3pbe2': {
      'ja': '調理の必要時間',
      'en': '',
    },
    'kkfdw78y': {
      'ja': '20分',
      'en': '',
    },
    'pl9z9hmg': {
      'ja': '予約受付時間',
      'en': '',
    },
    'ycpo9g55': {
      'ja': '明日まで',
      'en': '',
    },
    'fps8o3ut': {
      'ja': 'ピックアップ時間帯',
      'en': '',
    },
    'i99mrw93': {
      'ja': '09:00-21:00',
      'en': '',
    },
    'm0ria807': {
      'ja': '＋時間帯を追加する',
      'en': '',
    },
    'sln6nw6b': {
      'ja': '注文自動受付',
      'en': '',
    },
    'si52d47h': {
      'ja': '自動受付後の通知メールの送信',
      'en': '',
    },
    'blmfh7y7': {
      'ja': '店頭払い',
      'en': '',
    },
    '3ssvix2h': {
      'ja': 'モバイルオーダー決済',
      'en': '',
    },
    'ebwcddym': {
      'ja': '保存する',
      'en': '',
    },
    'l7yxqtzu': {
      'ja': 'Home',
      'en': '',
    },
  },
  // delivery
  {
    'e62emhi7': {
      'ja': 'デリバリー機能',
      'en': '',
    },
    '0dtm2c3j': {
      'ja': '調理の必要時間',
      'en': '',
    },
    '9jg57t5k': {
      'ja': '20分',
      'en': '',
    },
    'f8pp8a0w': {
      'ja': '予約受付期間',
      'en': '',
    },
    'd4io1dck': {
      'ja': '当日のみ',
      'en': '',
    },
    't6pxq5id': {
      'ja': '最低注文金額',
      'en': '',
    },
    'nnpnmvrh': {
      'ja': '¥0',
      'en': '',
    },
    'brbw4sig': {
      'ja': '配達可能な範囲',
      'en': '',
    },
    '1pj3gqwb': {
      'ja': '0.0KM',
      'en': '',
    },
    'vkr9qw5g': {
      'ja': '基本配達料金',
      'en': '',
    },
    'i079c5nv': {
      'ja': '0KM 以内 ¥0',
      'en': '',
    },
    'v3qfzbf2': {
      'ja': '追加配達料金',
      'en': '',
    },
    'edqv45e6': {
      'ja': '基本配達以外 0KM ごと¥0',
      'en': '',
    },
    'cntnehfh': {
      'ja': '送料免除注文額',
      'en': '',
    },
    'mrahow6y': {
      'ja': '免除しない',
      'en': '',
    },
    'cfubqubz': {
      'ja': '送料表示名',
      'en': '',
    },
    'lx367z26': {
      'ja': '配達料',
      'en': '',
    },
    'kz5flvlb': {
      'ja': 'デリバリー時間帯',
      'en': '',
    },
    '07igp6pa': {
      'ja': '09:00-21:00',
      'en': '',
    },
    'g1qo5nz4': {
      'ja': '＋時間帯を追加する',
      'en': '',
    },
    'hl8f8vp2': {
      'ja': '注文自動受付',
      'en': '',
    },
    '9slp0ucu': {
      'ja': '自動受付後の通知メールの送付',
      'en': '',
    },
    'w7fhl0dw': {
      'ja': '保存する',
      'en': '',
    },
    'z39gk3jt': {
      'ja': 'Home',
      'en': '',
    },
  },
  // login
  {
    'hp1l4aij': {
      'ja': 'また行きたくなるお店づくりのために',
      'en': '',
    },
    'clwd4pvo': {
      'ja': 'ログイン',
      'en': '',
    },
    '0rd9q7pc': {
      'ja': 'メールアドレス',
      'en': '',
    },
    'sks9j8k8': {
      'ja': 'パスワード',
      'en': '',
    },
    '038p76k2': {
      'ja': 'ログイン',
      'en': '',
    },
    'r2mz6xjt': {
      'ja': 'パスワードを忘れた場合は',
      'en': '',
    },
    'i5rsceyx': {
      'ja': 'こちら',
      'en': '',
    },
    '6dikjnex': {
      'ja': 'アカウントを',
      'en': '',
    },
    'a8tykdsi': {
      'ja': '新規登録',
      'en': '',
    },
    'ur79cp3y': {
      'ja': 'Home',
      'en': '',
    },
  },
  // signup
  {
    '2vq264t3': {
      'ja': 'また行きたくなるお店づくりのために',
      'en': '',
    },
    '368a748r': {
      'ja': 'メールアドレス',
      'en': '',
    },
    'fps2ot59': {
      'ja': '認証コードを送信する',
      'en': '',
    },
    'i6ld60f0': {
      'ja': '「利用規約」',
      'en': '',
    },
    'lnh96hq9': {
      'ja': 'と',
      'en': '',
    },
    'xsy9jzqn': {
      'ja': '「プライバシーポリシー」',
      'en': '',
    },
    '6d2j9wja': {
      'ja': 'を同意します',
      'en': '',
    },
    'ugo5dh2l': {
      'ja': 'Home',
      'en': '',
    },
  },
  // viking
  {
    'mxxnmn4e': {
      'ja': '日本語',
      'en': '',
    },
    '4o3serf1': {
      'ja': '英語翻訳',
      'en': '',
    },
    'ny0ormpb': {
      'ja': '中国語翻訳',
      'en': '',
    },
    'rdyvqikz': {
      'ja': '韓国語翻訳',
      'en': '',
    },
    '17zjhjpn': {
      'ja': '食べ飲み放題メニュー名',
      'en': '',
    },
    'nqp13ox8': {
      'ja': '入力してください',
      'en': '',
    },
    'lhwr0ee1': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'tvio7voi': {
      'ja': '価格（1人前）',
      'en': '',
    },
    'j8jnwxmp': {
      'ja': '0以上の生整数を設定してください（必須）',
      'en': '',
    },
    '807x3xt4': {
      'ja': '割引（￥）',
      'en': '',
    },
    'e7ijv1gh': {
      'ja': '0以上の生整数を設定してください（任意）',
      'en': '',
    },
    '208axfur': {
      'ja': '最低注文人数',
      'en': '',
    },
    'i7s458d6': {
      'ja': '2人',
      'en': '',
    },
    '2pxzkojl': {
      'ja': '時間制限',
      'en': '',
    },
    'gjfxjbvz': {
      'ja': '90分',
      'en': '',
    },
    'wnh9zxve': {
      'ja': 'ラストオーダー',
      'en': '',
    },
    'bwrpcqhm': {
      'ja': '5分前',
      'en': '',
    },
    'dvz0f0zn': {
      'ja': '一回の最大注文数',
      'en': '',
    },
    'rnstbhhd': {
      'ja': '6点',
      'en': '',
    },
    'j6kn6hmi': {
      'ja': '表示設定',
      'en': '',
    },
    'fnwgp5gq': {
      'ja': '店内非表示',
      'en': '',
    },
    '03hxpnc7': {
      'ja': '消費税設定',
      'en': '',
    },
    'bcnen6iw': {
      'ja': '税込',
      'en': '',
    },
    'koiklafg': {
      'ja': '税抜',
      'en': '',
    },
    '01rxnjqy': {
      'ja': '税率',
      'en': '',
    },
    'khhf7qb1': {
      'ja': '10%（標準）',
      'en': '',
    },
    'j6ubw8sm': {
      'ja': '通常メニューにてViking関連商品を非表示にする',
      'en': '',
    },
    'ggp5oba2': {
      'ja': 'Viking注文後、関連商品をリストにて0円で表示する',
      'en': '',
    },
    'k0pydzd4': {
      'ja': 'イメージ写真',
      'en': '',
    },
    'mczefq5k': {
      'ja': '説明',
      'en': '',
    },
    'mvkkh3nb': {
      'ja': '紹介を入力してください（任意）',
      'en': '',
    },
    'qwo3a768': {
      'ja': 'メニュー',
      'en': '',
    },
    'zutd8kvn': {
      'ja': '＋',
      'en': '',
    },
    'facttjpy': {
      'ja': '保存する',
      'en': '',
    },
    'tkrdv7rh': {
      'ja': 'Home',
      'en': '',
    },
  },
  // freebox
  {
    '6q9qtp0v': {
      'ja': '日本語',
      'en': '',
    },
    'rg4zmb0z': {
      'ja': '英語翻訳',
      'en': '',
    },
    'vnrhzruc': {
      'ja': '中国語翻訳',
      'en': '',
    },
    'fk17wdl5': {
      'ja': '韓国語翻訳',
      'en': '',
    },
    'romdccxk': {
      'ja': 'freebox名',
      'en': '',
    },
    'txl6flwa': {
      'ja': 'freebox名',
      'en': '',
    },
    'xgihnjrj': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'k1bije7h': {
      'ja': 'freebox名表示',
      'en': '',
    },
    'bdk6vae5': {
      'ja': '非表示',
      'en': '',
    },
    '2aukx27j': {
      'ja': 'カテゴリ欄',
      'en': '',
    },
    'b8ehl859': {
      'ja': '非表示',
      'en': '',
    },
    'kt55fq4m': {
      'ja': 'freebox表示設定',
      'en': '',
    },
    't0n8qzr8': {
      'ja': '店内表示',
      'en': '',
    },
    '1q22jca7': {
      'ja': 'オンライン非表示',
      'en': '',
    },
    'dmblt7zp': {
      'ja': '表示商品',
      'en': '',
    },
    '5mxss6z0': {
      'ja': '＋',
      'en': '',
    },
    'eueite9o': {
      'ja': '保存する',
      'en': '',
    },
    '89tiso4w': {
      'ja': 'Home',
      'en': '',
    },
  },
  // menumanagementCopy2
  {
    '07mufuci': {
      'ja': '商品選択',
      'en': '',
    },
    'wfqllow4': {
      'ja': '一括解除',
      'en': '',
    },
    'gowbdz2c': {
      'ja': '商品名',
      'en': '',
    },
    'pew9x32b': {
      'ja': '¥',
      'en': '',
    },
    'hbu8wvv9': {
      'ja': '390',
      'en': '',
    },
    'hu0378du': {
      'ja': '（税込）',
      'en': '',
    },
    'd65ii8cc': {
      'ja': 'アルコール商品',
      'en': '',
    },
    'nt0d7vib': {
      'ja': '食べ飲み放題商品',
      'en': '',
    },
    'smpykdqb': {
      'ja': '1',
      'en': '',
    },
    'zokaj5a1': {
      'ja': '商品を追加する',
      'en': '',
    },
    'exyl7n3b': {
      'ja': 'Home',
      'en': '',
    },
  },
  // AddMenutoOrder
  {
    'wyqfsc1l': {
      'ja': 'アルコールあり',
      'en': '',
    },
    'djh7tx1t': {
      'ja': '公開中メニュー',
      'en': '',
    },
    'vfu6ole1': {
      'ja': '非公開メニュー',
      'en': '',
    },
    '8lk51ngw': {
      'ja': '商品名をご記入ください',
      'en': '',
    },
    'p3p61jbk': {
      'ja': '検索',
      'en': '',
    },
    '56acee0c': {
      'ja': 'Home',
      'en': '',
    },
  },
  // GGGG
  {
    'gp0xdjlw': {
      'ja': 'Page Title',
      'en': '',
    },
    '85bijurk': {
      'ja': 'Home',
      'en': '',
    },
  },
  // accounting
  {
    '4mh92ah9': {
      'ja': '会計管理',
      'en': '',
    },
    '09n1mv63': {
      'ja': 'レシートボックス',
      'en': '',
    },
    'goer2792': {
      'ja': '清算',
      'en': '',
    },
    'doltbwfz': {
      'ja': '一本屋トヨタ店',
      'en': '',
    },
    '94ztbjss': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    '9xsrefhw': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    'zwcg5avv': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    '7fnjk8yi': {
      'ja': '¥',
      'en': '',
    },
    'nsfea08f': {
      'ja': '1,290',
      'en': '',
    },
    'vabx4oam': {
      'ja': '小計（税込）',
      'en': '',
    },
    'dinhh8y8': {
      'ja': '¥',
      'en': '',
    },
    'k3c78qxi': {
      'ja': '合計（税込）',
      'en': '',
    },
    'tnd4tg7o': {
      'ja': '¥',
      'en': '',
    },
    'yqilhopn': {
      'ja': '内消費税',
      'en': '',
    },
    'b6f9awnc': {
      'ja': '¥',
      'en': '',
    },
    'gmgtmo6h': {
      'ja': '1,290',
      'en': '',
    },
    'l8a1ejum': {
      'ja': '＋',
      'en': '',
    },
    '0dytkrlg': {
      'ja': '商品別会計',
      'en': '',
    },
    '4tx4weq6': {
      'ja': '¥',
      'en': '',
    },
    '58xp63q8': {
      'ja': '標準税率',
      'en': '',
    },
    '2gk8ut0e': {
      'ja': '商品を追加',
      'en': '',
    },
    'q44xdpz8': {
      'ja': 'カスタム商品',
      'en': '',
    },
    'u4hq35hs': {
      'ja': ' 1点',
      'en': '',
    },
    'jylj4c9r': {
      'ja': '¥1,290',
      'en': '',
    },
    'c8cq3f8t': {
      'ja': '（税込）',
      'en': '',
    },
    'g73e8y4d': {
      'ja': '割り勘',
      'en': '',
    },
    'mpaxmwg1': {
      'ja': '割引',
      'en': '',
    },
    'm63ezktl': {
      'ja': '会計に進む',
      'en': '',
    },
    'cxj4vwiw': {
      'ja': 'Home',
      'en': '',
    },
  },
  // ChangeRecipt
  {
    '1h9d0b5o': {
      'ja': '会計管理',
      'en': '',
    },
    'ckdipuuk': {
      'ja': 'レシートボックス',
      'en': '',
    },
    'd2mi8exe': {
      'ja': '清算',
      'en': '',
    },
    'bhlujhh5': {
      'ja': '一本屋トヨタ店',
      'en': '',
    },
    's982xn2c': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    'wrtwz3e1': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    'haq9sdhs': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    '52a3hdff': {
      'ja': '包み牛タン',
      'en': '',
    },
    'adms0n4n': {
      'ja': '1',
      'en': '',
    },
    '7k370tjo': {
      'ja': '¥',
      'en': '',
    },
    'wt74kxmf': {
      'ja': '1,290',
      'en': '',
    },
    'm5w1yua8': {
      'ja': '小計（税込）',
      'en': '',
    },
    '8mxuzsly': {
      'ja': '¥',
      'en': '',
    },
    'bhu22q0c': {
      'ja': '1,290',
      'en': '',
    },
    'cxawcy0p': {
      'ja': '合計（税込）',
      'en': '',
    },
    '93jltlzz': {
      'ja': '¥',
      'en': '',
    },
    '7dk7gi09': {
      'ja': '1,290',
      'en': '',
    },
    '77aar2h4': {
      'ja': '内消費税',
      'en': '',
    },
    '4rnjwi4l': {
      'ja': '¥',
      'en': '',
    },
    'oad1yx2e': {
      'ja': '1,290',
      'en': '',
    },
    '7j46jego': {
      'ja': 'test',
      'en': '',
    },
    '296otbev': {
      'ja': '＋',
      'en': '',
    },
    'spivoj8w': {
      'ja': '商品別会計',
      'en': '',
    },
    'tiyidztr': {
      'ja': '池田美優',
      'en': '',
    },
    '3912dxjv': {
      'ja': '◯回目',
      'en': '',
    },
    'li3kkl88': {
      'ja': '前回12/5',
      'en': '',
    },
    'bmufsv6j': {
      'ja': '商品名',
      'en': '',
    },
    'cgy2metq': {
      'ja': '1',
      'en': '',
    },
    '0vakm08d': {
      'ja': '1',
      'en': '',
    },
    'iluv44bf': {
      'ja': '標準税率',
      'en': '',
    },
    'ghs7gpbf': {
      'ja': '商品を追加',
      'en': '',
    },
    'y0m2b1pp': {
      'ja': 'カスタム商品',
      'en': '',
    },
    '5ype30pn': {
      'ja': ' 1点',
      'en': '',
    },
    'i2tj5x98': {
      'ja': '¥1,290',
      'en': '',
    },
    'buj90b4t': {
      'ja': '（税込）',
      'en': '',
    },
    'p9xfjx7o': {
      'ja': '割り勘',
      'en': '',
    },
    'zy9q6saa': {
      'ja': '割引',
      'en': '',
    },
    '230clhdj': {
      'ja': '会計を修正',
      'en': '',
    },
    '6a1pdq3c': {
      'ja': 'Home',
      'en': '',
    },
  },
  // ReciptBox
  {
    'eql3c7rg': {
      'ja': '会計管理',
      'en': '',
    },
    'zn92ef51': {
      'ja': 'レシートボックス',
      'en': '',
    },
    '4jjja7uq': {
      'ja': '清算',
      'en': '',
    },
    'svz93tyj': {
      'ja': '2023-12-07',
      'en': '',
    },
    'wkv48dlb': {
      'ja': '合計金額',
      'en': '',
    },
    '32aye58u': {
      'ja': '¥',
      'en': '',
    },
    'xyzqjr5e': {
      'ja': '112,630',
      'en': '',
    },
    'rlzzzabu': {
      'ja': 'レシート印刷',
      'en': '',
    },
    'f61cl8r6': {
      'ja': '領収書印刷',
      'en': '',
    },
    'jis52tzw': {
      'ja': '一本屋トヨタ店',
      'en': '',
    },
    '0v9vmo0u': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    '83qj5atx': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    'lq0qg6hc': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    '4ni0jgzl': {
      'ja': '包み牛タン',
      'en': '',
    },
    'nkbhoi8u': {
      'ja': '1',
      'en': '',
    },
    'lpvmibcm': {
      'ja': '¥',
      'en': '',
    },
    'rqcaromg': {
      'ja': '1,290',
      'en': '',
    },
    'p336fp99': {
      'ja': '小計（税込）',
      'en': '',
    },
    'g6pxc3ly': {
      'ja': '¥',
      'en': '',
    },
    'kr48whk2': {
      'ja': '1,290',
      'en': '',
    },
    '7akd8dwh': {
      'ja': '合計（税込）',
      'en': '',
    },
    'zhbod16o': {
      'ja': '¥',
      'en': '',
    },
    'lq1dnmh3': {
      'ja': '1,290',
      'en': '',
    },
    'alg7ztld': {
      'ja': '内消費税',
      'en': '',
    },
    'ka512t3a': {
      'ja': '¥',
      'en': '',
    },
    'wu6r8vgp': {
      'ja': '1,290',
      'en': '',
    },
    '9hzu92tt': {
      'ja': '赤伝票',
      'en': '',
    },
    'yr8c33wd': {
      'ja': 'テーブル T5',
      'en': '',
    },
    '1pjhgt2b': {
      'ja': '21:00',
      'en': '',
    },
    'lmpzwdz2': {
      'ja': '¥7,920',
      'en': '',
    },
    'v2te2j1s': {
      'ja': '割引',
      'en': '',
    },
    'pr0bdx3z': {
      'ja': '現金',
      'en': '',
    },
    '4i3n3stg': {
      'ja': '決済完了',
      'en': '',
    },
    'e86vcx57': {
      'ja': 'Home',
      'en': '',
    },
  },
  // ReciptBoxCopy
  {
    '71ec8qz7': {
      'ja': '会計管理',
      'en': '',
    },
    'xfavfk3v': {
      'ja': 'レシートボックス',
      'en': '',
    },
    'qkpfswxn': {
      'ja': '清算',
      'en': '',
    },
    't6xiyzfi': {
      'ja': '2023-12-07',
      'en': '',
    },
    'xqgfokwe': {
      'ja': '合計金額',
      'en': '',
    },
    'vpztngbh': {
      'ja': '¥',
      'en': '',
    },
    'i39qkydv': {
      'ja': '112,630',
      'en': '',
    },
    'mfb9lrnl': {
      'ja': 'レシート印刷',
      'en': '',
    },
    'gehgj0as': {
      'ja': '領収書印刷',
      'en': '',
    },
    '7tc3ifwc': {
      'ja': '一本屋トヨタ店',
      'en': '',
    },
    '82wskrvb': {
      'ja': '赤伝票',
      'en': '',
    },
    '42vrkgw6': {
      'ja': '訂正伝票0000000',
      'en': '',
    },
    's0qf4m9k': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    '6dgttwk2': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    '4uoihybt': {
      'ja': '番号numbers0000000',
      'en': '',
    },
    'xe0u9ln4': {
      'ja': '包み牛タン',
      'en': '',
    },
    '9ckfr6j2': {
      'ja': '1',
      'en': '',
    },
    'uk9yisbo': {
      'ja': '¥',
      'en': '',
    },
    'cz7qpfbc': {
      'ja': '1,290',
      'en': '',
    },
    'mngwsm3f': {
      'ja': '小計（税込）',
      'en': '',
    },
    '01shkjl5': {
      'ja': '¥',
      'en': '',
    },
    'yjqrpfy0': {
      'ja': '1,290',
      'en': '',
    },
    'mdc1ia2m': {
      'ja': '合計（税込）',
      'en': '',
    },
    'ffzvxukz': {
      'ja': '¥',
      'en': '',
    },
    'd85z42kj': {
      'ja': '1,290',
      'en': '',
    },
    'qum6oy7v': {
      'ja': '内消費税',
      'en': '',
    },
    'hqzzjprz': {
      'ja': '¥',
      'en': '',
    },
    'ot13wfwf': {
      'ja': '1,290',
      'en': '',
    },
    'kvhppy5e': {
      'ja': 'テーブル T5',
      'en': '',
    },
    'vxjc4y27': {
      'ja': '21:00',
      'en': '',
    },
    'xm2i18d3': {
      'ja': '訂正伝票',
      'en': '',
    },
    'vfdu050g': {
      'ja': '¥7,920',
      'en': '',
    },
    '3ztscvhe': {
      'ja': '割引',
      'en': '',
    },
    'zb5y25y4': {
      'ja': '現金',
      'en': '',
    },
    '77wrvudn': {
      'ja': '決済完了',
      'en': '',
    },
    '4raeprqj': {
      'ja': 'Home',
      'en': '',
    },
  },
  // salesdatatotalCopy2
  {
    'jt0pvv01': {
      'ja': '売上集計',
      'en': '',
    },
    'e5q36os8': {
      'ja': '商品別売上',
      'en': '',
    },
    '9tm91yim': {
      'ja': 'グラフ',
      'en': '',
    },
    '9cnl8ngv': {
      'ja': '期間別売上',
      'en': '',
    },
    'd1mgj5mq': {
      'ja': '月別売上',
      'en': '',
    },
    '1bg8hv3g': {
      'ja': '年別売上',
      'en': '',
    },
    'ajo641cr': {
      'ja': '2023-12-13',
      'en': '',
    },
    'dx8yj08y': {
      'ja': '一般注文',
      'en': '',
    },
    'wmqqttsn': {
      'ja': 'テイクアウト',
      'en': '',
    },
    '7kq528th': {
      'ja': 'デリバリー',
      'en': '',
    },
    'qwbaodz2': {
      'ja': '売上推移',
      'en': '',
    },
    'vk0dhnkq': {
      'ja': 'Home',
      'en': '',
    },
  },
  // menumanagementCopy
  {
    'w0v3d1l9': {
      'ja': '商品カテゴリー',
      'en': '',
    },
    'unjvs8ke': {
      'ja': '商品追加',
      'en': '',
    },
    'c85hz70a': {
      'ja': 'モジュール追加',
      'en': '',
    },
    'x270ge0a': {
      'ja': '税率設定',
      'en': '',
    },
    '4bcezwjv': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'b3x2kv1s': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'i8bdx5r2': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'xef4d781': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'jsm7y38w': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'vzafp58e': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'twxtpygk': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'irjstsgu': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'aywwv077': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'uz76pf97': {
      'ja': 'カテゴリー',
      'en': '',
    },
    'aege6b8o': {
      'ja': '人気ベスト5',
      'en': '',
    },
    'rc5l2jbu': {
      'ja': 'カテゴリ欄表示',
      'en': '',
    },
    'htks39r1': {
      'ja': '店内表示',
      'en': '',
    },
    'oaevr732': {
      'ja': 'オンライン表示',
      'en': '',
    },
    'ucpoc1bl': {
      'ja': '編集',
      'en': '',
    },
    '5rrppey8': {
      'ja': 'Home',
      'en': '',
    },
  },
  // Seisan2
  {
    '5qjvjn4l': {
      'ja': '会計管理',
      'en': '',
    },
    'mwgyzak3': {
      'ja': 'レシートボックス',
      'en': '',
    },
    'ygm537jp': {
      'ja': '清算',
      'en': '',
    },
    'j5hngi2u': {
      'ja': '2023-12-07',
      'en': '',
    },
    'a6eino6y': {
      'ja': 'レシート発行',
      'en': '',
    },
    'fynp3q7o': {
      'ja': '売上',
      'en': '',
    },
    'uowjbp6v': {
      'ja': '¥20,690',
      'en': '',
    },
    'grscesv6': {
      'ja': '割引前売上高',
      'en': '',
    },
    'igv79zke': {
      'ja': '¥ ',
      'en': '',
    },
    'eul14zwf': {
      'ja': '0',
      'en': '',
    },
    'isivodjn': {
      'ja': '売上高（税込み）',
      'en': '',
    },
    'tx0z9zfr': {
      'ja': '¥ ',
      'en': '',
    },
    'pcipa7gw': {
      'ja': '20,690',
      'en': '',
    },
    'hzm45io4': {
      'ja': '売上高（税抜き）',
      'en': '',
    },
    'p54mnxju': {
      'ja': '¥ ',
      'en': '',
    },
    'ppu300l6': {
      'ja': '1,8621',
      'en': '',
    },
    'rs3xjrq5': {
      'ja': '割引額',
      'en': '',
    },
    'g6ockej1': {
      'ja': '¥ ',
      'en': '',
    },
    'kb8x8vnw': {
      'ja': '2,069',
      'en': '',
    },
    '9oba9k07': {
      'ja': '消費税総額',
      'en': '',
    },
    'd2m397id': {
      'ja': '¥ ',
      'en': '',
    },
    't0ew6lj8': {
      'ja': '20,690',
      'en': '',
    },
    'nt7hi4zi': {
      'ja': '会計数',
      'en': '',
    },
    'nhdob8iv': {
      'ja': '2 ',
      'en': '',
    },
    '457omrbz': {
      'ja': '回',
      'en': '',
    },
    'u4zq1sna': {
      'ja': '支払い方法',
      'en': '',
    },
    'caw2ynul': {
      'ja': '¥20,690',
      'en': '',
    },
    'gwapdir4': {
      'ja': '現金',
      'en': '',
    },
    'a4u0pa66': {
      'ja': '¥ ',
      'en': '',
    },
    'exrnk5qh': {
      'ja': '20,690',
      'en': '',
    },
    'impssetl': {
      'ja': 'Square',
      'en': '',
    },
    '5a6pccyo': {
      'ja': '¥ ',
      'en': '',
    },
    'dt252p67': {
      'ja': '20,690',
      'en': '',
    },
    'wytamcr8': {
      'ja': '現金状況',
      'en': '',
    },
    'ww7duhg6': {
      'ja': '現金繰越額A',
      'en': '',
    },
    '6jsnz6qx': {
      'ja': '¥',
      'en': '',
    },
    'q6dl32l7': {
      'ja': '100,000',
      'en': '',
    },
    '3l4pz0ku': {
      'ja': 'つり銭準備金B',
      'en': '',
    },
    '8cr6grlc': {
      'ja': '¥',
      'en': '',
    },
    '3x5j3hgd': {
      'ja': '0',
      'en': '',
    },
    'jse3eowq': {
      'ja': '現金売上高C',
      'en': '',
    },
    'whqire5g': {
      'ja': '¥',
      'en': '',
    },
    '6v895ko4': {
      'ja': '7,920',
      'en': '',
    },
    'triugl6g': {
      'ja': '出金額D',
      'en': '',
    },
    'kcmsiybv': {
      'ja': '入金額E',
      'en': '',
    },
    '7c521z2i': {
      'ja': '予想残高F＝（A＋B＋C＋D＋E）',
      'en': '',
    },
    'ug0pmu8h': {
      'ja': '¥',
      'en': '',
    },
    'j592n548': {
      'ja': '107,920',
      'en': '',
    },
    '6z0xjg70': {
      'ja': '現金残高（点検）G',
      'en': '',
    },
    '8o1mp1qo': {
      'ja': '¥',
      'en': '',
    },
    'ehc74byp': {
      'ja': '107,920',
      'en': '',
    },
    '7fr7o3af': {
      'ja': '過不足金H＝（G-F）',
      'en': '',
    },
    'iad0ltrx': {
      'ja': '¥',
      'en': '',
    },
    'czmoznae': {
      'ja': '0',
      'en': '',
    },
    'g0dr04yb': {
      'ja': '補正',
      'en': '',
    },
    '97qacoca': {
      'ja': '差額補正I',
      'en': '',
    },
    'ue4l9pct': {
      'ja': '¥',
      'en': '',
    },
    'b8zzoqjr': {
      'ja': '0',
      'en': '',
    },
    'cvqc9frn': {
      'ja': '補正後残高J＝（G＋I）',
      'en': '',
    },
    '6g59wp1n': {
      'ja': '¥',
      'en': '',
    },
    'oeqoroa5': {
      'ja': '107,920',
      'en': '',
    },
    'un06cxh9': {
      'ja': '最終入出金K',
      'en': '',
    },
    'fmt1ax0y': {
      'ja': '-',
      'en': '',
    },
    'lyux6voa': {
      'ja': '¥',
      'en': '',
    },
    '7o13lonh': {
      'ja': '107,920',
      'en': '',
    },
    'fkoqu37i': {
      'ja': '繰越残高L＝（J±K）',
      'en': '',
    },
    'o2vjvs7x': {
      'ja': '¥',
      'en': '',
    },
    'tltqdjsk': {
      'ja': '100,000',
      'en': '',
    },
    'n0nvvw0z': {
      'ja': '担当者',
      'en': '',
    },
    'zxqkoh8n': {
      'ja': 'Home',
      'en': '',
    },
  },
  // CompletedOrders
  {
    'e8vifv82': {
      'ja': '進行中の注文',
      'en': '',
    },
    'r5cp4f8i': {
      'ja': '完成した注文',
      'en': '',
    },
    'cx7l0iun': {
      'ja': '予約注文管理',
      'en': '',
    },
    '1nobm3zd': {
      'ja': 'テーブル',
      'en': '',
    },
    'qbty22rf': {
      'ja': '21:00',
      'en': '',
    },
    'afkyq91x': {
      'ja': '点数：',
      'en': '',
    },
    'pkbtmtpk': {
      'ja': ' T1',
      'en': '',
    },
    '1vx4k0li': {
      'ja': '点数：',
      'en': '',
    },
    'efbiz284': {
      'ja': '１',
      'en': '',
    },
    'l3mvl0j1': {
      'ja': '商品名',
      'en': '',
    },
    'b8ll6z2x': {
      'ja': '¥',
      'en': '',
    },
    '120zkz65': {
      'ja': '1,290',
      'en': '',
    },
    'wup96jx7': {
      'ja': '1',
      'en': '',
    },
    'm2rmryys': {
      'ja': 'Home',
      'en': '',
    },
  },
  // OrderNow
  {
    'fxg10p3j': {
      'ja': '進行中の注文',
      'en': '',
    },
    '3ff2z75e': {
      'ja': '完成した注文',
      'en': '',
    },
    '2dy7d7g5': {
      'ja': '予約注文管理',
      'en': '',
    },
    'kq7wxqif': {
      'ja': '新規',
      'en': '',
    },
    'twqvoalp': {
      'ja': '13:32',
      'en': '',
    },
    'i2l1hloo': {
      'ja': '完了',
      'en': '',
    },
    'uwdyejx7': {
      'ja': 'Home',
      'en': '',
    },
  },
  // OrderNowCopy
  {
    '72oqe6gx': {
      'ja': '進行中の注文',
      'en': '',
    },
    'cw5sbu4c': {
      'ja': '完成した注文',
      'en': '',
    },
    'zj9n6yy3': {
      'ja': '予約注文管理',
      'en': '',
    },
    'xo3yndkh': {
      'ja': '注文がありません',
      'en': '',
    },
    'pluzvep0': {
      'ja': 'Home',
      'en': '',
    },
  },
  // MenuSettingsCopy
  {
    '5ef73p0k': {
      'ja': '日本語',
      'en': '',
    },
    '7qou9c93': {
      'ja': '英語翻訳',
      'en': '',
    },
    'sfasyqij': {
      'ja': '中国語翻訳',
      'en': '',
    },
    '1sy2b6xr': {
      'ja': '韓国語翻訳',
      'en': '',
    },
    'z2pwn8af': {
      'ja': '商品名',
      'en': '',
    },
    'q95pakay': {
      'ja': 'カテゴリーを入力してください',
      'en': '',
    },
    '5apgq396': {
      'ja': '商品名を入力してください',
      'en': '',
    },
    'e89pasl1': {
      'ja': 'カテゴリー',
      'en': '',
    },
    '2hscnlck': {
      'ja': 'カテゴリーを入力してください',
      'en': '',
    },
    '2tgdywjs': {
      'ja': '価格（￥）',
      'en': '',
    },
    'udae53ba': {
      'ja': '価格を入力してください',
      'en': '',
    },
    'lz9a8zbj': {
      'ja': '価格を入力してください',
      'en': '',
    },
    'lp6kagq6': {
      'ja': '割引（￥）',
      'en': '',
    },
    'vzjpw3ax': {
      'ja': 'Label here...',
      'en': '',
    },
    'hixt35ww': {
      'ja': '商品名を入力してください',
      'en': '',
    },
    '7d7gbz9e': {
      'ja': '原価',
      'en': '',
    },
    'wn0lwqha': {
      'ja': 'Label here...',
      'en': '',
    },
    'mvvfg0ma': {
      'ja': '商品名を入力してください',
      'en': '',
    },
    'n5s9tzdr': {
      'ja': '消費税設定',
      'en': '',
    },
    'ne5tf66k': {
      'ja': '税込',
      'en': '',
    },
    'p9twldnb': {
      'ja': '税抜',
      'en': '',
    },
    'xyb1uuuh': {
      'ja': '税率',
      'en': '',
    },
    'd4e0knha': {
      'ja': '10%（標準）',
      'en': '',
    },
    'edwyxlm8': {
      'ja': 'メニュー表示',
      'en': '',
    },
    'q5fsp9ip': {
      'ja': '店内表示',
      'en': '',
    },
    'r7uarv8n': {
      'ja': '店内非表示',
      'en': '',
    },
    '6mp4enjy': {
      'ja': 'アルコール商品設定',
      'en': '',
    },
    'esh8z2xq': {
      'ja': 'アルコールあり',
      'en': '',
    },
    '5pzzqqz3': {
      'ja': 'アルコールなし',
      'en': '',
    },
    'vsm0qu10': {
      'ja': 'オプション',
      'en': '',
    },
    'f2sjkrac': {
      'ja': '＋オプションを追加',
      'en': '',
    },
    'mhvramkg': {
      'ja': '画像',
      'en': '',
    },
    '9yx60i4l': {
      'ja': '商品説明',
      'en': '',
    },
    'rqgjvlx4': {
      'ja': '商品説明を入力してください（任意）',
      'en': '',
    },
    'gkrjwkfm': {
      'ja': '商品説明を入力してください（任意）',
      'en': '',
    },
    'jg5vus95': {
      'ja': '保存する',
      'en': '',
    },
    'qa37jhzn': {
      'ja': 'Home',
      'en': '',
    },
  },
  // menudetailsComponent
  {
    'xetmk4xe': {
      'ja': 'T1',
      'en': '',
    },
    'hbyd4w7h': {
      'ja': '生塩牛タン',
      'en': '',
    },
    'mox5g9ol': {
      'ja': '¥',
      'en': '',
    },
    'r5eq6atq': {
      'ja': '1,290',
      'en': '',
    },
    'nvcdc83v': {
      'ja': '1',
      'en': '',
    },
    '3my79n4m': {
      'ja': '合計',
      'en': '',
    },
    '19ywsn30': {
      'ja': '¥',
      'en': '',
    },
    'e6oxytgw': {
      'ja': '1,290',
      'en': '',
    },
    'jv6r8naw': {
      'ja': '追加注文',
      'en': '',
    },
    '2cgf1c45': {
      'ja': '次に進む',
      'en': '',
    },
  },
  // nothingInOrderComponentt
  {
    'qddbpkwe': {
      'ja': 'T1',
      'en': '',
    },
    'gj2i3vg6': {
      'ja': 'このテーブルはまだ注文していません\n「注文する」ボタンから注文を始めましょう',
      'en': '',
    },
    '5ki0jx59': {
      'ja': '注文する',
      'en': '',
    },
  },
  // PayComponent
  {
    'ylru3ekd': {
      'ja': '会計金額',
      'en': '',
    },
    '56za5pkw': {
      'ja': 'お預かり',
      'en': '',
    },
    '73j8przc': {
      'ja': '¥',
      'en': '',
    },
    '2a6e7ie5': {
      'ja': '',
      'en': '',
    },
    'cvsg22ym': {
      'ja': '現金',
      'en': '',
    },
    'te0fdjei': {
      'ja': 'Squareリーダー',
      'en': '',
    },
    'u6qnobit': {
      'ja': '¥',
      'en': '',
    },
    '9ytnyzo4': {
      'ja': '99999',
      'en': '',
    },
    '0vdap8zs': {
      'ja': '10,000',
      'en': '',
    },
    'osebef0x': {
      'ja': '2,000',
      'en': '',
    },
    'bvufnxt2': {
      'ja': '残額',
      'en': '',
    },
    'tpggf9of': {
      'ja': '7',
      'en': '',
    },
    'yewmw142': {
      'ja': '8',
      'en': '',
    },
    '1g43mee0': {
      'ja': '9',
      'en': '',
    },
    'm9qjch5x': {
      'ja': '4',
      'en': '',
    },
    'tkwm3q08': {
      'ja': '5',
      'en': '',
    },
    '9s5jq3xo': {
      'ja': '6',
      'en': '',
    },
    '9f2i4kle': {
      'ja': '1',
      'en': '',
    },
    'vkbhuz97': {
      'ja': '2',
      'en': '',
    },
    'ydqm4ur8': {
      'ja': '3',
      'en': '',
    },
    'tgr4mdbn': {
      'ja': '00',
      'en': '',
    },
    'rmjdskcf': {
      'ja': '0',
      'en': '',
    },
    'wlsj9otb': {
      'ja': 'おつり',
      'en': '',
    },
    'eux1j2l9': {
      'ja': '¥',
      'en': '',
    },
    'uin7u9g2': {
      'ja': '0',
      'en': '',
    },
    'ifkk8ctp': {
      'ja': '一部会計',
      'en': '',
    },
    'jbg21pds': {
      'ja': '会計する',
      'en': '',
    },
  },
  // otsuri
  {
    'nxc5d3j7': {
      'ja': '現金決済',
      'en': '',
    },
    'yp7o9mq6': {
      'ja': 'test',
      'en': '',
    },
    'yzeyhclj': {
      'ja': 'おつり',
      'en': '',
    },
    'hdqynjyh': {
      'ja': '¥',
      'en': '',
    },
    'k7cfg1o5': {
      'ja': '0',
      'en': '',
    },
    'gcjebp68': {
      'ja': 'お預かり¥',
      'en': '',
    },
    '6h1qilqu': {
      'ja': '1,800 ',
      'en': '',
    },
    '055risjm': {
      'ja': ' - 会計金額¥',
      'en': '',
    },
    'rd6kzetc': {
      'ja': '1,880',
      'en': '',
    },
    'bdmuya5y': {
      'ja': 'レシート再印刷',
      'en': '',
    },
    'fl8hdqj2': {
      'ja': '領収書印刷',
      'en': '',
    },
    'zw565q6b': {
      'ja': '注文管理に戻る',
      'en': '',
    },
    '8uwrftpg': {
      'ja': '完了する',
      'en': '',
    },
  },
  // NumbersComponent
  {
    'uqtsdcco': {
      'ja': '客数入力',
      'en': '',
    },
    'p8vvtdb0': {
      'ja': '2',
      'en': '',
    },
    '59wgdovy': {
      'ja': '0',
      'en': '',
    },
    'x2w7dmp0': {
      'ja': '1',
      'en': '',
    },
    'xl7xqmpu': {
      'ja': '2',
      'en': '',
    },
    'v4rep2n1': {
      'ja': '3',
      'en': '',
    },
    'nrmslk2m': {
      'ja': '4',
      'en': '',
    },
    'gckn044h': {
      'ja': '5',
      'en': '',
    },
    '3wpzn27j': {
      'ja': '6',
      'en': '',
    },
    'br5i8vcw': {
      'ja': '7',
      'en': '',
    },
    'bx6514pj': {
      'ja': '8',
      'en': '',
    },
    '9rfzrkuz': {
      'ja': '9',
      'en': '',
    },
    'ov6sksax': {
      'ja': '10',
      'en': '',
    },
    '7ed2vue8': {
      'ja': '11',
      'en': '',
    },
    'ovc7z8qc': {
      'ja': 'キャンセル',
      'en': '',
    },
    'vulr5lgl': {
      'ja': '確認する',
      'en': '',
    },
  },
  // CheckComponent
  {
    '5kyc6v7x': {
      'ja': '10000円札',
      'en': '',
    },
    'ni0j3uhu': {
      'ja': '枚',
      'en': '',
    },
    'm32r8c6j': {
      'ja': '¥',
      'en': '',
    },
    'i4van0t2': {
      'ja': '0',
      'en': '',
    },
    'lspbmhjs': {
      'ja': '5000円札',
      'en': '',
    },
    '4wd14rnq': {
      'ja': '枚',
      'en': '',
    },
    '9eep02ie': {
      'ja': '¥',
      'en': '',
    },
    'bya0vpxp': {
      'ja': '0',
      'en': '',
    },
    '17x6chv4': {
      'ja': '2000円札',
      'en': '',
    },
    '9p7jz2yk': {
      'ja': '枚',
      'en': '',
    },
    'niqhrgco': {
      'ja': '¥',
      'en': '',
    },
    'orhiob20': {
      'ja': '0',
      'en': '',
    },
    '6h96327h': {
      'ja': '1000円札',
      'en': '',
    },
    '3w2aj45s': {
      'ja': '枚',
      'en': '',
    },
    'q7spl2td': {
      'ja': '¥',
      'en': '',
    },
    'uog6fevh': {
      'ja': '0',
      'en': '',
    },
    '1olqcc7s': {
      'ja': '500円コイン',
      'en': '',
    },
    '8yrvex6d': {
      'ja': '枚',
      'en': '',
    },
    '1664azlw': {
      'ja': '¥',
      'en': '',
    },
    'zr0uebjl': {
      'ja': '0',
      'en': '',
    },
    'ulvdry2f': {
      'ja': '100円コイン',
      'en': '',
    },
    'qvqqx5ju': {
      'ja': '枚',
      'en': '',
    },
    'oedayvg3': {
      'ja': '¥',
      'en': '',
    },
    'd82jcklw': {
      'ja': '0',
      'en': '',
    },
    'hdbcqp6e': {
      'ja': '50円コイン',
      'en': '',
    },
    'x9fcfk51': {
      'ja': '枚',
      'en': '',
    },
    'b64vii75': {
      'ja': '¥',
      'en': '',
    },
    'yeykkwhf': {
      'ja': '0',
      'en': '',
    },
    'v7biscpt': {
      'ja': '10円コイン',
      'en': '',
    },
    'ifxb6amw': {
      'ja': '枚',
      'en': '',
    },
    'fabo16im': {
      'ja': '¥',
      'en': '',
    },
    'ao5466bo': {
      'ja': '0',
      'en': '',
    },
    '6uiiaila': {
      'ja': '5円コイン',
      'en': '',
    },
    'lfhj7hby': {
      'ja': '枚',
      'en': '',
    },
    'p23mu3iq': {
      'ja': '¥',
      'en': '',
    },
    '7sjcpunj': {
      'ja': '0',
      'en': '',
    },
    '2y1z6ctc': {
      'ja': '1円コイン',
      'en': '',
    },
    '8n7eyr4n': {
      'ja': '枚',
      'en': '',
    },
    'ix1ne073': {
      'ja': '¥',
      'en': '',
    },
    'bu4d55px': {
      'ja': '0',
      'en': '',
    },
    'muk6babu': {
      'ja': '予想残高',
      'en': '',
    },
    'rbbkggud': {
      'ja': '¥',
      'en': '',
    },
    'v2u833is': {
      'ja': '0',
      'en': '',
    },
    '39br79af': {
      'ja': '点検',
      'en': '',
    },
    'p4v2rwqf': {
      'ja': '¥',
      'en': '',
    },
    'cowrwlnc': {
      'ja': '0',
      'en': '',
    },
    'sdk1au2l': {
      'ja': '現金残高（点検）',
      'en': '',
    },
    'g1hcjhdg': {
      'ja': '過不足金',
      'en': '',
    },
    'fhev3j13': {
      'ja': '¥',
      'en': '',
    },
    'tyo43imz': {
      'ja': '0',
      'en': '',
    },
    '1d3m9fw6': {
      'ja': 'OK',
      'en': '',
    },
  },
  // reservesComponent
  {
    'gft3oiqa': {
      'ja': '準備金',
      'en': '',
    },
    '75213q5l': {
      'ja': '準備金',
      'en': '',
    },
    '7g76gdxa': {
      'ja': '¥',
      'en': '',
    },
    '1s8udwr4': {
      'ja': '0',
      'en': '',
    },
    '2ij6u26a': {
      'ja': 'キャンセル',
      'en': '',
    },
    'o5b3taxd': {
      'ja': 'OK',
      'en': '',
    },
  },
  // AdjustmentComponent
  {
    '15inncs6': {
      'ja': '差額補正',
      'en': '',
    },
    'cra238u8': {
      'ja': '過不足金',
      'en': '',
    },
    'j6axxzq2': {
      'ja': '¥',
      'en': '',
    },
    '7x24odif': {
      'ja': '0',
      'en': '',
    },
    'owg3e6nm': {
      'ja': '補正額',
      'en': '',
    },
    '33subjlu': {
      'ja': '¥',
      'en': '',
    },
    '7551kwvp': {
      'ja': '0',
      'en': '',
    },
    '6mie55ww': {
      'ja': '差額補正',
      'en': '',
    },
    '1hbwufb7': {
      'ja': '¥',
      'en': '',
    },
    '9cf2osq4': {
      'ja': '0',
      'en': '',
    },
    '2lkjc69g': {
      'ja': '補正を行わない',
      'en': '',
    },
    '0ai02y5a': {
      'ja': '差額',
      'en': '',
    },
    '7oecmav8': {
      'ja': '¥',
      'en': '',
    },
    'xsph7ppf': {
      'ja': '0',
      'en': '',
    },
    '78mr3dr7': {
      'ja': 'OK',
      'en': '',
    },
  },
  // reciveComponent
  {
    'cfbzkcf4': {
      'ja': '出金',
      'en': '',
    },
    'vke09jur': {
      'ja': '入金',
      'en': '',
    },
    'ufvqo7p3': {
      'ja': '予算残高',
      'en': '',
    },
    'l5kwfw26': {
      'ja': '¥',
      'en': '',
    },
    'fx7tdyrl': {
      'ja': '1,000',
      'en': '',
    },
    'nr7bgu5q': {
      'ja': '入金額',
      'en': '',
    },
    '2u0aa5tk': {
      'ja': '¥',
      'en': '',
    },
    'vhe07cof': {
      'ja': '0',
      'en': '',
    },
    'kcxmehnv': {
      'ja': '入金額',
      'en': '',
    },
    'fxbw301o': {
      'ja': '¥',
      'en': '',
    },
    '1xffktv2': {
      'ja': '0',
      'en': '',
    },
    'gcyiicvu': {
      'ja': '入金後現金残高',
      'en': '',
    },
    'p2gf16py': {
      'ja': '¥',
      'en': '',
    },
    'a7m59gpz': {
      'ja': '1,000',
      'en': '',
    },
    'm7q19ce0': {
      'ja': 'OK',
      'en': '',
    },
  },
  // DivideComponent
  {
    '23nazvhu': {
      'ja': '割り勘',
      'en': '',
    },
    's4u9dql3': {
      'ja': '合計金額',
      'en': '',
    },
    'jelfs8ll': {
      'ja': '¥',
      'en': '',
    },
    '029ljabb': {
      'ja': '0',
      'en': '',
    },
    '46g9clj1': {
      'ja': '人数',
      'en': '',
    },
    'yfoct4ij': {
      'ja': '0',
      'en': '',
    },
    'kiimfen3': {
      'ja': '2',
      'en': '',
    },
    'kmgnungg': {
      'ja': '3',
      'en': '',
    },
    '1ocfxk5e': {
      'ja': '4',
      'en': '',
    },
    'gwle7v62': {
      'ja': '5',
      'en': '',
    },
    'gxx1bhqy': {
      'ja': '6',
      'en': '',
    },
    'qk1gu7h7': {
      'ja': '7',
      'en': '',
    },
    'vujc8olm': {
      'ja': '8',
      'en': '',
    },
    '3uxr4vwz': {
      'ja': '9',
      'en': '',
    },
    'k42sf9h9': {
      'ja': '10',
      'en': '',
    },
    'wr1ka55v': {
      'ja': '11',
      'en': '',
    },
    'r75iw3ti': {
      'ja': '12',
      'en': '',
    },
    'qgi4e04q': {
      'ja': '13',
      'en': '',
    },
    'r6bzqw3z': {
      'ja': '通常会計に戻る',
      'en': '',
    },
    '3kv1ffd9': {
      'ja': '会計する',
      'en': '',
    },
  },
  // CustomMenuComponent
  {
    'j8lk2hxs': {
      'ja': 'カスタム商品の追加',
      'en': '',
    },
    'c1s0qb40': {
      'ja': '商品価格',
      'en': '',
    },
    'ftpabpbo': {
      'ja': '数量',
      'en': '',
    },
    'o24kdwt9': {
      'ja': '消費税率',
      'en': '',
    },
    'qhwcp9sj': {
      'ja': '1000',
      'en': '',
    },
    '79vetuej': {
      'ja': '2',
      'en': '',
    },
    'ykx32tf2': {
      'ja': '標準税率',
      'en': '',
    },
    'ls8hddxq': {
      'ja': 'キャンセル',
      'en': '',
    },
    'smmillk9': {
      'ja': '追加する',
      'en': '',
    },
  },
  // SeisanComponent
  {
    '5og9khxy': {
      'ja': '清算（最終入出金）',
      'en': '',
    },
    't0hm34tj': {
      'ja': '現金残高',
      'en': '',
    },
    'lrc96lad': {
      'ja': '¥',
      'en': '',
    },
    'z8fwr63v': {
      'ja': '0',
      'en': '',
    },
    'p4nnnuo1': {
      'ja': '残高変更額',
      'en': '',
    },
    '1xk0uvcg': {
      'ja': '¥',
      'en': '',
    },
    '61p5ilqx': {
      'ja': '0',
      'en': '',
    },
    'mqe99ee6': {
      'ja': '出金額',
      'en': '',
    },
    'keqbriil': {
      'ja': '¥',
      'en': '',
    },
    'qka903oi': {
      'ja': '0',
      'en': '',
    },
    'gqyl6zpi': {
      'ja': '入金額',
      'en': '',
    },
    'pvugchn5': {
      'ja': '¥',
      'en': '',
    },
    'qdo0n9hy': {
      'ja': '0',
      'en': '',
    },
    'rqat2gyt': {
      'ja': '未設定',
      'en': '',
    },
    'trilgrus': {
      'ja': '現金繰越額',
      'en': '',
    },
    '0cc18bm0': {
      'ja': '¥',
      'en': '',
    },
    'dulpfg48': {
      'ja': '1,000',
      'en': '',
    },
    'xqpq2qi8': {
      'ja': 'OK',
      'en': '',
    },
  },
  // addmoreComponent
  {
    '97enag0t': {
      'ja': 'T1',
      'en': '',
    },
    'fhbs3pdd': {
      'ja': '生塩牛タン',
      'en': '',
    },
    'ahgnyuvz': {
      'ja': '¥',
      'en': '',
    },
    '8ikeziel': {
      'ja': '1,290',
      'en': '',
    },
    'x6xx2y9m': {
      'ja': '合計：',
      'en': '',
    },
    'kk0i9n7w': {
      'ja': '¥',
      'en': '',
    },
    'vnujokdt': {
      'ja': '0',
      'en': '',
    },
    'dgaz7l96': {
      'ja': '注文を確定',
      'en': '',
    },
  },
  // akadennpyouComponent
  {
    'khi65hrt': {
      'ja': '赤伝票',
      'en': '',
    },
    '7649o66v': {
      'ja': 'test',
      'en': '',
    },
    'b31wg7ax': {
      'ja': 'の会計を赤伝票にしますか',
      'en': '',
    },
    'av6ugukc': {
      'ja': '理由を入力してください（任意）',
      'en': '',
    },
    'pcemipoc': {
      'ja': 'キャンセル',
      'en': '',
    },
    '4ovpqf7s': {
      'ja': '確定する',
      'en': '',
    },
  },
  // Waribiki
  {
    'am6admwf': {
      'ja': '割引',
      'en': '',
    },
    'b72033xl': {
      'ja': '-',
      'en': '',
    },
    'hzy2rsyn': {
      'ja': '¥',
      'en': '',
    },
    'f32izor6': {
      'ja': '1000',
      'en': '',
    },
    'n8hqxk0y': {
      'ja': '-¥',
      'en': '',
    },
    'lxjrbksz': {
      'ja': '-%',
      'en': '',
    },
    'r896xozl': {
      'ja': '+￥',
      'en': '',
    },
    '5w1a44hp': {
      'ja': '+%',
      'en': '',
    },
    'hojgnwi6': {
      'ja': '7',
      'en': '',
    },
    'aci96ilu': {
      'ja': '8',
      'en': '',
    },
    '5u7eyj6a': {
      'ja': '9',
      'en': '',
    },
    'ydoxdlu6': {
      'ja': '4',
      'en': '',
    },
    '62imapi4': {
      'ja': '5',
      'en': '',
    },
    '4cb996q5': {
      'ja': '6',
      'en': '',
    },
    '45a9rp6d': {
      'ja': '1',
      'en': '',
    },
    'y8kjix04': {
      'ja': '2',
      'en': '',
    },
    '5eau0h91': {
      'ja': '3',
      'en': '',
    },
    '5v6c24zi': {
      'ja': '00',
      'en': '',
    },
    'h0bzs21y': {
      'ja': '0',
      'en': '',
    },
    'scwj58da': {
      'ja': 'キャンセル',
      'en': '',
    },
    'zhuiyj7w': {
      'ja': '確定',
      'en': '',
    },
  },
  // PICComponent
  {
    'eajf308m': {
      'ja': '担当者',
      'en': '',
    },
    'ar8m8q2z': {
      'ja': '未設定',
      'en': '',
    },
    't582q5uw': {
      'ja': '＋追加する',
      'en': '',
    },
  },
  // PICRegistrationComponent
  {
    '6osmj6w3': {
      'ja': '担当者を登録',
      'en': '',
    },
    'iue7m51d': {
      'ja': '担当者',
      'en': '',
    },
    'c98sozfm': {
      'ja': '担当者番号',
      'en': '',
    },
    'jnly294k': {
      'ja': '保存する',
      'en': '',
    },
  },
  // DrinkASMuchCOmponent
  {
    'ipaglkjq': {
      'ja': '飲み放題',
      'en': '',
    },
    'st7onf6w': {
      'ja': '2',
      'en': '',
    },
    'rn491492': {
      'ja': '名様注文済み',
      'en': '',
    },
    'bo9b7ais': {
      'ja': 'あと',
      'en': '',
    },
    '9kq9aywe': {
      'ja': '17',
      'en': '',
    },
    '77lzjf9w': {
      'ja': '分',
      'en': '',
    },
    '7xt5fzv3': {
      'ja': '時間を延長',
      'en': '',
    },
    'b4b9136n': {
      'ja': '1',
      'en': '',
    },
    'jignbdal': {
      'ja': '2',
      'en': '',
    },
    'himu89c5': {
      'ja': '3',
      'en': '',
    },
    'jik5r4mf': {
      'ja': '4',
      'en': '',
    },
    '6eabja9j': {
      'ja': '5',
      'en': '',
    },
    'dqcmri5h': {
      'ja': '6',
      'en': '',
    },
    'dwqo7ej1': {
      'ja': '7',
      'en': '',
    },
    '32gi2jae': {
      'ja': '8',
      'en': '',
    },
    'g8krnmo1': {
      'ja': '9',
      'en': '',
    },
    '4ba95rz0': {
      'ja': '10',
      'en': '',
    },
    'gms30xow': {
      'ja': '手入力',
      'en': '',
    },
    'q7fo63do': {
      'ja': '¥',
      'en': '',
    },
    'k8awdmlc': {
      'ja': '1,000',
      'en': '',
    },
    'x6cwziw6': {
      'ja': '/1名（税込）',
      'en': '',
    },
    '9onp544s': {
      'ja': '人数変更',
      'en': '',
    },
  },
  // OptionCOmponent
  {
    'dhujul8z': {
      'ja': 'オプションを追加',
      'en': '',
    },
    'y433to9x': {
      'ja': 'オプション名',
      'en': '',
    },
    'mu0z780l': {
      'ja': '入力してください（例：サイズ）',
      'en': '',
    },
    '7606abk7': {
      'ja': 'ラジオボタン',
      'en': '',
    },
    'e5ws98x8': {
      'ja': '最大１項目',
      'en': '',
    },
    'sphp6xp8': {
      'ja': '必須',
      'en': '',
    },
    '75nretaz': {
      'ja': '項目1',
      'en': '',
    },
    'h1b2hbr5': {
      'ja': '項目名',
      'en': '',
    },
    'modjlj6v': {
      'ja': '例：Lサイズ、大盛り、肉追加',
      'en': '',
    },
    '226pgt0t': {
      'ja': '削除',
      'en': '',
    },
    'x9rlgf7d': {
      'ja': '追加料金',
      'en': '',
    },
    'tqnvrly9': {
      'ja': '0',
      'en': '',
    },
    'dxzxwf3o': {
      'ja': '項目2',
      'en': '',
    },
    'bq0i6e0s': {
      'ja': '項目名',
      'en': '',
    },
    '6cwv2hcl': {
      'ja': '例：Lサイズ、大盛り、肉追加',
      'en': '',
    },
    'blia9e2x': {
      'ja': '削除',
      'en': '',
    },
    'cflub354': {
      'ja': '追加料金',
      'en': '',
    },
    'zzdl9ey1': {
      'ja': '0',
      'en': '',
    },
    'rmr5772y': {
      'ja': '項目を追加',
      'en': '',
    },
    '1sr1hiwl': {
      'ja': '保存する',
      'en': '',
    },
  },
  // DrinkASMuchCOmponentCopy2
  {
    'wrs0ui97': {
      'ja': '飲み放題',
      'en': '',
    },
    'ql87a1s4': {
      'ja': '2',
      'en': '',
    },
    'a3q9i717': {
      'ja': '名様注文済み',
      'en': '',
    },
    '2arlyw12': {
      'ja': 'あと',
      'en': '',
    },
    '31t5j84u': {
      'ja': '17',
      'en': '',
    },
    '94lowk3b': {
      'ja': '分',
      'en': '',
    },
    'gqbq6n57': {
      'ja': '人数変更',
      'en': '',
    },
    'p9djrd6g': {
      'ja': '10分',
      'en': '',
    },
    'o0wow0q1': {
      'ja': '20分',
      'en': '',
    },
    '97ii59cd': {
      'ja': '30分',
      'en': '',
    },
    'g1sswsqd': {
      'ja': '40分',
      'en': '',
    },
    'ol3ro9ms': {
      'ja': '50分',
      'en': '',
    },
    '6aolzfmx': {
      'ja': '60分',
      'en': '',
    },
    'v09y2092': {
      'ja': '70分',
      'en': '',
    },
    'h8qubuli': {
      'ja': '80分',
      'en': '',
    },
    '189w0qcn': {
      'ja': '90分',
      'en': '',
    },
    'n2nevi6v': {
      'ja': '-10分',
      'en': '',
    },
    'dmmm0s7y': {
      'ja': '手入力',
      'en': '',
    },
    '0ced1y1t': {
      'ja': '20',
      'en': '',
    },
    'zg66t27i': {
      'ja': '分延長',
      'en': '',
    },
    '6dapjb2b': {
      'ja': '時間を延長',
      'en': '',
    },
  },
  // WithdrawalComponent
  {
    '9hn7df0w': {
      'ja': '出金',
      'en': '',
    },
    'fv6dwqwl': {
      'ja': '入金',
      'en': '',
    },
    'zdhu5xw5': {
      'ja': '予算残高',
      'en': '',
    },
    'ysvd4y2t': {
      'ja': '¥',
      'en': '',
    },
    'm77iq4ki': {
      'ja': '1,000',
      'en': '',
    },
    'ige2i7d9': {
      'ja': '出金額',
      'en': '',
    },
    '5lh0psax': {
      'ja': '¥',
      'en': '',
    },
    's218vi4c': {
      'ja': '0',
      'en': '',
    },
    'zec7gg6x': {
      'ja': '出金額',
      'en': '',
    },
    'zxa4yiht': {
      'ja': '¥',
      'en': '',
    },
    'v269r5e0': {
      'ja': '0',
      'en': '',
    },
    'kme6iw8w': {
      'ja': '出金後現金残高',
      'en': '',
    },
    'jq1ynxsk': {
      'ja': '¥',
      'en': '',
    },
    'x5be9ltg': {
      'ja': '1,000',
      'en': '',
    },
    '24nk21nl': {
      'ja': 'OK',
      'en': '',
    },
  },
  // CategoryCOmponent
  {
    'bz94yf51': {
      'ja': 'カテゴリを追加',
      'en': '',
    },
    'nlg85x1g': {
      'ja': 'カテゴリー名',
      'en': '',
    },
    'oo0xxjdr': {
      'ja': '入力してください（例：サイズ）',
      'en': '',
    },
    'z1kz24s1': {
      'ja': 'キャンセル',
      'en': '',
    },
    'w1vto905': {
      'ja': '保存する',
      'en': '',
    },
  },
  // additemcomponent
  {
    '29kosaec': {
      'ja': '商品名',
      'en': '',
    },
    'uaq8o02j': {
      'ja': '公開',
      'en': '',
    },
    '0o4svw0z': {
      'ja': '¥',
      'en': '',
    },
    'ayx789qw': {
      'ja': '100',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'xvfax6dj': {
      'ja': '',
      'en': '',
    },
    '9xil0u1e': {
      'ja': '',
      'en': '',
    },
    '66uilcay': {
      'ja': '',
      'en': '',
    },
    '04ahxttj': {
      'ja': '',
      'en': '',
    },
    'snffo1sg': {
      'ja': '',
      'en': '',
    },
    'zbaxec8f': {
      'ja': '',
      'en': '',
    },
    'a5shvsc0': {
      'ja': '',
      'en': '',
    },
    'i8deh5iu': {
      'ja': '',
      'en': '',
    },
    'ohn599nt': {
      'ja': '',
      'en': '',
    },
    'chxsp03j': {
      'ja': '',
      'en': '',
    },
    'oaxpbhql': {
      'ja': '',
      'en': '',
    },
    'ua9idokb': {
      'ja': '',
      'en': '',
    },
    'furgfzzp': {
      'ja': '',
      'en': '',
    },
    'uuhkkawk': {
      'ja': '',
      'en': '',
    },
    'k9egxr2r': {
      'ja': '',
      'en': '',
    },
    'u24i5pd9': {
      'ja': '',
      'en': '',
    },
    's3umysmm': {
      'ja': '',
      'en': '',
    },
    '0ka185s6': {
      'ja': '',
      'en': '',
    },
    'qlj5czx9': {
      'ja': '',
      'en': '',
    },
    'o7qiqmaf': {
      'ja': '',
      'en': '',
    },
    'sxhg55f5': {
      'ja': '',
      'en': '',
    },
    'g6dzh7kn': {
      'ja': '',
      'en': '',
    },
    '7vm2sp19': {
      'ja': '',
      'en': '',
    },
    '8rmpophx': {
      'ja': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
