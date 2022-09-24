package javahelper;

import net.minidev.json.JSONArray;

public class JavaCommonMethods {

	public String testMethod1() {
		System.out.println("This is method1");
		return "Method1 data";
	}

	public String testMethod2(String arg) {
		String str = "This is method2--> "+arg;
		return str;
	}

	public static String testMethod3(String arg) {
		String str = "This is method3--> "+arg;
		return str;
	}	

	public static int arrayLength(JSONArray arg) {

		return arg.size();

	}

	public static void jobTitle(JSONArray arg) {

		int jobLength = arg.size();
		
		for(int i=0; i<jobLength; i++ ) {
			
			Object jobData = arg.get(i); //jobData is Json object
				
		}

	}
	

}

