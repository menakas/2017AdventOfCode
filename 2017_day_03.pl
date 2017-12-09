$input = <>;
chomp $input;

#calculate size of grid
$size = int ( sqrt ( $input ) + 0.99 );
$size++ if ( $size % 2 == 0 );

$count = 1;

print $size, "\n";

$startx = $starty = int ( $size / 2 );

if ( $size == 1 ) {
	print "0\n";
	exit;
}

#Start with the end of the inner square
#And try to locate the position of the input number in the outermost square
$num = ( ( $size - 2 ) ** 2 ) ;
$x = $y = $size - 2;

#one step to the right
++$y; ++$num;

#to the top
while ( $x > 0 && $num < $input ) { 
	++$num;
	--$x;
}

if ($num < $input ) {
	#to the left
	while ( $y > 0 && $num < $input ) { 
		++$num;
		--$y;
	}
	if ($num < $input ) {
		#to the bottom
		while ( $x < ( $size - 1 ) && $num < $input ) {
			++$num;
			++$x;
		}
		
		if ($num < $input ) {
			#to the right
			while ( $y < ( $size - 1 ) && $num < $input ) {
				++$num;
				++$y;
			}
		}
	}
}

print "$x, $y\n"; #location of the input number
$steps = abs ( $x - $startx ) + abs ( $y - $starty );
print $steps; #Number of steps
