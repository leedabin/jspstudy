<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, ch09.update.UpdateDataBean, ch09.update.UpdateDBBean"%>

<h3>암호화 전내용</h3>
<jsp:include page = "cryptProcessList.jsp" flush="false"/>

<%
	UpdateDBBean dbPro = UpdateDBBean.getInstance();
	dbPro.updateMember();
%>

<h3>암호화가 적용 된 후 내용</h3>

<jsp:include page = "cryptProcessList.jsp" flush="false"/>