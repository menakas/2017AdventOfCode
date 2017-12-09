$input = <>;
$sum = 0;

@nums = split //, $input;

for ( $i = 0; $i < @nums - 1; $i++ ) {
	$sum += $nums[ $i ] if ( $nums[ $i ] == $nums[ $i+1 ] );
}
$sum += $nums[0] if ( $nums[0] == $nums[ @nums - 2 ] );
print $sum;
