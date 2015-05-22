package com.wky.ann;

import com.wky.dbUtils.Matrix;

public class ZhuanzhiTest {
	public static void main(String[] args){
		double[][] b = new double[3][2];
		double[][] c = new double[2][3];
		for(int i=0;i<3;i++){
			for(int j=0;j<2;j++){
				b[i][j] = i+j;
			}
		}
		for(int i=0;i<3;i++){
			System.out.println();
			for(int j=0;j<2;j++){
				System.out.print(b[i][j]+",");
			}
		}
		c = Matrix.Transposition(b);
		System.out.print(c.length);
		for(int i=0;i<c.length;i++){
			System.out.println();
			for(int j=0;j<c[0].length;j++){
				System.out.print(c[i][j]+",");
			}
		}
	}

}
