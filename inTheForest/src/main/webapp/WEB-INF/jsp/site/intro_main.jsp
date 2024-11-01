<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  h1+img {
    display: block;
    margin: 0 auto;
    height: 500px;
  }
  table {
    word-break: keep-all;
  }
  table tr td:last-of-type {
    text-align: left;
  }
</style>

<div class="container">
  
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb" style="margin-top:20px">
      <li class="breadcrumb-item"><a href="/inTheForest/main.do">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">시설안내</li>
    </ol>
  </nav>
  
  <h1 class="fw-bolder mt-4">시설안내</h1>
        
  <img src="assets/site/intro/guidemap.png" alt="guidemap">
  
  <div class="row">
    <div class="col text-center">
      <button type="button" class="btn btn-success btn-lg fw-bolder m-4" onclick="location.href = '#'">카라반</button>
      <button type="button" class="btn btn-success btn-lg fw-bolder m-4" onclick="location.href = '#'">오토캠핑</button>
      <button type="button" class="btn btn-success btn-lg fw-bolder m-4" onclick="location.href = '#'">데크캠핑</button>
    </div>
  </div>
  
  <h4 class="mt-4 fw-bolder">시설현황</h4>
  <table class="table align-middle text-center mb-5">
  
    <thead>
    <tr class="table-light">
      <th class="text-center">구분</th>
      <th>시설명</th>
      <th>사이트 수</th>
      <th>비고</th>
    </tr>
    </thead>
  
    <tbody>
      <tr>
        <td rowspan="3" class="table-success text-center">캠핑시설</td>
        <td>카라반</td>
        <td>0</td>
        <td>카라반 사이즈 : 3 × 7M<br>※ 카라반 1대 당 등록차량 2대 주차</td>
      </tr>
      <tr>
        <td>오토캠핑장</td>
        <td>0</td>
        <td>캠핑 공간 : 5 × 9M<br>주차 공간 : 3 × 6M<br>※ 1개 사이트 당 등록차량 1대 주차</td>
      </tr>
      <tr>
        <td>데크캠핑장</td>
        <td>0</td>
        <td>데크 사이즈 : 4 × 6M</td>
      </tr>
      <tr>
        <td rowspan="2" class="table-success text-center">공용시설</td>
        <td>야외 샤워실</td>
        <td>4</td>
        <td>데크캠핑장(2), 오토캠핑장(2)</td>
      </tr>
      <tr>
        <td>바베큐장</td>
        <td>1</td>
        <td>관리사무소에 필요 물품 구비</td>
      </tr>
      <tr>
        <td rowspan="3" class="table-success text-center">주차장</td>
        <td>카라반 구역</td>
        <td>30</td>
        <td>카라반 1대당 등록차량 2대 주차</td>
      </tr>
      <tr>
        <td>오토 구역</td>
        <td>20</td>
        <td>1개 사이트당 등록차량 1대 주차</td>
      </tr>
      <tr>
        <td>입구</td>
        <td>30</td>
        <td>데크 이용객 및 기타 방문객은 1개 사이트당 등록차량 1대 주차</td>
      </tr>
      <tr>
        <td class="table-success text-center">기타</td>
        <td>분리수거장</td>
        <td>2</td>
        <td>관리사무소 옆 위치</td>
      </tr>
    </tbody>
  
  </table>
  
</div>