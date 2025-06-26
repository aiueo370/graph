void setup()
{
  size(400, 400); // キャンバスサイズ
  String simei[] = {"椎野新", "今宮健太", "柳田悠岐", "長谷川勇也", "甲斐拓也"};//氏名
  int sincho[] = {196, 172, 188, 180, 170}; //身長
  color iro[] = {#ff0000, #ffa500, #ffff00, #008000, #0000ff};//グラフの描写に使用する色色
  drawPiechart(simei, sincho, iro);//円グラフの描写のメソッド
}

void drawPiechart(String s[], int d[], color c[])//円グラフの描写
{
  int sumheight = 0;//身長の合計の初期化

  for (int i = 0; i < d.length; i++)//身長を合計
  {
    sumheight += d[i];//各データを足す
  }

  float untilcut = 0;//今まで扱ったデータの割合の合計
  float nowcut = 0;//現在扱っているデータの割合
  float cut[] = new float[d.length];//各データの割合を保存する

  for (int i = 0; i < d.length; i++)//各データを描写
  { 
    nowcut = (float)d[i] / sumheight;//割合の計算
    fill(c[i]);//色を指定
    arc(200, 150, 200, 200, untilcut*TWO_PI, (nowcut+untilcut)*TWO_PI);//円グラフの描写
    untilcut += nowcut;//描写の初期位置の保存
    cut[i] = nowcut * 100;//単位をパーセントにして割合を保存
  }

  for (int i = 0; i < d.length; i++)//データの詳細
  {
    fill(c[i]);//色の指定
    rect(100, 300 + i * 20, 10, 10);//自分の色を描写
    fill(#000000);//黒色を描写
    text(s[i], 120, (300 + i * 20) + 10);//自分の名前を描写
    text(str(d[i]) + "cm   " + str(cut[i]) + "%", 200, (300 + i * 20) + 10);//身長、割合を描写
  }

  fill(#FFFFFF);//グラフの中央を描写
  ellipse(200, 150, 100, 100);//白い円

  fill(#000000);//黒で描写
  text("合計", 190, 140);//合計の身長を描写
  text(str(sumheight) + " cm", 185, 160);
}
