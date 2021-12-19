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
		str = string_copy(_str, is_undefined(_index) ? 1 : _index+1, is_undefined(_count) ? string_length(_str) : _count);	
	} else {
		str = _str;	
	}
	
	static byteAt = function(_index) {
		return string_byte_at(str, _index+1);
	}
	
	static byteLength = function() {
		return string_byte_length(str);
	}
	
	static setByteAt = function(_index, _val) {
		if (_index+1 > string_length(str)) {
			static _buffer = buffer_create(1, buffer_fixed, 1);
			buffer_resize(_buffer, _index+1-length());
			buffer_seek(_buffer, buffer_seek_start, 0);
			buffer_fill(_buffer, 0, buffer_u8, 0x20, buffer_get_size(_buffer));
			str += buffer_read(_buffer, buffer_text);
			buffer_resize(_buffer, 1);
		}
		str = string_set_byte_at(str, _index+1, _val)
		return self;
	}
	
	static charAt = function(_index) {
		return string_char_at(str, _index+1);
	}
	
	static ordAt = function(_index) {
		return string_ord_at(str, _index+1);
	}
	
	static count = function(_substr) {
		return string_count(_substr, str);
	}
	
	static copy = function(_str, _index, _count) {
		str = string_copy(_str, _index+1, _count);
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
	
	static toReal = function() {
		return real(string_digits(str));
	}
	
	static insert = function(_substr, _index) {
		var _substr2 = is_struct(_substr) ? _substr.toString() : _substr;
		str = string_insert(_substr2, str, _index+1);
		return self;	
	}
	
	static lastPos = function(_substr) {
		return string_last_pos(_substr, str)-1;	
	}
	
	static lastPosExt = function(_substr, _startPos) {
		return string_last_pos_ext(_substr, str, _startPos+1)-1;
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
		return string_pos(_substr, str)-1;
	}
	
	static posExt = function(_substr, _startPos) {
		return string_pos_ext(_substr, str, _startPos+1)-1;
	}
	
	static replace = function(_substr, _newstr) {
		var _substr2 = is_struct(_substr) ? _substr.toString() : _substr;
		var _newstr2 = is_struct(_newstr) ? _newstr.toString() : _newstr;
		str = string_replace(str, _substr2, _newstr2);
		return self;
	}
	
	static replaceAll = function(_substr, _newstr) {
		str = string_replace_all(str, _substr, _newstr);
		return self;
	}
	
	static repeatStr = function(_count) {
		str = string_repeat(str, _count);
		return self;
	}
	
	static repeatString = method(undefined, repeatStr);
	
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
	
	static upperExt = function(_index, _count  = 1) {
		var _string = str;
		var _stringCopy = string_copy(_string, _index+1, _count);
		_stringCopy = string_upper(_stringCopy);
		var _newString = string_delete(_string,_index+1,_count);
		str = string_insert(_stringCopy, _newString, _index+1);	
		return self;
	}
	
	static lowerExt = function(_index, _count  = 1) {
		var _string = str;
		var _stringCopy = string_copy(_string, _index+1, _count);
		_stringCopy = string_lower(_stringCopy);
		var _newString = string_delete(_string,_index+1,_count);
		str = string_insert(_stringCopy, _newString, _index+1);	
		return self;
	}
	
	static add = function() {
		var _i = 0;
		var _str;
		repeat(argument_count) {
			_str = is_struct(argument[_i]) ? argument[_i].toString() : argument[_i];
			str += !is_string(_str) ? string(_str) : _str;
			++_i;
		}
		return self;
	}
	
	static concat = add;
	
	static clone = function() {
		return new betterString(str);	
	}
	
	static remove = function(_index, _count) {
		str = string_delete(str, _index+1, _count);
		return self;
	}
	
	static del = remove;
	
	static clear = function() {
		str = "";
		return self;
	}
	
	static set = function(_str) {
		var _str2 = is_struct(_str) ? _str.toString() : _str;
		str = !is_string(_str2) ? string(_str2) : _str2;
		return self;
	}
	
	static trim = function() {
			trimStart();
			trimEnd();
			return self;
	}
	
	static trimStart = function() {
		var _str = str;
		var _i = 1;
		while((_i < string_length(_str)) && (string_byte_at(_str, _i) == 0x20)) {
			++_i;	
		}
		
		_str = string_delete(_str, 1, _i-1);
		str = _str;
		return self;
	}
	
	static trimEnd = function() {
		var _str = str;
		var _i = string_length(_str);
		while((_i > 0) && (string_byte_at(_str, _i) == 0x20)) {
			--_i;	
		}
		
		_str = string_delete(_str, _i+1, string_length(_str)-_i);
		str = _str;
		return self;	
	}
	
	static strip = function(_lettersToRemove, _index, _count) {
		var _bytes = array_create(string_length(_lettersToRemove));
		var _i = 0;
		repeat(string_length(_lettersToRemove)) {
			_bytes[_i] = string_byte_at(_lettersToRemove, _i);
			++_i;
		}
		
		var _bytesLength = array_length(_bytes);
		
		var _string = str;
		var _i = is_undefined(_index) ? 1 : _index+1;
		var _length = is_undefined(_count) ? string_length(_string) : _count+1-_index+1;
		repeat(_length) {
			var _ii = 0;
			repeat(_bytesLength) {
				var _a = string_byte_at(_string, _i);
				if _a == _bytes[_ii] {
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
	
	static slice = function(_index, _count = string_length(str)-_index+1) {
		return new betterString(str, _index+1, _count);
	}
	
	static split = function(_str, _maxLimit = all) {
		if (is_undefined(_str)) {
			return new betterString([str]);	
		}
		
		var __str = str;
		var _stringLength = string_length(_str);
		var _limit = (_maxLimit == all) ? string_count(_str, str) : _maxLimit;
		var _i = 0;
		var _pos = 1;
		var _lastPos = string_pos_ext(_str, __str, 1);
		var _array = array_create(_limit+1);
		repeat(_limit) {
			_array[_i] = new betterString(__str, _pos-1, _lastPos-_pos);
			_pos = _lastPos+1;
			_lastPos = string_pos_ext(_str, __str, _lastPos);
			++_i;
		}
		_array[_i] =  new betterString(__str, _pos-1, string_length(__str));
		
		return _array;
	}
	
	static substring = function(_str) {
		var _substr;
		if !(is_string(_str)) {
			_substr = string(_str);	
		} else {
			_substr = _str;	
		}
		
		if (exists(_substr)) {
			return new betterString(str, pos(_substr), string_length(_substr));
		} 
		
		return new betterString();
	}
	
	static before = function(_str) {
		var _substr;
		if !(is_string(_str)) {
			_substr = string(_str);	
		} else {
			_substr = _str;	
		}
		
		return new betterString(str, 0, string_pos(_substr, str)-1);
	}
	
	static after = function(_str) {
		var _substr;
		if !(is_string(_str)) {
			_substr = string(_str);	
		} else {
			_substr = _str;	
		}
		
		return new betterString(str, string_pos(_substr, str), string_length(str));
	}
	
	static rawCodes = function() {
		replaceAll("\n", "\\n");
		replaceAll("\r", "\\r");
		replaceAll("\b", "\\b");
		replaceAll("\v", "\\v");
		replaceAll("\f", "\\f");
		replaceAll("\a", "\\a");
		replaceAll("\t", "\\t");
		
		return self;
	}
	
	static unrawCodes = function() {
		replaceAll("\\n", "\n");
		replaceAll("\\r", "\r");
		replaceAll("\\b", "\b");
		replaceAll("\\v", "\v");
		replaceAll("\\f", "\f");
		replaceAll("\\a", "\a");
		replaceAll("\\t", "\t");
		return self;
	}
	
	static tabsToSpaces = function(_spaces = 4) {
		var _i = 0;
		var _spaceStr = new betterString(" ").repeatStr(_spaces);
		replaceAll("	", _spaceStr);
		
		return self;
	}
	
	static exists = function(_substring, _caseSensitive = true) {
		
		if !(_caseSensitive) {
			var _str = string_upper(toString());
			return string_pos(string_upper(_substring), _str) > 0;
		}
		
		return pos(_substring) > 0;
	}
	
	static toString = function() {
		return str;	
	}
	
	static get = toString;
}