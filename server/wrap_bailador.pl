use v6;

while True {
	say "Starting";
	shell('cd ~/work/bailador.net/; BAILADOR=port:3001  perl6 -Ilib bin/app.pl'); 
	CATCH { default { put .^name, ': ', .Str } };
}

