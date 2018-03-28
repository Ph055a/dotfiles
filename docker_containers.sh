# Docker Containers #
echo "Starting docker service"
sudo systemctl start docker
echo "Pulling Powershell"
docker pull microsoft/powershell
echo "Pulling Go container"
docker pull golang
echo "Pulling Ubuntu container"
docker pull ubuntu
echo "Pulling Busybox container"
docker pull busybox
echo "Pulling Alpine container"
docker pull alpine

