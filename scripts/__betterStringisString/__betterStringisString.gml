#macro is_string __betterStringisString
#macro __is_string__ is_string

function __betterStringisString(_str) {
	if (__is_string__(_str) || isBetterString(_str)) return true;
	
	return false;
}