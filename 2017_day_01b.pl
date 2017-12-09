$input = <>;
$sum = 0;

@nums = split //, $input;

for ( $i = 0; $i < @nums / 2 ; $i++ ) {
	$sum += $nums[ $i ] if ( $nums[ $i ] == $nums[ $i + ( @nums/2 ) ] );
}
#$sum += $nums[0] if ( $nums[0] == $nums[ @nums - 2 ] );
print $sum * 2;
