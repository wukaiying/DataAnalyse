package com.wky.dbUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author wky
 *封装错了，传入的参数应该是File file，而不是filename
 */
public class ReadFile {
	public static List<String> readFileByLinestoList(String fileName) {
        File file = new File(fileName);
        BufferedReader reader = null;
        List<String> list = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            list = new ArrayList<String>();
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
            	int i=0;
            	String [] tempArr = tempString.split(",");
            	while(i!=tempArr.length){
            		list.add(tempArr[i]);
            		i++;
            	}
                line++;
            }
            System.out.println("读完了：");
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return list;
    }
	
	
	//读取文件List中存入double型数组。
	public static List<double[]> readFileByLinetoDouble(String fileName){
		 File file = new File(fileName);
	        BufferedReader reader = null;
	        List<double[]> list = null;
	        try {
	            System.out.println("以行为单位读取文件内容，一次读一整行：");
	            reader = new BufferedReader(new FileReader(file));
	            list = new ArrayList<double[]>();
	            String tempString = null;
	            int line = 1;
	            // 一次读入一行，直到读入null为文件结束
	            while ((tempString = reader.readLine()) != null) {
	                // 显示行号
	            	int i=0;
	            	String [] tempArr = tempString.split(";");
	            	double[] tempDoubleArr = new double[tempArr.length];
	            	for(int j=0;j<tempArr.length;j++){
	            		tempDoubleArr[j] = Double.parseDouble(tempArr[j]);
	            	}
	            	
	            	list.add(tempDoubleArr);
	            }
	            System.out.println("读完了：");
	            reader.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (reader != null) {
	                try {
	                    reader.close();
	                } catch (IOException e1) {
	                }
	            }
	        }
			return list;
	}
	
	/**
	 * 返回文件指定行,与下面那个做区别。
	 */
	public static List<String> readFileByConfirmLinetoList1(String fileName,int lineNum) {
        File file = new File(fileName);
        BufferedReader reader = null;
        List<String> list = null;
        List<String> returnList = new ArrayList<String>();
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            list = new ArrayList<String>();
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while (((tempString = reader.readLine()) != null)&&line<=lineNum) {
            	list.add(tempString);
            }
            System.out.println("读完了：");
            reader.close();
            returnList.add(list.get(lineNum-1));
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return returnList;
    }
	/**
	 * 返回文件指定一行，每一行的元素个数要相同才行否则不行。
	 */
	public static List<String> readFileByConfirmLinetoList(String fileName,int lineNum) {
        File file = new File(fileName);
        BufferedReader reader = null;
        List<String> list = null;
        List<String> returnList = new ArrayList<String>();
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            list = new ArrayList<String>();
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while (((tempString = reader.readLine()) != null)&&line<=lineNum) {
            	// 显示行号
            	int i=0;
            	String [] tempArr = tempString.split(",");
            	while(i!=tempArr.length){
            		list.add(tempArr[i]);
            		i++;
            	}
                line++;
            }
            int LineElemNumsCount = ReadFile.LineElemNumsCount(fileName);
            for(int i=((lineNum-1)*LineElemNumsCount);i<(((lineNum-1)*LineElemNumsCount)+LineElemNumsCount);i++){
            	returnList.add(list.get(i));
            }
            System.out.println("读完了：");
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return returnList;
    }
	/**
	 * 返回文件前几行
	 * 
	 */
	public static List<String> readFileBySomeLinestoList(String fileName,int lineNum) {
        File file = new File(fileName);
        BufferedReader reader = null;
        List<String> list = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            list = new ArrayList<String>();
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while (((tempString = reader.readLine()) != null)&&line<=lineNum) {
                // 显示行号
            	int i=0;
            	String [] tempArr = tempString.split(",");
            	while(i!=tempArr.length){
            		list.add(tempArr[i]);
            		i++;
            	}
                line++;
            }
            System.out.println("读完了：");
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return list;
    }
	/**
	 * 获取每行元素个数
	 */
	public static int LineElemNumsCount(String fileName){
		File file = new File(fileName);
        BufferedReader reader = null;
        int count = 0;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            // 一次读入一行，直到读入null为文件结束
            if ((tempString = reader.readLine()) != null) {
                // 显示行号
            	String[] tempArr = tempString.split(",");
            	count = tempArr.length;
                
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return count;
	}
	
	public static int LineElemNumsCount1(String fileName){
		File file = new File(fileName);
        BufferedReader reader = null;
        int count = 0;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            // 一次读入一行，直到读入null为文件结束
            if ((tempString = reader.readLine()) != null) {
                // 显示行号
            	String[] tempArr = tempString.split(";");
            	count = tempArr.length;
                
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return count;
	}
	/**
	 * 获取总行数
	 */
	public static int LineNumsCount(String fileName){
		File file = new File(fileName);
        BufferedReader reader = null;
        int line = 0;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return line;
	}
	
	/**
	 * 读取文件的最后一行
	 * RandomAccessFile 
	 */
	public static String readLastLine(File file, String charset) throws IOException {    
		  if (!file.exists() || file.isDirectory() || !file.canRead()) {    
		    return null;    
		  }    
		  RandomAccessFile raf = null;    
		  try {    
		    raf = new RandomAccessFile(file, "r");    
		    long len = raf.length();    
		    if (len == 0L) {    
		      return "";    
		    } else {    
		      long pos = len - 1;    
		      while (pos > 0) {    
		        pos--;    
		        raf.seek(pos);    
		        if (raf.readByte() == '\n') {    
		          break;    
		        }    
		      }    
		      if (pos == 0) {    
		        raf.seek(0);    
		      }    
		      byte[] bytes = new byte[(int) (len - pos)];    
		      raf.read(bytes);    
		      if (charset == null) {    
		        return new String(bytes);    
		      } else {    
		        return new String(bytes, charset);    
		      }    
		    }    
		  } catch (FileNotFoundException e) {    
		  } finally {    
		    if (raf != null) {    
		      try {    
		        raf.close();    
		      } catch (Exception e2) {    
		      }    
		    }    
		  }    
		  return null;    
		}
	/**
	 * 从文件的第二行开始读
	 */
	public static List<String> readFileSince2toList(String fileName) {
        File file = new File(fileName);
        BufferedReader reader = null;
        List<String> list = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            list = new ArrayList<String>();
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
            	int i=0;
            	String [] tempArr = tempString.split(",");
            	while(i!=tempArr.length&&line>1){
            		list.add(tempArr[i]);
            		i++;
            	}
                line++;
            }
            System.out.println("读完了：");
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return list;
    }
	
	/**
	 * 读取第几行到第几行的数据
	 */
	public static List<String> readFileSinceNLinestoMLines(String fileName,int start,int end) {
        File file = new File(fileName);
        BufferedReader reader = null;
        List<String> list = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            list = new ArrayList<String>();
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
            	int i=0;
            	String [] tempArr = tempString.split(",");
            	while(i!=tempArr.length&&line>=start&&line<=end){
            		list.add(tempArr[i]);
            		i++;
            	}
                line++;
            }
            System.out.println("读完了：");
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return list;
    }
	
}
