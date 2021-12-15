/// @func betterString(string)
/// @param string
#macro is_string __betterStringisString
#macro __is_string__ is_string

function __betterStringisString(_str) {
	if (__is_string__(_str)) return true;
	if (is_struct(_str) && (instanceof(_str) == "betterString")) return true;
	
	return false;
}

function betterString(_string = "", _index, _count) constructor {
	var _str = !is_string(_string) ? string(_string) : _string;
	str = string_copy(_str, is_undefined(_index) ? 1 : _index, is_undefined(_count) ? string_length(_str) : _count);
	
	static byteAt = function(_index) {
		return string_byte_at(str, _index);
	}
	
	static byteLength = function() {
		return string_byte_length(str);
	}
	
	static setByteAt = function(_index, _val) {
		str = string_set_byte_at(str, _index, _val)
		return self;
	}
	
	static charAt = function(_index) {
		return string_char_at(str, _index);
	}
	
	static ordAt = function(_index) {
		return string_ord_at(str, _index);
	}
	
	static count = function(_substr) {
		return string_count(_substr, str);
	}
	
	static copy = function(_str, _index, _count) {
		str = string_copy(_str, _index, _count);
		return self;	
	}
	
	static remove = function(_index, _count) {
		str = string_delete(str, _index, _count);
		return self;
	}
	
	static digits = function() {
		str = string_digits(str);
		return self;
	}
	
	static format = function(_total = 0, _dec = 2) {
		str = string_format(real(string_digits(str)), _total, _dec);
		return self;
	}
	
	static toReal = function(_dec = 2) {
		return real(string_digits(str));
	}
	
	static insert = function(_substr, _index) {
		str = string_insert(_substr, str, _index);
		return self;	
	}
	
	static add = function(_substr) {
		str += !is_string(_substr) ? string(_substr) : _substr;
	}
	
	static lastPos = function(_substr) {
		return string_last_pos(_substr, str);	
	}
	
	static lasPostExt = function(_substr, _startPos) {
		return string_last_pos_ext(_substr, str, _startPos);
	}
	
	static length = function() {
		return string_length(str);
	}
	
	static letters = function() {
		str = string_letters(str);
		return self;
	}
	
	static lettersdigits = function() {
		str = string_lettersdigits(str);
		return self;	
	}
	
	static lower = function() {
		str = string_lower(str);
		return self;
	}
	
	static pos = function(_substr) {
		return string_pos(_substr, str);
	}
	
	static posExt = function(_substr, _startPos) {
		return string_pos_ext(_substr, str, _startPos);
	}
	
	static replace = function(_substr, _newstr) {
		str = string_replace(str, _substr, _newstr);
		return self;
	}
	
	static replaceAll = function(_substr, _newstr) {
		str = string_replace_all(str, _substr, _newstr);
		return self;
	}
	
	static repeatString = function(_count) {
		str = string_repeat(str, _count);
		return self;
	}
	
	static upper = function() {
		str = string_upper(str);
		return self;
	}
	
	static height = function() {
		return string_height(str);
	}
	
	static heightExt = function(_sep, _w) {
		return string_height_ext(str, _sep, _w);	
	}
	
	static width = function() {
		return string_width(str);
	}
	
	static widthExt = function(_sep, _w) {
		return string_width_ext(str, _sep, _w);	
	}
	
	static hashToNewLine = function() {
		str = string_hash_to_newline(str);
		return self;
	}
	
	static clone = function() {
		return new betterString(str);	
	}
	
	static getString = function() {
		return str;	
	}
	
	static toString = function() {
		return str;	
	}
}