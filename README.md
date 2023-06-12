# tac_plus_sssd
TACACS+ (shrubbery.net) Docker image capable of using host sssd authentication.

## Setup

1. Build imag
```bash
docker build -t tac_plus_sssd .
```

2. Copy and modify for your needs docker-compose.yml

```bash
mkdir -p /opt/my_containers/tac_plus
cp docker-compose.yml /opt/my_containers/tac_plus/
```

3. Run docker compose
```bash
docker compose -f /opt/my_containers/tac_plus/docker-compose.yml up -d
```

## Logs
Filter stream going to docker container log using `FILTERREGEX` env variable.
Unfiltered logs appear in containers `/var/log` dir. Use volumes to access them from host.
