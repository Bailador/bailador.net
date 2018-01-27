The source code of the website of Bailador that currently lives here: http://bailador.net/

## Build the css

The `sass` gem must be installed.
```
$ gem install sass
```
Then, in the main directory of the project :
```
$ mkdir static/css
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
git clone https://github.com/Bailador/bailador.net.git
git clone https://github.com/szabgab/Bailador-TODO.git
```

As user `root`

``
apt-get install -y apache2
apt-get install -y ruby ruby-sass
apt-get install -y build-essential
ln -s /home/gabor/work/bailador.net/server/bailador.net.conf /etc/apache2/sites-enabled/bailador.net.conf

a2enmod headers
a2enmod proxy
a2enmod proxy_http

service apache2 restart
```

Download Rakudo Star from http://rakudo.org/ to /opt
( http://rakudo.org/downloads/star/rakudo-star-latest.tar.gz could be used)
```
cd /opt
wget https://rakudo.perl6.org/downloads/star/rakudo-star-2017.10.tar.gz
tar xzf rakudo-star-2017.10.tar.gz
cd rakudo-star-2017.10
perl Configure.pl --backend=moar --gen-moar
make
make install
```

Add the following to the end of ~/.bashrc of both `root` and `gabor`:

```
export PATH=$PATH:/opt/rakudo-star-2017.10/install/bin:/opt/rakudo-star-2017.10/install/share/perl6/site/bin
```

As user `root`

```
cd /home/gabor/work/bailador.net
zef install --serial --force --deps-only .
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

