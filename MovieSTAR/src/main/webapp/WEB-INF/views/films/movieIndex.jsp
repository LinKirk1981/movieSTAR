<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../administrator/cssback.jsp"></jsp:include> 
</head>
<body class="hold-transition sidebar-mini">
<jsp:include page="../administrator/topback.jsp"></jsp:include> 

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">電影後臺</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <!-- 電影table -->
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 10%" class="text-center">
                    	編號
                      </th>
                      
                      <th style="width: 10%" class="text-center">
                    	電影名稱
                      </th>
                      
                      <th style="width: 10%" class="text-center">
                    	電影類型
                      </th>
                      
<!--                       <th style="width: 10%" class="text-center"> -->
<!--                     	圖片 -->
<!--                       </th> -->
                      
                      <th style="width: 5%" class="text-center">
                      	分級
                      </th>
                      
                      <th style="width: 10%" class="text-center">
                    	時長
                      </th>
                      
                      <th style="width: 25%" class="text-center">
                     	詳情
                      </th>
                      
                      <th style="width: 5%" class="text-center">
                    	狀態
                      </th>
                      <th style="width: 15%" class="text-center">
                      	操作
                      </th>
                      <th style="width: 20%" class="text-center">
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="mv" items="${allMovies}">
              
                <tr>
                      <td class="text-center">
                          ${mv.movieId}
                      </td>       
                      
                      <td class="text-center">
                          <a>
                              ${mv.movieName}
                          </a>
                          <br/>
                          <small>
                              ${mv.movieDate}
                          </small>
                      </td>
                      
                      <td class="text-center">
                          ${mv.movieType}
                      </td>
                      
<!--                       <td class="text-center"> -->
<%--                       <img src="${pageContext.request.contextPath}/image/${mv.movieId}.jpg" width="200px" height="200px"> --%>
<!--                       </td> -->
                      <td>
                          <ul class="list-inline">
                              <li class="list-inline-item">
                                  <img alt="Avatar" class="table-avatar" src="user/images/GSRR_${mv.movieRating}_logo.svg">
                              </li>

                          </ul>
                      </td>
                      <td class="text-center">
                          <a>
                              ${mv.movieDuration}
                          </a>
                      </td>
                      
                      <td class="text-center">
                         ${mv.movieDetail}
                      </td>
                      
                      <td class="text-center">
                          ${aa.get(mv.movieId-1)}
                      </td>
                      
                      
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="#">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/editMovie?id=${mv.movieId}">
                              <i class="fas fa-pencil-alt">
                              </i>
                         	編輯
                          </a>
                          <a class="btn btn-danger btn-sm" href="<%= request.getContextPath()%>/deleteMovie?id=${mv.movieId}">
                              <i class="fas fa-trash">
                              </i>
                          	刪除
                          </a>
                      </td>
                       <td>
                          <a>
                              
                          </a>
                          <br/>
                          
                      </td>
                  </tr>
                </c:forEach>
              </tbody>
          </table>
        </div>
        <jsp:include page="../administrator/footerback.jsp"></jsp:include> 
