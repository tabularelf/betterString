str = new betterString("This is a test").upper().repeatString(4).lower().insert("Hello World", 0);
str2 = str.clone().upper().lettersExt("AEIOU", 4);
str3 = str.clone().remove(2, 4).insert(new betterString("Test"), 2).add(new betterString("Testing123"));