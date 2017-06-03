use v6;
use Bailador;
use JSON::Fast;
use Text::Markdown;

my $root = $*PROGRAM.absolute.IO.dirname;
$root = $root.IO.dirname;

get '/documentation' => sub () {
    my $raw-md = "$root/../Bailador/README.md".IO.slurp: :close;
    my $md = Text::Markdown.new($raw-md);
    my $code = $md.render;
    return template("documentation.html", {
        code => $code,
    });
};

use lib 'lib';
require BailadorGradual;

baile();

# vim: expandtab
# vim: tabstop=4
