# プラネット(Plants&Network)

## サイト概要
<img width="1440" alt="スクリーンショット 2020-09-26 12 39 04" src="https://user-images.githubusercontent.com/62271857/94329366-654f7d00-fff5-11ea-9774-0bf245fd55ef.png">
こちらは観葉植物専門のSNSです。<br>
『Planet』は、植物を意味する「Plants」と情報や人と人との繋がりを意味する「Network」を組み合わせた造語です。植物を通して世界中広く繋がりを持てるようにという思いを込めて命名しました。
また、単純なSNSとしてだけでなく、観葉植物に関する育て方やオススメの植物の紹介を記事にして投稿されるので、情報サイトとしての機能も持たせています。自身のお気に入りの植物の写真を投稿・共有したり、育て方を調べて日々のプランツライフを充実したものにできる手助けとなれれば幸いです。<br>
現在制作中ですが、情報記事から購入に繋げるため、観葉植物専門ECサイト制作も進行中です。
サイトはこちらからご覧ください。(http://plants-and-network.work/)

### テーマを選んだ理由
以前勤めていた観葉植物専門店にコロナの影響で客は減ったかと聞いてみたところ、特別減ってはいないし、むしろ外出自粛と言われている中でもいらっしゃるお客様はわりと多いと聞きました。<br>
その背景として、コロナの影響でリモートワークになったり外出を控えることで在宅時間が増え、住環境をこの機会に整えようと思って観葉植物を購入、もしくは購入を検討している人が増えていると予想しました。<br>
そこで、初心者の方に多い疑問の「育てやすい植物は何か」、「管理する上で気をつけるべき点」「枯れが出たときの対処法」などをまとめた情報が知れて、交流の場にもなるサイトを作ろうと思いました。

### ターゲットユーザ
20代〜50代くらいまで幅広い世代を想定

## 一部サイトのデモ動画
### JSで複数枚画像の表示切り替えによるメインビジュアルのアニメーション化。
![planet-demo (1)](https://user-images.githubusercontent.com/62271857/94343316-387d8300-0052-11eb-8374-304ce642ed6d.gif)<br>
画面右側のフォントなどのアニメーションはAnimate.cssによる実装。

### Bootstrapのアコーディオン機能でコメントを短縮表示
![Videotogif](https://user-images.githubusercontent.com/62271857/94346477-d9c30400-0067-11eb-9403-5872742323e7.gif)

## 設計書

### 機能一覧
https://docs.google.com/spreadsheets/d/16cVDGZIYfwsBDeq0NrInzjGLLrxm8EJHFj93byK56Ds/edit?usp=sharing

### AWS構想図
![AWS構想図](https://user-images.githubusercontent.com/62271857/94328693-74333100-ffef-11ea-8fcc-5d389bf53ebc.jpg)

## 開発環境
- OSなど<br>
Linux(CentOS-7 CORE),Nginx,Puma

- 使用言語<br>
HTML,CSS,JavaScript,Ruby(2.5.7),MySQL(5.5.62)

- フレームワーク<br>
Ruby on Rails(5.2.4.3), Bootstrap4

- Railsライブラリ<br>
summernote, faker, devise, kaminari, refile, pry-byebug

- JSライブラリ<br>
JQuery

- インフラ<br>
AWS(EC2, RDS, EIP,VPC,Route53)

- テストフレームワーク<br>
RSpec

- その他ツール<br>
Vagrant,VirtualBox,Slack,Github,DesignEvo,Capistrano3,Animate.css
※メインビジュアル用イラストの作成にprocriate(ipadアプリケーション)
