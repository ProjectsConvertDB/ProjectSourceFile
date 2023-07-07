<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style type="text/css">
.gray-text {
	color: gray;
}
.divstyle {
    height: 300px;
    weight: 500px;
    overflow-y : scroll;
}
</style>
<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

window.onload = function() { 
    document.getElementById("btnStart").onclick = function() { 
        readFile(); 
    }
    
} 
 var you;
function readFile() { 
    var file = document.getElementById("file").files[0]; 
    document.getElementById("filename").textContent = file.name; 
    document.getElementById("filesize").textContent = "("+file.size+" byte)"; 
     
    var reader = new FileReader(); 
    reader.onload = function() { 
        var display = document.getElementById("content");
        var table = document.createElement("table");
        var csv = reader.result;
        var rows = csv.trim().split('\n');
        
        for(var i= 0; i < rows.length; i++) {
	        var cells = rows[i].split(',');
	        var row = document.createElement("tr");
	    
	        for (var j = 0; j < cells.length; j++) {
	            var cell = document.createElement("td");
	            cell.textContent = cells[j];
	            row.appendChild(cell);
	        }
	        	table.appendChild(row);
	        	
		        
	    }
        display.innerHTML = "";
        display.appendChild(table);
        //console.log(table);
        regcsv(reader.result);
    } 
    reader.onerror = function(e) { 
        alert("읽기 오류:"+e.target.error.code); 
        return; 
    } 
     
    var encodelist = document.getElementById("encoding"); 
    var encoding = encodelist.options[encodelist.selectedIndex].value; 
     
    reader.readAsText(file, encoding); 
    
} 
function regcsv(csv) {
    var rows = csv.trim().split('\n');
    var table = document.createElement("table");
    var inpContainer = document.getElementById("btn");
    
        var cells = rows[0].split(',');
        var row = document.createElement("tr");

        for (var j = 0; j < cells.length; j++) {
            var cell = document.createElement("td");
            cell.textContent = cells[j];
            row.appendChild(cell);
        }

        table.appendChild(row);
        
        while (inpContainer.firstChild) {
            inpContainer.removeChild(inpContainer.firstChild);
        }

    var cells = rows[0].split(',');
    you = cells.length;

    for (var i = 0; i < cells.length; i++) {
        var inpcon = document.createElement("input");
              
        inpcon.setAttribute("type", "checkbox");
        inpcon.value = i;
        inpcon.setAttribute("name" ,"colum");

        inpContainer.appendChild(inpcon);
        inpContainer.innerHTML += cells[i] + " " ;
        
    }
    
}
 
function regdata() {
	
 	var colum = document.getElementsByName("colum");
    
      
    var file = document.getElementById("file").files[0]; 
        
    var reader = new FileReader(); 
    reader.onload = function() { 
    	var table = document.createElement("table");
    	table.id = "tblName";
    	var regcsv = document.getElementById("regcsv");
    	var recontent = document.getElementById("recontent");
    	var rows = reader.result.trim().split('\n');
    	//테이블 생성
    	 for(var i= 0; i < rows.length; i++) {
    	        var cells = rows[i].split(',');
    	        var row = document.createElement("tr");
    	    
    	        for (var j = 0; j < cells.length; j++) {
    	            var cell = document.createElement("td");
    	            if(colum[j].checked == true) {
    	            	continue;
    	            }
    	            cell.textContent = cells[j];
    	            row.appendChild(cell);
    	        }
    	        	table.appendChild(row);
    	        	
    		        
    	    }
     	 regcsv.innerHTML = "";
 	        regcsv.appendChild(table);
            
                   
    }
    
    reader.readAsText(file); 
    

}
</script> 
<script type="text/javascript">
    class ToCSV {
        constructor() {
        // CSV 버튼에 이벤트 등록
        document.querySelector('#csvdown').addEventListener('click', e => {
            e.preventDefault()
            this.getCSV('mycsv.csv')
        })
    }

    downloadCSV(csv, filename) {
        let csvFile;
        let downloadLink;

        // CSV 파일을 위한 Blob 만들기
        csvFile = new Blob([csv], {type: "text/csv"})

        // Download link를 위한 a 엘리먼스 생성
        downloadLink = document.createElement("a")

        // 다운받을 csv 파일 이름 지정하기
        downloadLink.download = filename;

        // 위에서 만든 blob과 링크를 연결
        downloadLink.href = window.URL.createObjectURL(csvFile)

        // 링크가 눈에 보일 필요는 없으니 숨겨줍시다.
        downloadLink.style.display = "none"

        // HTML 가장 아래 부분에 링크를 붙여줍시다.
        document.body.appendChild(downloadLink)

        // 클릭 이벤트를 발생시켜 실제로 브라우저가 '다운로드'하도록 만들어줍시다.
        downloadLink.click()
    }

    getCSV(filename) {
        // csv를 담기 위한 빈 Array를 만듭시다.
        const csv = []
        const rows = document.querySelectorAll("#tblName tr")

        for (let i = 0; i < rows.length; i++) {
            const row = [], cols = rows[i].querySelectorAll("td, th")

            for (let j = 0; j < cols.length; j++)
                row.push(cols[j].innerText)

            csv.push(row.join(","))
        }

        // Download CSV
        this.downloadCSV(csv.join("\n"), filename)
    }
}

document.addEventListener('DOMContentLoaded', e => {
    new ToCSV()
})
    </script>    
</head>
<body>
  <h1>현재 기기 내의 파일 읽기</h1> 
    <input type="file" id="file"/> 
    <select id="encoding"> 
        <option>UTF-8</option> 
        <option>EUC-KR</option> 
    </select> 
    <button id="btnStart">읽기</button> 
     
    <br/> 
     
    <div> 
        <span id="filename">파일이름</span> 
        <span id="filesize">파일크기</span> 
    </div> 
     
    <div id="content" class="divstyle"></div> 
    <h1>컬럼 편집</h1>
    <div id="btn"></div>
    <button onclick="regdata()">적용</button>
    <br>
    <div id="regcsv" class="divstyle"></div>
    <button id="csvdown">다운로드</button>
    
  
</body>
</html>
