# ベースイメージの選択
FROM node:18-slim

# 作業ディレクトリの設定
WORKDIR /app

# パッケージの依存関係をインストール
COPY kabu_app_server/package.json kabu_app_server/package-lock.json ./
RUN npm ci

# ソースコードのコピー
COPY kabu_app_server/. .

# Next.jsアプリをビルド
RUN npm run build

# アプリケーションのポート番号を指定
EXPOSE 3000

# Next.jsアプリケーションを実行
CMD ["npm", "run", "start"]