str = new betterString("This is a test, ").upper().repeatString(4).lower().insert("Hello World", 0);
str2 = str.clone().upper().strip("AEIOU", 4);
str3 = str.clone().remove(2, 4).insert(new betterString("Test"), 2).add(new betterString("Testing123"));
str4 = new betterString("          Hello World!").setByteAt(30, 0x68).add("Test").concat("                    ");
show_debug_message("Length: " + string(str4.length()) + " : " + string(str4.trim().length()));
str.remove(str.lastPosExt("test", 60),4);
str5 = new betterString("The quick brown foX jumps over the lazy dog.");
show_debug_message("Exists: " + string(str5.exists("fox", false)));
str6 = new betterString("key: value");
show_debug_message([str6.before(":"), str6.after(":").trim()]);

// Storing into a struct for testing reasons
var _struct = {
	str: other.str4.toString()
}

show_debug_message(_struct);

show_debug_message(str5);
show_debug_message(str5.clone().insert(new betterString("	").repeatStr(4), 12));
show_debug_message(str5.clone().insert(new betterString("	").repeatStr(4), 12).strip("	"));
show_debug_message(str5.split(" "));
show_debug_message(str5.slice(31));
show_debug_message(new betterString("Hello World!\a\v\f\t\b\r\n").rawCodes());
show_debug_message(new betterString("Hello World!\a\v\f\t\b\r\n").rawCodes().unrawCodes());