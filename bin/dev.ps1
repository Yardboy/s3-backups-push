param (
  [string]$cmd
)

$composefile='docker/docker-compose.yml'
$service='backup_db'

If ($cmd -eq 'bash') {
  docker-compose -f $composefile run -p 3000:3000 --rm $service /bin/bash
} elseif ($cmd -eq 'build') {
  docker-compose -f $composefile build
} elseif ($cmd -eq 'up') {
  docker-compose -f $composefile up
} elseif ($cmd -eq 'down') {
  docker-compose -f $composefile down
} elseif ($cmd -eq 'enter') {
  $id=((docker ps | Select-String -Pattern "docker_$service") -split('\s+'))[0]
  docker exec -it $id /bin/bash
}
