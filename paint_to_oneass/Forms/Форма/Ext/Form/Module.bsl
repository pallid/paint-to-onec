//&НаКлиенте
//Перем ОкноБраузера;

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Реквизит1 = получитьтекст();
КонецПроцедуры

Функция ПолучитьТекст()
	текст = "<!DOCTYPE html>
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
			 |         var isDrawing;
             |        var previousColorElement;
             |        // Отслеживаем элемент <img> для толщины линии, по которому ранее щелкнули
             |        var previousThicknessElement;
             |        //var url = canvas.toDataURL(""image/jpeg"");
             |
             |        //window.location = canvas.toDataURL();
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
			 |			  changeColor('rgb(0,86,166)', this);
			 |			  changeThickness(1, this);
             |        }
             |
             |
             |        function changeColor(color, imgElement) {
             |            // 	Меняем текущий цвет рисования
             |            context.strokeStyle = color;
             |
             |            // Меняем стиль элемента <img>, по которому щелкнули
             |            imgElement.className = 'Selected';
             |
             |            // Возвращаем ранее выбранный элемент <img> в нормальное состояние
             |            if (previousColorElement != null)
             |                previousColorElement.className = """";
             |
             |            previousColorElement = imgElement;
             |        }
             |
             |        function changeThickness(thickness, imgElement) {
             |            // Изменяем текущую толщину линии
             |            context.lineWidth = thickness;
             |
             |            // Меняем стиль элемента <img>, по которому щелкнули
             |            imgElement.className = 'Selected';
             |
             |            // Возвращаем ранее выбранный элемент <img> в нормальное состояние
             |            if (previousThicknessElement != null)
             |                previousThicknessElement.className = """";
             |
             |            previousThicknessElement = imgElement;
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
			 //|            // Находим элемент <img>
			 //|            var imageCopy = document.getElementById(""savedImageCopy"");
             |
             |            // Отображаем данные холста в элементе <img>
             |            imageCopy = canvas.toDataURL();
             |
			 //|            // Показываем элемент <div>, делая изображение видимым
			 //|            // делая изображение видимым
			 //|            var imageContainer = document.getElementById(""savedCopyContainer"");
			 //|            imageContainer.style.display = ""block"";
             |        }
             |    </script>
             |</head>
             |<body>
			 //|    <div class=""Toolbar"">
			 //|        - Цвет -<br>
			 ////|        <img id=""redPen"" src=""http://professorweb.ru/downloads/pen_red.gif"" alt=""Красная кисть"" onclick=""changeColor(''rgb(212,21,29)'', this)"">
			 ////|        <img id=""greenPen"" src=""http://professorweb.ru/downloads/pen_green.gif"" alt=""Зеленая кисть"" onclick=""changeColor(''rgb(131,190,61)'', this)"">
			 ////|        <img id=""bluePen"" src=""http://professorweb.ru/downloads/pen_blue.gif"" alt=""Синяя кисть"" onclick=""changeColor(''rgb(0,86,166)'', this)"">
			 // |        <img id=""redPen"" alt=""Красная кисть"" onclick=""changeColor('rgb(212,21,29)', this)"">
			 //|        <img id=""greenPen""  alt=""Зеленая кисть"" onclick=""changeColor('rgb(131,190,61)', this)"">
			 //|        <img id=""bluePen""  alt=""Синяя кисть"" onclick=""changeColor('rgb(0,86,166)', this)"">

			 //|    </div>
			 //|    <div class=""Toolbar"">
			 //|        - Толщина -<br>
			 ////|        <img src=""http://professorweb.ru/downloads/pen_thin.gif"" alt=""Тонкая кисть"" onclick=""changeThickness(1, this)"">
			 ////|        <img src=""http://professorweb.ru/downloads/pen_medium.gif"" alt=""Нормальная кисть"" onclick=""changeThickness(5, this)"">
			 ////|        <img src=""http://professorweb.ru/downloads/pen_thick.gif"" alt=""Толстая кисть"" onclick=""changeThickness(10, this)"">
			 // |        <img  alt=""Тонкая кисть"" onclick=""changeThickness(1, this)"">
			 //|        <img  alt=""Нормальная кисть"" onclick=""changeThickness(5, this)"">
			 //|        <img  alt=""Толстая кисть"" onclick=""changeThickness(10, this)"">
			 //|    </div>
             |    <div class=""CanvasContainer"">
             |        <canvas id=""drawingCanvas"" width=""640"" height=""480""></canvas>
             |    </div>
			 //|    <div class=""Toolbar"">
			 //|        - Операции-<br>
			 //|        <button id = ""saveCanvas"" onclick=""saveCanvas()"">Сохранить содержимое Canvas</button>
			 //|        <button onclick=""clearCanvas()"">Очистить Canvas</button>
			 //|        <div id=""savedCopyContainer"">
			 //|            <img id=""savedImageCopy""><br> Щелкните правой кнопкой мыши для сохранения ...
			 //|        </div>
			 //|    </div>
             |</body>
             |</html>";
	
	возврат текст;
	
	
КонецФункции


&НаКлиенте
Процедура Реквизит1ПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	//Если ДанныеСобытия.button <> Неопределено Тогда   		
	//	
	//	Если ДанныеСобытия.button.id = "saveCanvas" Тогда
	//		СырыеДанные = ЭтаФорма.Элементы.Реквизит1.Документ.images.savedImageCopy.href;
	//		временный = ПолучитьИмяВременногоФайла("png");
	//		//ДД = Новый ДвоичныеДанные;
	//	КонецЕсли; 
	//	//ПолучитьИОбработатьДанные();		
	//КонецЕсли; 	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	//перем ОкноБраузера;
	//ОкноБраузера = Элементы.Реквизит1.Документ.parentWindow;
КонецПроцедуры
 
&НаКлиенте
Процедура ПолучитьИОбработатьДанные()Экспорт
	//ОкноДок=ЭтаФорма.Элементы.ХТМЛ.Документ.parentWindow;
	//Если ОкноДок=Неопределено  Тогда   
	//	ОкноДок=ЭтаФорма.Элементы.ХТМЛ.Документ.defaultView;
	//КонецЕсли; 
	//
	//Пока ОкноДок.queueHead<ОкноДок.queueTail Цикл //Если есть что-то в очереди
	//	Данные=JSON_В_Объект(ОкноДок.getEvent(ОкноДок.queueHead+1));
	//	ОкноДок.queueHead=ОкноДок.queueHead+1;
	//	ВсегоСобытий=ВсегоСобытий+1;
	//	Сообщить("X="+Данные.x+" Y="+Данные.y+" Всего событий="+ВсегоСобытий); 				
	//КонецЦикла; 
	
КонецПроцедуры // 

&НаКлиенте
Процедура Сохранить(Команда)
	
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.saveCanvas();
	СырыеДанные = ОкноБраузера.imageCopy;
	СтрокаДанные = СтрЗаменить(СырыеДанные, "data:image/png;base64,", "");
	
	Если НЕ ПустыеДанные(СтрокаДанные) Тогда
		ДвоичныеДанные = Base64Значение(СтрокаДанные);
		Файл = ПолучитьИмяВременногоФайла("png");
		ДвоичныеДанные.Записать(Файл);
		СохранитьНаСервере(СтрокаДанные);
		сообщить("данные сохранены");
	Иначе
		сообщить("нет данных для сохранения");
	КонецЕсли; 
	
КонецПроцедуры

&НаСервере
Процедура СохранитьНаСервере(СтрокаДанные)	
	// ДвоичныеДанные = Base64Значение(СтрокаДанные); 
КонецПроцедуры

&НаКлиенте
Процедура Очистить(Команда)
	ОкноБраузера = ПолучитьОкноБраузера();
	ОкноБраузера.clearCanvas();
КонецПроцедуры

&НаКлиенте
Функция ПолучитьОкноБраузера()
	ДокументПервогоБраузера = Элементы.Реквизит1.Документ;
	ОкноБраузера = ДокументПервогоБраузера.parentWindow; // IE
	Возврат ОкноБраузера;
КонецФункции

Функция ПустыеДанные(ДанныеДляСравнения)
	
	Результат = Ложь;
	ЭталонПустыхДанных = "iVBORw0KGgoAAAANSUhEUgAAAoAAAAHgCAYAAAA10dzkAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAS+SURBVHhe7cEBDQAAAMKg909tDjcgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACACzXC7gAB9GuoowAAAABJRU5ErkJggg==";
	
	Если ДанныеДляСравнения = ЭталонПустыхДанных Тогда	
		Результат = Истина;	
	КонецЕсли; 
	
	Возврат Результат;
	
КонецФункции // ПустыеДанные()