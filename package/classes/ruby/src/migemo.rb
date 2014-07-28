#! jruby -Ku
#coding : utf-8

@@map = {
  'a' => 'ア', 'i' => 'イ', 'u' => 'ウ', 'e' => 'エ', 'o' => 'オ',
  'xa' => 'ァ', 'xi' => 'ィ', 'xu' => 'ゥ', 'xe' => 'ェ', 'xo' => 'ォ',
  'ka' => 'カ', 'ki' => 'キ', 'ku' => 'ク', 'ke' => 'ケ', 'ko' => 'コ',
  'ga' => 'ガ', 'gi' => 'ギ', 'gu' => 'グ', 'ge' => 'ゲ', 'go' => 'ゴ',
  'sa' => 'サ', 'si' => 'シ', 'su' => 'ス', 'se' => 'セ', 'so' => 'ソ',
  'za' => 'ザ', 'ji' => 'ジ', 'zu' => 'ズ', 'ze' => 'ゼ', 'zo' => 'ゾ',
  'ta' => 'タ', 'ti' => 'チ', 'chi' => 'チ', 'tu' => 'ツ', 'te' => 'テ', 'to' => 'ト',
  'da' => 'ダ', 'di' => 'ヂ', 'du' => 'ヅ', 'de' => 'デ', 'do' => 'ド',
  'xtu' => 'ッ',
  'na' => 'ナ', 'ni' => 'ニ', 'nu' => 'ヌ', 'ne' => 'ネ', 'no' => 'ノ',
  'ha' => 'ハ', 'hi' => 'ヒ', 'fu' => 'フ', 'hu' => 'フ', 'he' => 'ヘ', 'ho' => 'ホ',
  'ba' => 'バ', 'bi' => 'ビ', 'bu' => 'ブ', 'be' => 'ベ', 'bo' => 'ボ',
  'pa' => 'パ', 'pi' => 'ピ', 'pu' => 'プ', 'pe' => 'ペ', 'po' => 'ポ',
  'ma' => 'マ', 'mi' => 'ミ', 'mu' => 'ム', 'me' => 'メ', 'mo' => 'モ',
  'ya' => 'ヤ', 'yu' => 'ユ', 'yo' => 'ヨ',
  'xya' => 'ャ', 'xyu' => 'ュ', 'xyo' => 'ョ',
  'ra' => 'ラ', 'ri' => 'リ', 'ru' => 'ル', 're' => 'レ', 'ro' => 'ロ',
  'wa' => 'ワ', 'wo' => 'ヲ', 'nn' => 'ン',
  'kya' => 'キャ', 'kyu' => 'キュ', 'kyo' => 'キョ',
  'gya' => 'ギャ', 'gyu' => 'ギュ', 'gyo' => 'ギョ',
  'sya' => 'シャ', 'syu' => 'シュ', 'syo' => 'ショ',
  'sha' => 'シャ', 'shu' => 'シュ', 'sho' => 'ショ',
  'ja' => 'ジャ', 'ju' => 'ジュ', 'je' => 'ジェ', 'jo' => 'ジョ',
  'jya' => 'ジャ', 'jyu' => 'ジュ', 'jye' => 'ジェ', 'jyo' => 'ジョ',
  'tya' => 'チャ', 'tyu' => 'チュ', 'tye' => 'チェ', 'tyo' => 'チョ',
  'cha' => 'チャ', 'chu' => 'チュ', 'che' => 'チェ', 'cho' => 'チョ',
  'nya' => 'ニャ', 'nyu' => 'ニュ', 'nye' => 'ニェ', 'nyo' => 'ニョ',
  'fa' => 'ファ', 'fi' => 'フィ', 'fe' => 'フェ', 'fo' => 'フォ',
  'hya' => 'ヒャ', 'hyu' => 'ヒュ', 'hye' => 'ヒェ', 'hyo' => 'ヒョ',
  'pya' => 'ピャ', 'pyu' => 'ピュ', 'pye' => 'ピェ', 'pyo' => 'ピョ',
  'bya' => 'ビャ', 'byu' => 'ビュ', 'bye' => 'ビェ', 'byo' => 'ビョ',
  'mya' => 'ミャ', 'myu' => 'ミュ', 'mye' => 'ミェ', 'myo' => 'ミョ',
  'rya' => 'リャ', 'ryu' => 'リュ', 'rye' => 'リェ', 'ryo' => 'リョ',
  '-' => 'ー'
}

def output(str, ret='')
  if small_tu?(str)
    ret += 'ッ'
    str = str[1..-1]
  end
  for i in 0..(str.length - 1)
    if @@map[str[0..i]]
      ret += @@map[str[0..i]] 
      return output(str[(i + 1)..-1], ret)
    end
  end
  return ret
end

def small_tu?(str)
  ret = false
  if str =~ /^(bb|cc|dd|ff|gg|hh|jj|kk|mm|pp|ss|tt|ww|yy|zz)/
    ret = true 
  end
  return ret
end