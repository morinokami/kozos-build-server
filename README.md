## 使用方法
```bash
$ cd [WORK_DIR]
$ docker run -it --rm -v "$PWD":/app -w /app shf0811/kozos-build-server [COMMAND]
```

## 使用例
ビルドをおこなうには、Makefileの置いてあるフォルダに移動した上で、
```bash
$ docker run -it --rm -v "$PWD":/app -w /app shf0811/kozos-build-server make
$ docker run -it --rm -v "$PWD":/app -w /app shf0811/kozos-build-server make image
```
とする。

また、H8/3069FのフラッシュROMへの書き込みについては、たとえばシリアルのデバイス・ファイルが`/dev/ttyUSB0`である場合には、
```bash
$ docker run -it --rm -v "$PWD":/app -w /app --device=/dev/ttyUSB0 shf0811/kozos-build-server kz_h8write -3069 -f20 kzload.mot /dev/ttyUSB0
```
とする。あるいは、Makefileの`H8WRITE`と`H8WRITE_SERDEV`の値をそれぞれ
```
H8WRITE = /usr/local/bin/kz_h8write
H8WRITE_SERDEV = /dev/ttyUSB0
```
と書き換えた上で、
```bash
$ docker run -it --rm -v "$PWD":/app -w /app --device=/dev/ttyUSB0 shf0811/kozos-build-server make write
```
とする。

