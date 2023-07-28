#!/usr/bin/env bash

#verifica se está sendo executado como root, caso não usar sudo
if [ "$UID" -eq 0 ]; then
	sudo=
else
	sudo=sudo
fi

#verifica se a pasta usr existe, se existir copiar para o /
if [ -d "usr" ]; then
	$sudo cp -a usr /
#se não existir verificar se o diretorio pipewire-config existe, se existir fazer atualizar com git
elif [ -d "pipewire-config" ]; then
	#verifica que o git está instalado, caso não alertar que precisa ser instalado
	if [ -x /usr/bin/git ]; then
		pushd pipewire-config
		git pull
		$sudo cp -a usr /
	else
		echo "Pacote GIT não instalado, por favor instale antes de proceguir"
	fi
#se o diretorio usr/ não existir, nem o diretorio pipewire-config existir, baixar os arquivos do git
else
	#verifica que o git está instalado, caso não alertar que precisa ser instalado
	if [ -x /usr/bin/git ]; then
		git clone https://github.com/xivastudio/pipewire-config.git
		$sudo cp -a pipewire-config/usr /
	else
		echo "Pacote GIT não instalado, por favor instale antes de proceguir"
	fi
fi
