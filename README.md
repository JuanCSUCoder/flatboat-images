# FlatBoat Docker Images

This repository contains all the Dockerfiles required for *FlatBoat Ecosystem*.

## Build & Push

```bash
docker-compose build && docker-compose push
```

## Folder Structure

```bash
├──  dev // Images for Development Environments (devcontainers)
├──  nodes // Images for ROS2 capable Kubernetes Nodes (k3snodes)
├──  prod // Images for Deployment of ROS2 Packages
└──  README.md // This file
```

## Naming Convention

```syntax
<registry-domain>/<namespace>/robotim_<ws|pkg|bot>_<distro>
```

## License

> Copyright 2024 Juan Camilo Sánchez Urrego @JuanCSUCoder <juancsucoder@gmail.com>
>
> Licensed under the Apache License, Version 2.0 (the "License");
> you may not use this file except in compliance with the License.
> You may obtain a copy of the License at:
>
> <http://www.apache.org/licenses/LICENSE-2.0>
>
> Unless required by applicable law or agreed to in writing, software
> distributed under the License is distributed on an "AS IS" BASIS,
> WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> See the License for the specific language governing permissions and
> limitations under the License.
