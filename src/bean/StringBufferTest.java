package bean;

public class StringBufferTest {
	public static void main(String[] args){
		StringBuffer s = new StringBuffer();
		String ss = "sxasdf,adf,dsf,adsf,";
		String[] sss = ss.split(",");
		for(String l:sss){
			System.out.println(l);
		}
		
	}

}
