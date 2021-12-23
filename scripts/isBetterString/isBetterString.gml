/// @func isBetterString(val)
/// @param val
function isBetterString(_val) {
	if ((is_struct(_val)) && (instanceof(_val) == "betterString")) return true;
	return false;
}