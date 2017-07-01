use v6;
use Bailador;
use JSON::Fast;

my $root = $*PROGRAM.absolute.IO.dirname;
$root = $root.IO.dirname;

get '/documentation' => sub () {
    my $code = "$root/tmp/documentation.html".IO.slurp: :close;
    return template("documentation.html", {
        code => $code,
    });
};

require Bailador::Gradual;

baile();

# vim: expandtab
# vim: tabstop=4