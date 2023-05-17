
import React, { useEffect } from "react";
import     "../Upload/styles.css";

export const Upload = () => {

  setTimeout(() => { 

      try {
        document.querySelector(".btn").addEventListener("click",function () { 
          document.querySelector("input").click();

          document.getElementById('fileID')
          .addEventListener('change', getFile)
           
      })
      function getFile(event) {
        const input = event.target
        if ('files' in input && input.files.length > 0) {
          placeFileContent(
            document.getElementById('content-target'),
            input.files[0])
        }
      }
      
      function placeFileContent(target, file) {
        readFileContent(file).then(content => {
          target.value = content;
          document.getElementById('content-target').innerHTML = content

          // // отправляем через xhr
          // var xhr = new XMLHttpRequest();
          // xhr.onload = function() {
          //     console.log("Отправка завершена");
          //     console.log(xhr);
          // };
          // xhr.open("post", "/fileUpload", true);
          // xhr.send(formData);


        }).catch(error => console.log(error))
      }
      
      function readFileContent(file) {
        const reader = new FileReader()
        return new Promise((resolve, reject) => {
          reader.onload = event => resolve(event.target.result)
          reader.onerror = error => reject(error)
          reader.readAsText(file)
        })
      }
      } catch (error) {
        
      } 
  }, 2000);

  return (
    <div className="UploadContainer">
      <h1>Загрузка файлов</h1>


      <div className="container">
        <div className="card">  

        <div className="drop_box"> 
            <p>Поддерживаемые файлы: PDF, TEXT, DOC , DOCX</p>
            <input type="file" hidden accept=".doc,.docx,.pdf,.txt" id="fileID"  ></input>
            <button className="btn">Выберите Файл</button>
          </div>

          <p id="content-target"></p>
        </div>
      </div>
    </div>
  );
};
