## 使用方法
```bash
$ cd [WORK_DIR]
$ docker run -it --rm -v "$PWD":/app -w /app shf0811/kozos-build-server [COMMAND]
```
たとえば、Makefileのあるディレクトリに移動し、以下のコマンドを実行する:
```bash
$ docker run -it --rm -v "$PWD":/app -w /app shf0811/kozos-build-server make
```

## 注意
ここで提供されるのはあくまでビルド環境であり、H8/3069FのフラッシュROMへの書き込みについては別途おこなう必要がある。
