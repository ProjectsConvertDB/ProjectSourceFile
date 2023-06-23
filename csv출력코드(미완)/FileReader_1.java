package org.momento.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FileReader_1 {
	public static void main(String[] args) {
		FileReader_1 csvReader = new FileReader_1();
		csvReader.readCSV();
	}

	public List<List<String>> readCSV() {
		List<List<String>> csvList = new ArrayList<List<String>>();
		File csv = new File("C://test/test3.csv");
		BufferedReader br = null;
		String line = "";
		int ch;

		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(csv)));
			  while ((ch = br.read()) != -1) {
				  
		            System.out.print((char) ch);
		        }
			/*
			 * while ((line = br.readLine()) != null) { // readLine()은 파일에서 개행된 한 줄의 데이터를
			 * 읽어온다. List<String> aLine = new ArrayList<String>(); String[] lineArr =
			 * line.split(","); // 파일의 한 줄을 ,로 나누어 배열에 저장 후 리스트로 변환한다. aLine =
			 * Arrays.asList(lineArr); csvList.add(lineArr); System.out.println(csvList); }
			 */
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close(); // 사용 후 BufferedReader를 닫아준다.
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return csvList;
	}
}
