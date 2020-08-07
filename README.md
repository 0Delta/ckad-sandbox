# ckad-sandbox
🐳

## Usage
```
# RUN
$ docker run -it -e PROJECT={{YOUR_PROJECT}} --rm qushot/ckad-sandbox:latest

# RUN (Option: choice zone)
$ docker run -it -e PROJECT={{YOUR_PROJECT}} -e ZONE={{YOUR_ZONE}} --rm qushot/ckad-sandbox:latest

# Exit: Aliased 'exit' with delete GKE Cluster and bash exit.
root@ad1010005aa1:~# exit
```

## Develop
```
# BUILD
$ docker build -t qushot/ckad-sandbox:latest .
```
