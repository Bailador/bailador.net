use v6;
use Bailador;
use JSON::Fast;
use Bailador::Route::StaticFile;

#my $files = Bailador::Route::StaticFile.new: directory => $dir, path => '/html/:file';
#add_route: $files;

# this is planned to be a bit more generic than needed here
my $root = $*PROGRAM.absolute.IO.dirname;
if $root.IO.basename eq 'bin' {
    $root = $root.IO.dirname;
}
my $files = Bailador::Route::StaticFile.new: directory => $root, path => /.*/;

get '/(.*)' => sub ($url) {
    #return $root;
    my $file  = ($url eq '' ?? 'index' !! $url) ~ '.html';
    #return $file;
    my $path = $root.IO.child('views').child($file).Str;
    if $path.IO.e {
        return template($file)
    }

    return False if $url eq '';
    my $static = $root.IO.child('public').child($url);
    content_type('text/css') if $url ~~ /\.css$/;
    content_type('image/x-icon') if $url ~~ /\.ico$/;
    content_type('image/png') if $url ~~ /\.png$/;
    content_type('image/svg+xml') if $url ~~ /\.svg$/;
    content_type('text/xml') if $url ~~ /\.xml$/;
    content_type('text/plain') if $url ~~ /\.txt$/;
    return $static if $static.f;

    return False;
}

baile();

# vim: expandtab
# vim: tabstop=4
