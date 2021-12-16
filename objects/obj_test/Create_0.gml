str = new betterString("This is a test, ").upper().repeatString(4).lower().insert("Hello World", 0);
str2 = str.clone().upper().lettersExt("AEIOU", 4);
str3 = str.clone().remove(2, 4).insert(new betterString("Test"), 2).add(new betterString("Testing123"));
str4 = new betterString("Hello World!").setByteAt(20, 0x68).add("Test");
str.remove(str.lastPosExt("test", 60),4);

// Storing into a struct for testing reasons
var _struct = {
	str: other.str4.toString()
}

show_debug_message(_struct);