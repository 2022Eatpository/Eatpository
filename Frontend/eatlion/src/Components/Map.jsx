/* global kakao */
import React, { useEffect } from "react";
import { useLocation } from "react-router-dom";
import "../Css/Maps.css";

import ListAPI from "../API/ListAPI";
import { useState } from "react";
import axios from "axios";
const { kakao } = window;
const Map = () => {
  const [check, setCheck] = useState(true);

  const[storeList,setStorelist] =useState( JSON.parse(sessionStorage.getItem("result")));
  const [editorList,setEditorlist]=useState(JSON.parse(sessionStorage.getItem("listkey")));
  const [categoryList,setCategorylist] = useState(JSON.parse(sessionStorage.getItem("categorykey")));

  const [result,setResult] =useState((editorList+categoryList).split('').map(Number));

 
  // 첫 스위치 초기화
  useEffect(() => {
    for (let i = 0; i < 8; i++) {
      if (result[i] === 1) {
        document.getElementById(i).classList.toggle("clicked");
      }
    }

  }, []);

  // editor 혹은 category 클릭 시 result 변화
  const editorHandler = (e) => {
  
    let id = e.target.id;
    
    result[id]=!result[id]*1
  
    document.getElementById(id).classList.toggle("clicked");
  
    let editornum = result.slice(0, 4);
    
    editornum = editornum.join("");
    let categorynum = result.slice(4,8).join("");
  
    ListAPI(editornum, categorynum).then((response) => {
      sessionStorage.setItem("listkey", JSON.stringify(editornum));
      sessionStorage.setItem("categorykey", JSON.stringify(categorynum));
      setStorelist(JSON.parse(sessionStorage.getItem("result")));
    });
    
  };

  const number = storeList.length;
  const listitems = storeList.map((store) => {
    return (
      <div className="lists" key={store.id}>
        <div className="store_name">{store.store_name} </div>
        <div className="main_menu">{store.main_menu}</div>
      </div>
    );
  });
 
  //console.log(storeList);
  // 지도와 마커를 생성합니다
  useEffect(() => {
    const container = document.getElementById("map");
    const options = {
      center: new kakao.maps.LatLng(37.55036, 126.92544),
      level: 3,
    };
    const map = new kakao.maps.Map(container, options);

    const imageSrc = [
        "https://t1.daumcdn.net/cfile/blog/99B4DF445EAC451602",
        //"http://localhost:8000/static/images/mini1.png",
        //"https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
        "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
        "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png",
        "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png",
      ],
      imageSize = [
        new kakao.maps.Size(48, 52),
        new kakao.maps.Size(24, 35),
        new kakao.maps.Size(48, 52),
        new kakao.maps.Size(48, 52),
      ],
      imageOption = { offset: new kakao.maps.Point(10, 48) };

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

    
    for (var i = 0; i < storeList.length; i++) {
      var storeName = storeList[i].store_name;
      var markerpos = new kakao.maps.LatLng(
        storeList[i].latitude,
        storeList[i].longitude
      );

      if (storeList[i].user == 2) {
        var markerImage = new kakao.maps.MarkerImage(
          imageSrc[0],
          imageSize[0],
          imageOption
        );
      } else if (storeList[i].user == 3) {
        var markerImage = new kakao.maps.MarkerImage(
          imageSrc[1],
          imageSize[1],
          imageOption
        );
      } else if (storeList[i].user == 4) {
        var markerImage = new kakao.maps.MarkerImage(
          imageSrc[2],
          imageSize[2],
          imageOption
        );
      } else if (storeList[i].user == 5) {
        var markerImage = new kakao.maps.MarkerImage(
          imageSrc[3],
          imageSize[3],
          imageOption
        );
      }

      var marker = new kakao.maps.Marker({
        map: map,
        position: markerpos,
        image: markerImage,
      });

      marker.setMap(map);

      var content =
        '<div class="customoverlay">' +
        '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
        "  <span> " +
        storeName +
        " </span>" +
        "  </a>" +
        "</div>";

      var infowindow = new kakao.maps.CustomOverlay({
        map: map,
        content: content,
        position: marker.getPosition(),
      });

      // 마커에 마우스오버 이벤트를 등록합니다
      kakao.maps.event.addListener(marker, "mouseover", function () {
        // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow.setMap(map);
      });

      // 마커에 마우스아웃 이벤트를 등록합니다
      kakao.maps.event.addListener(marker, "mouseClick", function () {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow.setMap(null);
      });

    }
    
  
  }, [storeList]);

  // 리스트를 생성합니다


  return (
    <div>
      <div className="wrapper">
        <div className="sectionFirst">
          <p>원하는 에디터를 선택해주세요</p>
          <div className="cardsSection">
            <button onClick={editorHandler} className="card" id="0">
              송
            </button>
            <button onClick={editorHandler} className="card" id="1">
              큐
            </button>
            <button onClick={editorHandler} className="card" id="2">
              란
            </button>
            <button onClick={editorHandler} className="card" id="3">
              표
            </button>
          </div>
        </div>
        <div className="sectionSecond">
          <p>원하는 음식 종류를 선택해주세요</p>
          <div className="cardsSection">
            <button onClick={editorHandler} className="card" id="4">
              한식
            </button>
            <button onClick={editorHandler} className="card" id="5">
              중식
            </button>
            <button onClick={editorHandler} className="card" id="6">
              일식
            </button>
            <button onClick={editorHandler} className="card" id="7">
              양식
            </button>
          </div>
        </div>
        <div className="sectionThird">
          <p>
            지금 위치에서 가까운
            <br />
            {number}개의 먹킷리스트에요
          </p>
          <div className="title">
            <div className="subtext">상호명</div>
            <div className="subtext">대표메뉴</div>
          </div>
          <div className="listSection" id="table">
            {listitems}
          </div>
        </div>
        <div className="sectionForth">
          <button className="randomButton">
            랜덤으로 맛집을 추천받아볼까요?
          </button>
        </div>
      </div>
      <div
        id="map"
        style={{
          width: "100vw",
          height: "calc(100vh - 48px)",
        }}
      ></div>
    </div>
  );
};

export default Map;

