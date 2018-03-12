Laravel用Dockerfile 

PHPは最新版を入れています。今は7.2

[imageの作成]
`docker build -t laravel-php ./`

[コンテナの起動]
`docker run -it -p [ポート]:80 -v [Laravelのsrcディレクトリ]:/www --link mysql:mysql laravel-php`

Laravelのアプリケーション自体は入っていません。

mysqlも入っていないので別のmysqlのimageを立ち上げて--linkでリンクします
