up: # イメージを起動
	docker-compose up -d
build:　# イメージをビルド
	docker-compose build
set-up: # 初期設定
	docker-compose up -d --build
	docker-compose exec app composer install
	docker-compose exec app cp .env.example .env
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan migrate:fresh --seed
	docker-compose exec app chmod -R 777 bootstrap/cache
	docker-compose exec app chmod -R 777 storage
	docker-compose exec app npm install && npm run dev
stop: # イメージを止める
	docker-compose stop
destroy: # すべてのボリュームを削除する
	docker-compose down --rmi all --volumes
ps: # 動いているコンテナの確認
	docker-compose ps
app: # Webサーバにアクセスする
	docker-compose exec app bash
fresh: # DBをきれいにして、Seederを実行する
	docker-compose exec app php artisan migrate:fresh --seed
seed: # Seederを実行する
	docker-compose exec app php artisan db:seed
db: # DBサーバにアクセスする
	docker-compose exec db bash
sql: # DBにアクセスする
	docker-compose exec db bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'