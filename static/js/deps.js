var url = 'https://raw.githubusercontent.com/Bailador/Bailador/dev/META6.json';

$.getJSON(url, function(json) {
  var items = []
  $.each(json.depends, function(k, v) {
      items.push("<li>" + v + "</li>");
  });

  var list = document.getElementById("deps");
  for (var i = 0; i < items.length; i++) {
    $("#deps").append(items[i]);
  };
});
