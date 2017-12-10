@input = <> ;
chomp @input;
$index = 0;
$steps = 0;
while( $index < @input && $index >= 0 ) {
	$temp = $index;
	$index += $input[ $index ];
	$input[ $temp ]++;
	$steps++;
}

print "$steps\n";
