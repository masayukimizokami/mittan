// OpenWeatherAPIを使用しています。下記URLからアカウントを作成し、
// APIキー情報を利用してAPI_KEY変数に上書きしてください。
// https://openweathermap.org/

// API_KEYはアカウント登録した際のAPIキーを使用して下さい
const API_KEY = "***";

window.onload = function () {
  weather_search();
};

const wheather_select = document.querySelector("#wheather-select");
const options = document.querySelectorAll("#wheather-select option");
const weather_search = function () {
  const index = this.selectedIndex;
  const city_id = index ? options[index].value : wheather_select.value;
  const url =
    "http://api.openweathermap.org/data/2.5/forecast?id=" +
    city_id +
    "&appid=" +
    API_KEY;

  fetch(url)
    .then((data) => {
      return data.json();
    })
    .then((json) => {
      let insertHTML = "";
      let tomorrow = 8;
      let weather = document.querySelector("#weather");
      insertHTML += buildHTML(json, tomorrow);
      weather.innerHTML = insertHTML;
    })
    .catch((error) => {
      console.error(error);
    });
};

wheather_select.addEventListener("change", weather_search);

function buildHTML(data, i) {
  let Week = new Array(
    "（日）",
    "（月）",
    "（火）",
    "（水）",
    "（木）",
    "（金）",
    "（土）"
  );
  let date = new Date(data.list[i].dt_txt);
  date.setHours(date.getHours() + 3);
  let month = date.getMonth() + 1;
  let day =
    month +
    "月" +
    date.getDate() +
    "日" +
    Week[date.getDay()] +
    date.getHours() +
    "：00";
  let icon = data.list[i].weather[0].icon;
  let main = weatherJavaneseConversion(data.list[i].weather[0].main);

  let html =
    '<div class="weather-report">' +
    "<h2>明日の天気は" +
    main +
    "です！</h2>" +
    '<img src="http://openweathermap.org/img/w/' +
    icon +
    '.png">' +
    '<div class="weather-date">' +
    day +
    "</div>" +
    "</div>";
  return html;
}

function weatherJavaneseConversion(name) {
  switch (name) {
    case "Clear":
      return "晴れ";
    case "Clouds":
      return "曇り";
    case "Rain":
      return "雨";
    case "Snow":
      return "雪";
    default:
      console.log(name);
      return name;
  }
}
