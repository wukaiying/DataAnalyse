package com.wky.dbUtils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class WriteFile {
	public static void writeFile(String fileName,String content){
		String filePath = "E:/JAVA/apache-tomcat-5.5.27/apache-tomcat-5.5.27/webapps/DataAnalyse/WEB-INF/userdata";
		File file = new File(filePath+"\\"+fileName);
		if(!file.getParentFile().exists()){
			file.getParentFile().mkdirs();
		}
		try{
			file.createNewFile();
		}catch(IOException e){
			e.printStackTrace();
		}
		try{
			FileWriter fw = new FileWriter(file,true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content+"\n");
			bw.close();
			fw.close();
			System.out.println(fileName+"–¥»ÎÕÍ±œ");
		}catch(IOException e1){
			e1.printStackTrace();	
		}
	}
}
