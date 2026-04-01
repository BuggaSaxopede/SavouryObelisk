function approach(value, target, increment = 0.5)
{
	var t = target - value;
	return value + clamp(t, -increment, increment);
}
