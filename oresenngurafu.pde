void setup()
{
  size(550, 400); // キャンバスサイズ
  String simei[] = {"椎野新", "今宮健太", "柳田悠岐", "長谷川勇也", "甲斐拓也"};
  int sincho[] = {196, 172, 188, 180, 170}; //身長
  drawLinegragh(simei, sincho);//折れ線グラフの描写
}

void drawLinegragh(String s[], int d[])//グラフ描写のメソッド
{
  int HMARGIN = 50;//上側の余白設定
  int WMARGIN = 50;//左側の余白設定
  int width = (d.length + 1) * 80; //グラフの幅
  int height = getMax(d) + 50;//グラフの高さ

  fill(#FFFFFF);//背景　白い四角
  rect(WMARGIN, HMARGIN, width, height);

fill(#000000);//以下黒で描写

  int x1 = 0, y1 = 0;//現在扱っているデータの座標の初期化
  int x2 = 0, y2 = 0;//前に扱ったデータの座標の初期化
 
  for (int i=0; i < d.length; i++)//点と線の描写
  {
    x1 = (i+1) * 80 + WMARGIN;//x座標を求める
    y1 =  HMARGIN + height - d[i];//y座標を求める

    ellipse(x1, y1, 5, 5);//点の描写
    text(str(d[i]), x1, y1 - 5);//数値の描写

    if (i != 0) {//描写する点に対し線は一本少ない
      line(x1, y1, x2, y2);//i今と前の座標でで線の描写
    }

    x2 = x1;//現在のx座標を前に扱ったものにする
    y2 = y1;//現在のy座標を前に扱ったものにする
  }

  drawHaxis(s, WMARGIN, HMARGIN + height);//縦軸のメモリを描写
  drawVaxis(WMARGIN, HMARGIN, height);//横軸のメモリを描写
}

void drawHaxis(String s[], int X0, int Y0)////縦軸のメモリを描写
{
  for (int i=0; i < s.length; i++)//すべてのデータを描写
  {
    text(s[i], (i + 1) * 80 + X0 - 20, Y0 + 30);//位置指定
  }
}

void drawVaxis(int W, int H, int h)//横軸のメモリを描写
{
  for (int i = 0; i <= h; i += 100){//100単位でメモリを設定
    text(str(i), W - 25, (H + h) - i);//位置指定
}
}

int getMax(int d[]) // 最大値を探す
{
  int max = d[0]; // 最初を候補にする。
  for (int i=1; i<d.length; i++) // 検索
  {
    if (d[i] > max) // 候補より大きい
    {
      max = d[i]; // 入れ替える。
    }
  }
  return(max); // 最大値を戻り値として返す。
}
