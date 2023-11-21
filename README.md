# FlatBoat Docker Images

This repository contains all the Dockerfiles required for *FlatBoat Ecosystem*.

## Build & Push

```bash
docker-compose build && docker-compose push
```

## Estructura de Carpetas

```bash
├──  dev // Images for Development Environments (devcontainers)
├──  nodes // Images for ROS2 capable Kubernetes Nodes (k3snodes)
├──  prod // Images for Deployment of ROS2 Packages
└──  README.md // This file
```
