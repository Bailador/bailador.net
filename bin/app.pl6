use v6.c;

use Bailador;
use JSON::Fast;

# Bailador stops responding after a while. Let's try to restart ourselves
Promise.in(60*60*1).then: { exit }

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
