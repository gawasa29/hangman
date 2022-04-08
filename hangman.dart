import 'dart:io';

void main(List<String> arguments) {
  exitCode = 0;
  hangman(arguments[0]);
} 


void hangman(word) {
  int wrong = 0; //プレイヤーが何回間違えたか
  List stages = [
    "",
    "---------",
    "|   |",
    "|   0",
    "|  /|/",
    "|   //",
    "|",
    "|",
  ];
  dynamic rletters = word.split('');
  dynamic board = [];
  for (var i = 0; i < word.length; i++) {
    board.add("_");
  }

  print("ハングマンへようこそ");

  //ここからゲームの具体的な処理
  while (true) {
    print("一文字予測してね！");
    dynamic char = stdin.readLineSync();
//入力した文字列が入ってるかの確認
    if (rletters.contains(char)) {
      print("正解！！文字があるよ");
      int cind = rletters.indexOf(char);
      board[cind] = char;
      print(board);
    } else {
      print("失敗！！文字がないよ");
      wrong += 1;
    }
    stages.removeAt(0); //stagesの値を前から一個削除
    print(stages.join("\n")); //stagesを見やすいように改行を入れる
    //boardから"_"がなくなったら勝ちの処理実行
    if (!board.contains("_")) {
      print("あなたの勝ち!正解は${word}");
      exitCode = 0;
      break;
    }
    //stagesの値がなくなったら負けの処理実行
    if (stages.isEmpty) {
      print("あなたの負け!正解は ${word}");
      exitCode = 1;
      break;
    }
  }
}
