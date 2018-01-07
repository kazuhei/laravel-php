Laravel用Dockerfile 

PHPは最新版を入れています。今は7.2

docker run -it -p [ポート]:80 -v [Laravelのsrcディレクトリ]:/www laravel-php71

Laravelのアプリケーション自体は入っていません。

mysqlも入っていないので別のmysqlのimageを立ち上げて--linkでリンクします
