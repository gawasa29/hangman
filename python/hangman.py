def hangman(word):#引数wordはプレイヤーに当てて欲しい単語
    wrong = 0#プレイヤーが何回間違えたかを数える変数
    stages = ["",#文字列のリスト,pythonがこのリストの文字列を一行づつ出力すると、絵が完成。
              "_______      ",
              "|            ",
              "|      |     ",
              "|      0     ",
              "|     /|\    ",
              "|     / \    ",
              "|            "
              ]
    rletters = list(word)#引数wordをリスト化
    board = ["_"] * len(word)#文字列のリストでプレイヤーに見せるヒント。len 関数は引数に指定したオブジェクトの長さや要素の数を取得します。
    win = False#プレイヤーの勝敗
    print("ハングマンへようこそ!")
    while wrong < len(stages) - 1:#stagesの要素数から1を引いているのは
        print("\n")#ゲームの見栄えを良くするため空行を出力
        msg = "1文字を予想してね! "
        char = input(msg)
        if char in rletters:#if 特定の値 in リストなど:
        #Trueの時（含まれている時）に実行する処理
            cind = rletters.index(char)
            board[cind] = char
            rletters[cind] = '$'
        else:
        #Falseの時（含まれていない時）に実行する処理
            wrong += 1

        print(" ".join(board))
        e = wrong + 1
        print("\n".join(stages[0:e]))
        if "_" not in board:
            print("あなたの勝ち!")
            print(" ".join(board))
            win = True
            break
    if not win:#win変数がFalseの時に実行
        print("\n".join(stages[0:wrong+1]))
        print("あなたの負け!正解は {}.".format(word))

hangman("cat")