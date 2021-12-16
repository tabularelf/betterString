str = new betterString("This is a test").upper().repeatString(4).lower().insert("Hello World", 1);
str2 = str.clone().upper().lettersExt("AEIOU", 4);
str3 = str.clone().remove(3, 4).insert(new betterString("Test"), 3);