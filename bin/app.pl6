use v6.c;

use Bailador;

use JSON::Fast;
use LWP::Simple;

my Str $meta-url = 'https://raw.githubusercontent.com/Bailador/Bailador/dev/META6.json';

my $root = $*PROGRAM.absolute.IO.dirname;
$root = $root.IO.dirname;

get '/documentation' => sub () {
    my $code = "$root/tmp/documentation.html".IO.slurp: :close;
    return template("documentation.html", {
        code => $code,
    });
};

get '/dependencies' => sub {
    return template "dependencies.html";
};

get '/deps' => sub {
    redirect('/dependencies');
}

require Bailador::Gradual;

baile();

# vim: expandtab
# vim: tabstop=4
