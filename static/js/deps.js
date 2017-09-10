function get_travis(module) {
    // TODO !!!
    switch (module) {
      case 'Digest':
          return 'https://api.travis-ci.org/grondilu/libdigest-perl6.png';
          break;
      case 'Digest::HMAC':
          return 'https://api.travis-ci.org/retupmoca/P6-Digest-HMAC.png';
          break;
      case 'File::Directory::Tree':
          return;
          break;
      case 'File::Find':
          return;
          break;
      case 'File::Temp':
          return;
          break;
      case 'HTTP::Easy':
          return;
          break;
      case 'HTTP::MultiPartParser':
          return;
          break;
      case 'HTTP::Server::Ogre':
          return;
          break;
      case 'HTTP::Status':
          return;
          break;
      case 'Log::Any':
          return;
          break;
      case 'Path::Iterator':
          return;
          break;
      case 'Template::Mojo':
          return;
          break;
      case 'Template::Mustache':
          return;
          break;
      case 'Terminal::ANSIColor':
          return;
          break;
      case 'URI':
          return 'https://travis-ci.org/perl6-community-modules/uri.png';
          break;
      default:
        return undefined;
    }
}

var url = 'https://raw.githubusercontent.com/Bailador/Bailador/dev/META6.json';

$.getJSON(url, function(json) {
  var items = []
  $.each(json.depends, function(k, v) {
      items.push("<li>" + v);
  });

  var list = document.getElementById("deps");
  for (var i = 0; i < items.length; i++) {
    var module = items[i];
    var travis = get_travis(module);
    $("#deps").append(module + "<img alt='Travis Status' src='" + travis + "'/></li>");
  };
});
