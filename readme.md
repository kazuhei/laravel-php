Laravel用Dockerfile for php7.1

docker run -it -p [ポート]:80 -v [Laravelのsrcディレクトリ]:/www laravel-php71

Laravelのアプリケーション自体は入っていません。

mysqlも入っていないので別のmysqlのimageを立ち上げて--linkでリンクします
