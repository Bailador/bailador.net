The source code of the website of Bailador that currently lives here: http://bailador.net/

## Build the css

The `sass` gem must be installed.
```
$ gem install sass
```
Then, in the main directory of the project :
```
$ sass static/scss/main.scss static/css/style.css
```

## Server setup

Running on a 2 Gb memmory Droplet at Digital Ocean.

We needed 2 Gb as Rakudo would not compile on a 1 Gb Droplet.

OS: Ubuntu


As user `gabor`

```
mkdir ~/work
cd ~/work
git clone https://github.com/Bailador/nailador.net.git
git clone https://github.com/szabgab/Bailador-TODO.git
```

As user `root`

``
apt-get install apache2
apt-get install ruby ruby-sass
cd /etc/apache2/sites-enabled
ln -s /home/gabor/work/bailador.net/server/bailador.net.conf

a2enmod headers
a2enmod proxy
a2enmod proxy_http

service apache2 restart
```

Download Rakudo Star from http://rakudo.org/ to /opt
```
cd /opt
wget https://rakudo.perl6.org/downloads/star/rakudo-star-2017.04.tar.gz
tar xzf rakudo-star-2017.04.tar.gz
cd rakudo-star-2017.04
perl Configure.pl --backend=moar --gen-moar
make
make install
```

Add the following to the end of ~/.bashrc of both `root` and `gabor`:

```
export PATH=$PATH:/opt/rakudo-star-2017.04/install/bin:/opt/rakudo-star-2017.04/install/share/perl6/site/bin
```


### Launch the web applications manually


As user `gabor` in 2 tmux sessions:

```
cd ~/work/bailador.net/server
perl6 wrap_bailador.pl
```

```
cd ~/work/bailador.net/server
perl6 wrap_todo.pl
```


### Other

```
# apt-get install mailutils
# apt-get install pandoc
$ crontab server/crontab.txt
```

