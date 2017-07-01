use v6;

while True {
	say "Starting";
	shell('cd ~/work/bailador.net/; BAILADOR=port:3001 bailador watch bin/app.pl6'); 
	CATCH { default { put .^name, ': ', .Str } };
}

