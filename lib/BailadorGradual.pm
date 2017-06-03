use Bailador;
use Bailador::Route::StaticFile;

# this is planned to be a bit more generic than needed here
my $root = $*PROGRAM.absolute.IO.dirname;
if $root.IO.basename eq 'bin' {
    $root = $root.IO.dirname;
}

get '/(.*)' => sub ($url) {
    my $file  = ($url eq '' ?? 'index' !! $url) ~ '.html';
    my $path = $root.IO.child('views').child($file).Str;
    if $path.IO.e {
        return template($file)
    }

    return False;
}


my $files = Bailador::Route::StaticFile.new: directory => $root.IO.child('public'), path => /(.*)/;
app.add_route: $files;

