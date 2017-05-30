use v6;

while True {
	say "Starting";
	shell('cd ~/work/Bailador-TODO/; BAILADOR=port:3002  perl6 -Ilib bin/app.pl'); 
	CATCH { default { put .^name, ': ', .Str } };
}

