package com.wky.dbUtils;

public class TestMtrix {
	public static void main(String[] args){
		String[] arr = {"adsf","adsfads","x","aa"};
		String[][] temp  = Matrix.OnetoTwo(arr, 2, 2);
		for(int i=0;i<2;i++){
			System.out.println();
			for(int j=0;j<2;j++){
				System.out.print(temp[i][j]+" ");
			}
		}
	}
}
