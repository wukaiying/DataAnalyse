package com.wky.ann;

import java.util.List;

import com.wky.dbUtils.Matrix;
import com.wky.dbUtils.ReadFile;

/**
 * 
 * @author wky
 * @date 2015-4-15
 * @description 实际数据归一化
 */
public class DataNormalization {
	//对原始数据进行归一化处理，得到神经网络输出
	public static void DataNormalize(){
		String fileName = "E:/食品安全数据挖掘/食品数据分析/神经网络模型/实验数据/ann.txt";
		//每一行元素个数
		int lineElemNums = ReadFile.LineElemNumsCount(fileName);
		int lines = ReadFile.LineNumsCount(fileName);
		System.out.println("lines:"+lines);
		System.out.println("lineElemNums："+lineElemNums);
		//静态方法直接用类名调用
		List<String> dataList = ReadFile.readFileByLinestoList(fileName);
		int k=0;
		double [][]b = new double[lines][lineElemNums];
		for(int i=0;i<lines;i++){
			for(int j=0;j<lineElemNums;j++){
				b[i][j] = Double.parseDouble(dataList.get(k++));
			}
		}
		//把b进行转置
		double[][] b_zhuanzhi = new double[lineElemNums][lines];
		b_zhuanzhi = Matrix.Transposition(b);
		//存储归一化后的数组
		double[][] guiyihua = new double[lineElemNums][lines];
		for(int i=0;i<lineElemNums;i++){
			guiyihua[i] = Matrix.Normalization(b_zhuanzhi[i]);
		}
		for(int i=0;i<lineElemNums;i++){
			System.out.println();
			for(int j=0;j<lines;j++){
				System.out.print(guiyihua[i][j]+",");
			}
		}
		/**
		double[] arr = Matrix.Normalization(b_zhuanzhi[0]);
		for(double temp:arr){
			System.out.println(temp);
		}*/
		//各个归一化后的指标相加得到输出
		//再次转置。。
		//先对前三个指标归一化后加和，这儿应该可以做成通用的。
		double[][] c_zhuanzhi = new double[lines][lineElemNums];
		c_zhuanzhi = Matrix.Transposition(guiyihua);
		double[] zhibiaoshuchu = new double[lines];
		for(int i=0;i<lines;i++){
			for(int j=6;j<11;j++){
				zhibiaoshuchu[i] += c_zhuanzhi[i][j];
			}
			
		}
		System.out.println();
		System.out.println("前三个指标");
		for(double temp:zhibiaoshuchu){
			System.out.println(temp);
		}
	}
	//对每一列的标准值进行归一化得到标准输出
	public static void StandardDataNormalize(){
		System.out.println("对标准数据的归一化开始了。");
		String fileName = "E:/食品安全数据挖掘/食品数据分析/神经网络模型/实验数据/ann.txt";
		//每一行元素个数
		int lineElemNums = ReadFile.LineElemNumsCount(fileName);
		int lines = ReadFile.LineNumsCount(fileName);
		System.out.println("lines:"+lines);
		System.out.println("lineElemNums："+lineElemNums);
		//静态方法直接用类名调用
		List<String> dataList = ReadFile.readFileByLinestoList(fileName);
		int k=0;
		double [][]b = new double[lines][lineElemNums];
		for(int i=0;i<lines;i++){
			for(int j=0;j<lineElemNums;j++){
				b[i][j] = Double.parseDouble(dataList.get(k++));
			}
		}
		//把b进行转置
		double[][] b_zhuanzhi = new double[lineElemNums][lines];
		b_zhuanzhi = Matrix.Transposition(b);
		//存储归一化后的数组
		double[][] guiyihua = new double[lineElemNums][lines];
		//各个列的归一化11行诶。
		guiyihua[0] = Matrix.StandardNormalization(b_zhuanzhi[0], 3);
		guiyihua[1] = Matrix.StandardNormalization(b_zhuanzhi[1], 50);
		guiyihua[2] = Matrix.StandardNormalization(b_zhuanzhi[2], 3);
		guiyihua[3] = Matrix.StandardNormalization(b_zhuanzhi[3], 0.3);
		guiyihua[4] = Matrix.StandardNormalization(b_zhuanzhi[4], 5);
		guiyihua[5] = Matrix.StandardNormalization(b_zhuanzhi[5], 0.2);
		guiyihua[6] = Matrix.StandardNormalization(b_zhuanzhi[6], 0.1);
		guiyihua[7] = Matrix.StandardNormalization(b_zhuanzhi[7], 0.2);
		guiyihua[8] = Matrix.StandardNormalization(b_zhuanzhi[8], 0.5);
		guiyihua[9] = Matrix.StandardNormalization(b_zhuanzhi[9], 20);
		guiyihua[10] = Matrix.StandardNormalization(b_zhuanzhi[10], 0.2);
		
		//各个归一化后的指标相加得到输出
		//再次转置。。
		//先对前三个指标归一化后加和，这儿应该可以做成通用的。
		double[][] c_zhuanzhi = new double[lines][lineElemNums];
		c_zhuanzhi = Matrix.Transposition(guiyihua);
		double[] zhibiaoshuchu = new double[lines];
		for(int i=0;i<lines;i++){
			for(int j=6;j<11;j++){
				zhibiaoshuchu[i] += c_zhuanzhi[i][j];
			}
			
		}
		System.out.println();
		System.out.println("前三个指标");
		for(double temp:zhibiaoshuchu){
			System.out.println(temp);
		}
		System.out.println("对标准数据的归一化结束了。");
	}
	public static void main(String[] args){
		//DataNormalize();
		StandardDataNormalize();
	}
}
