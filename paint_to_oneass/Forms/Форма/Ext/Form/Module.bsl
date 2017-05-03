&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ХТМЛ = ПолучитьТекст();
	ТекущийЦвет = "Синий";
	УстановитьЗаголовокЦвета();
	ТекущийРазмер = "Маленький";
	УстановитьЗаголовокРазмера();
КонецПроцедуры

Функция ПолучитьТекст()
	
	Текст = "<!DOCTYPE html>
			 |<html>
             |<head>
			 |<meta http-equiv='X-UA-Compatible' content='IE=edge'>
             |    <style>
             |        body {
             |            background: white;
             |        }
             |        
             |        .Toolbar {
             |            float: left;
             |            font-family: ''Trebuchet MS'';
             |            font-size: 14px;
             |            font-variant: small-caps;
             |            text-align: center;
             |            background: #F2F7FE;
             |            padding: 10px 15px 3px 10px;
             |            margin-bottom: 1px;
             |            margin-right: 1px;
             |            border: 1px solid #7B899B;
             |        }
             |        
             |        .Toolbar button {
             |            padding: 6px;
             |            margin: 7px 2px;
             |            font-variant: normal;
             |            font-size: 12px;
             |        }
             |        
             |        .CanvasContainer {
             |            clear: both;
             |        }
             |        
             |        canvas {
             |            border: 1px solid #7B899B;
             |        }
             |        
             |        img {
             |            padding: 2px;
             |            border: 2px solid #F2F7FE;
             |        }
             |        
             |        img:hover {
             |            border: 2px groove #E4F0FE;
             |            background: white;
             |        }
             |        
             |        img.Selected {
             |            border: 2px groove #E4F0FE;
             |        }
             |        
             |        #savedCopyContainer {
             |            display: none;
             |        }
             |        
             |        #savedCopyContainer img {
             |            width: 250px;
             |            height: 150px;
             |        }
             |    </style>
             |    <script>
             |        var canvas;
             |        var context;
			 |        var isDrawing;
             |        var imageCopy;
			 |
             |        window.onload = function () {
             |            canvas = document.getElementById('drawingCanvas');
             |            context = canvas.getContext('2d');
             |
             |            // Подключаем требуемые для рисования события
             |            canvas.onmousedown = startDrawing;
             |            canvas.onmouseup = stopDrawing;
             |            canvas.onmouseout = stopDrawing;
             |            canvas.onmousemove = draw;
			 |			  changeColor('rgb(0,86,166)');
			 |			  changeThickness(1);
             |        }
             |
             |
             |        function changeColor(color) {
             |            // 	Меняем текущий цвет рисования
             |            context.strokeStyle = color;
             |        }
             |
             |        function changeThickness(thickness, imgElement) {
             |            // Изменяем текущую толщину линии
             |            context.lineWidth = thickness;
			 |        }
             |
             |        function startDrawing(e) {
             |            // Начинаем рисовать
             |            isDrawing = true;
             |
             |            // Создаем новый путь (с текущим цветом и толщиной линии) 
             |            context.beginPath();
             |
             |            // Нажатием левой кнопки мыши помещаем ""кисть"" на холст
             |            context.moveTo(e.pageX - canvas.offsetLeft, e.pageY - canvas.offsetTop);
             |        }
             |
             |        function draw(e) {
             |            if (isDrawing == true) {
             |                // Определяем текущие координаты указателя мыши
             |                var x = e.pageX - canvas.offsetLeft;
             |                var y = e.pageY - canvas.offsetTop;
             |
             |                // Рисуем линию до новой координаты
             |                context.lineTo(x, y);
             |                context.stroke();
             |            }
             |        }
             |
             |        function stopDrawing() {
             |            isDrawing = false;
             |        }
             |
             |        function clearCanvas() {
             |            context.clearRect(0, 0, canvas.width, canvas.height);
             |        }
             |
             |        function saveCanvas() {
             |
             |            // Отображаем данные холста в элементе <img>
             |            imageCopy = canvas.toDataURL();
             |
             |        }
             |    </script>
             |</head>
             |<body>
             |    <div class=""CanvasContainer"">
             |        <canvas id=""drawingCanvas"" width=""640"" height=""480""></canvas>
             |    </div>
             |</body>
             |</html>";
	
	Возврат Текст;
		
КонецФункции

&НаКлиенте
Процедура Сохранить(Команда)
	
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.saveCanvas();
	СырыеДанные = ОкноБраузера.imageCopy;
	СтрокаДанные = СтрЗаменить(СырыеДанные, "data:image/png;base64,", "");
	
	Если Модифицированность Тогда
		ДвоичныеДанные = Base64Значение(СтрокаДанные);
		Файл = ПолучитьИмяВременногоФайла("png");
		ДвоичныеДанные.Записать(Файл);
		сообщить("данные сохранены");
	Иначе
		сообщить("нет данных для сохранения");
	КонецЕсли; 
	
КонецПроцедуры

&НаКлиенте
Процедура Очистить(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.clearCanvas();
КонецПроцедуры

&НаКлиенте
Функция ПолучитьОкноБраузера()
	ДокументПервогоБраузера = Элементы.ХТМЛ.Документ;
	ОкноБраузера = ДокументПервогоБраузера.parentWindow; // IE
	Возврат ОкноБраузера;
КонецФункции

&НаКлиенте
Процедура ХТМЛПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	Модифицированность = Истина;	
КонецПроцедуры

&НаКлиенте
Процедура ЦветЗеленый(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.changeColor("rgb(131,190,61)");
	ТекущийЦвет = "Зеленый";
	УстановитьЗаголовокЦвета();
КонецПроцедуры

&НаКлиенте
Процедура ЦветКрасный(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.changeColor("rgb(212,21,29)");
	ТекущийЦвет = "Красный";
	УстановитьЗаголовокЦвета();
КонецПроцедуры

&НаКлиенте
Процедура ЦветСиний(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.changeColor("rgb(0,86,166)");
	ТекущийЦвет = "Синий";
	УстановитьЗаголовокЦвета();
КонецПроцедуры

&НаКлиенте
Процедура ЦветЧерный(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.changeColor("rgb(0,0,0)");
	ТекущийЦвет = "Черный";
	УстановитьЗаголовокЦвета();
КонецПроцедуры

&НаКлиенте
Процедура РазмерБольшой(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.changeThickness(10, "this");
	ТекущийРазмер = "Большой";
	УстановитьЗаголовокРазмера();
КонецПроцедуры

&НаКлиенте
Процедура РазмерМаленький(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.changeThickness(1, "this");
	ТекущийРазмер = "Маленький";
	УстановитьЗаголовокРазмера();
КонецПроцедуры

&НаКлиенте
Процедура РазмерСредний(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.changeThickness(5, "this");
	ТекущийРазмер = "Средний";
	УстановитьЗаголовокРазмера();
КонецПроцедуры

Процедура УстановитьЗаголовокЦвета()
	Элементы.ГруппаЦвета.Заголовок = ТекущийЦвет;
КонецПроцедуры	

Процедура УстановитьЗаголовокРазмера()
	Элементы.ГруппаРазмер.Заголовок = ТекущийРазмер;
КонецПроцедуры	
