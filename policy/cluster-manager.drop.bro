# These will be generated by the workers.
event Drop::address_seen_again(a: addr)
	{
	debug_log(fmt("received seen_again for %s", a));
	
	if ( ! use_catch_release )
		return;
	
	if ( a !in drop_info )
		# Never dropped.
		return;
	
	local di = drop_info[a];
	if ( is_dropped(a) )
		# Still dropped.
		return;
	
	NOTICE([$note=AddressSeenAgain, $src=a,
			$msg=fmt("%s seen again after release", a)]);
	}

