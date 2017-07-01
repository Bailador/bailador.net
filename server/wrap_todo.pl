use v6;

while True {
	say "Starting";
	shell('cd ~/work/Bailador-TODO/; BAILADOR=port:3002  bailador watch bin/app.pl6'); 
	CATCH { default { put .^name, ': ', .Str } };
}

