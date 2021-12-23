#macro __json_stringify__ json_stringify
#macro json_stringify __betterStringJsonStringify
#macro __json_parse__ json_parse
#macro json_parse __betterStringJsonParse

function __betterStringJsonStringify(_struct) {
	if (BETTERSTRING_HIJACK_JSON_FUNCS) {
		var _newStruct = __betterStringStructClone(_struct);
		__betterStringMakeJsonReady(_newStruct);
		return __json_stringify__(_newStruct);
	} else {
		return __json_stringify__(_struct);
	}
}

function __betterStringJsonParse(_json) {
		if (BETTERSTRING_HIJACK_JSON_FUNCS) {
		return __betterStringScanStruct(__json_parse__(_json));
	} else {
		return __json_parse__(_struct);
	}	
}

function __betterStringStructClone(_struct) {
	var _names = variable_struct_get_names(_struct);
	var _i = 0;
	var _newStruct = {};
	repeat(array_length(_names)) {
			_newStruct[$ _names[_i]] = _struct[$ _names[_i]];
		++_i;
	}
	return _newStruct;
}

function __betterStringMakeJsonReady(_struct) {
	var _keys = variable_struct_get_names(_struct);
	var _i = 0;
	repeat(array_length(_keys)) {
		var _value =_struct[$ _keys[_i]];
		if (isBetterString(_value)) {
				_struct[$ _keys[_i]] = _value.export();
		}
		++_i;
	}
}


function __betterStringScanStruct(_struct) {
	var _keys = variable_struct_get_names(_struct);
	var _i = 0;
	var _valueSearch = new betterString();
	repeat(array_length(_keys)) {
		var _value =_struct[$ _keys[_i]];
		if (is_string(_value)) {
			_valueSearch.set(_value);
			if (_valueSearch.exists("@@betterString@@")) {
				_struct[$ _keys[_i]] = new betterString(_valueSearch, 0, _valueSearch.length()+1).after("@@betterString@@");
			}
		}
		++_i;
	}
	return _struct;
}