#macro is_string __betterStringisString
#macro __is_string__ is_string

function __betterStringisString(_str) {
	if (__is_string__(_str)) return true;
	if (is_struct(_str) && (instanceof(_str) == "betterString")) return true;
	
	return false;
}

/// @func betterString(string, [index], [count])
/// @param string
/// @param [index]
/// @param [count]
function betterString(_string = "", _index, _count) constructor {
	var _str = !is_string(_string) ? string(_string) : _string;
	
	if !(is_undefined(_index) || is_undefined(_count)) {
		str = string_copy(_str, is_undefined(_index) ? 1 : _index, is_undefined(_count) ? string_length(_str) : _count);	
	} else {
		str = _str;	
	}
	
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
		var _substr2 = is_struct(_substr) ? _substr.toString() : _substr;
		str = string_insert(_substr2, str, _index);
		return self;	
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
	
	static upperExt = function(_startPos, _endPos  = 1) {
		var _string = str;
		var _stringCopy = string_copy(_string, _startPos, _endPos);
		_stringCopy = string_upper(_stringCopy);
		var _newString = string_delete(_string,_startPos,_endPos);
		str = string_insert(_stringCopy, _newString, _startPos);	
		return self;
	}
	
	static lowerExt = function(_startPos, _endPos  = 1) {
		var _string = str;
		var _stringCopy = string_copy(_string, _startPos, _endPos);
		_stringCopy = string_lower(_stringCopy);
		var _newString = string_delete(_string,_startPos,_endPos);
		str = string_insert(_stringCopy, _newString, _startPos);	
		return self;
	}
	
	static lettersExt = function(_lettersToRemove, _index, _count) {
		var _string = str;
		var _i = is_undefined(_index) ? 1 : _index;
		var _length = is_undefined(_count) ? string_length(_lettersToRemove) : _count+1-_index;
		repeat(string_length(_string)) {
			var _ii = 1;
			repeat(_length) {
				var _a = string_char_at(_string, _i)
				var _b = string_char_at(_lettersToRemove, _ii)
				if _a == _b {
					_string = string_delete(_string, _i, 1);
					--_i;
					break;
				}
				++_ii;	
			}
			++_i;
		}
		
		str = _string;
		return self;
	}
	
	static add = function(_str) {
		var _str2 = is_struct(_str) ? _str.toString() : _str;
		str += !is_string(_str2) ? string(_str2) : _str2;
		return self;
	}
	
	static clone = function() {
		return new betterString(str);	
	}
	
	static get = function() {
		return toString();	
	}
	
	static remove = function(_index, _count) {
		str = string_delete(str, _index, _count);
		return self;
	}
	
	static clear = function() {
		str = "";
		return self;
	}
	
	static set = function(_str) {
		var _str2 = is_struct(_str) ? _str.toString() : _str;
		str = !is_string(_str2) ? string(_str2) : _str2;
		return self;
	}
	
	static toString = function() {
		return str;	
	}
}