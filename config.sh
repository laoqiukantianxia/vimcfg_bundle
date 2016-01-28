#!/bin/bash 

#备份OS中vim的配置   
function bakup_vimconfig()
{
	echo "Bakup your vimconfig file..."
	rm   -rf $HOME/.bakvim
	mkdir $HOME/.bakvim
	cp 	  $HOME/.vim  $HOME/.bakvim -a 
	cp 	  $HOME/.vimrc $HOME/.bakvim 
	cp 	  $HOME/.bashrc $HOME/.bakvim 
}

#配置vim
function config_vim()
{
	echo "Config your vim now !"
	rm -rf $HOME/.vim 
	cp ./.vim  $HOME -a 
	cp ./.vimrc $HOME 
	cp ./.bashrc $HOME

	#生成tags文件
	sudo cp ctags /bin 
	echo "Make tags in /usr/include"
	cd /usr/include
	sudo ctags -I __THROW -I __THROWNL -I __nonnull -R --c-kinds=+p --fields=+iaS --extra=+q
}

bakup_vimconfig
config_vim

git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle
username=`ls -l config.sh | cut -d ' ' -f3`
groupname=`ls -l  config.sh | cut -d ' ' -f4`
echo $username
echo $groupname
chown -R $username:$groupname ~/.vim/bundle/
