# Использвание xememoir

Это проект разработки универсального стиля для повседневного использования
при написании моих конспектов.
В планах разработка для beamer и других классов.
Приветсвую дополнения, замечания.

## Установка в систему

Для установки в систему надо инсталировать модули через исталяционный скрипт
В систему установятся только ссылки н файл, таким образом клонированный
с GitHub проект останется без изменений и создав свой бранч вы сможете
вносить изменения а впродакшене окатится до ветке main/

Таким образом вы сможете проверить свои теории не ломая рабочую систему.

## Тест работы

Загрузи этот код для теста
documentclass{memoir}
\usepackage[
bookstyle=academic,
graphicstyle=colorful,
liberation
]{xememoir}

\begin{document}

Тест шрифтов. Это длинное слово для проверки переноса: электромагнитный.
Ещё одно: международный. И ещё: администра\-тивно-терри\-тори\-аль\-ный.
Проверки Текущий текста 0 0 одно : качестве ещё международный. Scale Тест И для
слов несколько международный. документ Это содержит слово для качестве слов
0 качестве шрифтов. Тест : административно-территориальный. качестве слов Е
щё :
документ : фраз слово содержит в нескольких точках.
Есть ли изменения?

\begin{figure}
\centering
\begin{tikzpicture}
\draw[accent] (0,0) circle (1.5cm);
\node at (0,0) {Цветной акцент!};
\end{tikzpicture}
\caption{Цветная схема}
\end{figure}
\end{document}

## Опции пакета xememoir

\usepackage[опция1, опция2, ...]{xememoir}

### Выбор шрифтов

msfonts Times New Roman, Arial, Courier New (по умолчанию)
liberation Liberation Serif/Sans/Mono
cmu Computer Modern Unicode
Если не указана — используется msfonts

## Типографские профили макета (bookstyle=)

bookstyle=classic Традиционная книга (ГОСТ-дружелюбная, стиль глав dash )

bookstyle=modern Минимализм, тонкие линии, стиль bianchi

bookstyle=academic Диссертация / отчёт ( default - поля под переплёт)

bookstyle=poetry Поэтический сборник ( ell, широкие поля)

bookstyle=technical Техническая документация (veelo, узкие поля)

bookstyle=elegant Издательский шик (pedersen)

bookstyle=compact Экономия места ( lyhne , мелкий шрифт)

bookstyle=bold Акцент на заголовках ( komalike, sans-serif)

💡 Если не указана — используется bookstyle=classic.

## Стили графики (graphicstyle=)

graphicstyle=classic Чёрно-белая, ГОСТ-совместимая графика

graphicstyle=colorful Полноцветная, насыщенная палитра

graphicstyle=minimal Тонкие линии, минимализм

graphicstyle=technical Схемы, чертежи, технические цвета

graphicstyle=presentation Крупные элементы, контрастные цвета

Если не указана — используется graphicstyle=classic.

## Стили списков (liststyle=)

liststyle=gost а), б), в) → 1), 2), 3) (по ГОСТ 2.105-95)

liststyle=numeric 1) → 1.1) → 1.1.1)

liststyle=mixed 1) → а) → A)

liststyle=alpha a) → 1) → а)

## Пример использования

\usepackage[
bookstyle=academic,
graphicstyle=colorful,
liststyle=mixed,
liberation
]{xememoir}

Диссертация с цветной графикой, списками в стиле 1) → а) → A) и
Liberation-шрифтами.

## Примечания

    Все опции взаимоисключающие внутри группы (например, нельзя одновременно msfonts и liberation).
    Порядок опций не важен.
    Неподдерживаемые опции вызывают предупреждение:
    Package xememoir Warning: Unknown option '...'.

### Предупреждения в логе

Предупреждения математического модуля а именно пакета unicode-math не удается
подавить. Так что либо комментируем \RequirePackage{unicode-math} и
сответственно \setmathfont{latinmodern-math.otf}или игнорируем
эти предупреждения. В релизе пока оставил закомментированым этот блок

### Примеры использвангия перенесенные из математического блока

%Примеры использования:
%Температура составляет \m{25\gC}. % Выведет: Температура составляет $25^\circ\mathrm{C}$.
%Угол равен \m{90\}. % Выведет: Угол равен $90^\circ$.

% Примеры использования:
%\m{x + y = z} % Выведет: $x + y = z$
%\mm{\int*a^b f(x) \, dx} % Выведет: \(\int_a^b f(x) \, dx\)
%\md{\sum*{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}} % Выведет формулу в отдельной строке

%%% --- Подключение единиц измерения (по необходимости) --- %%%
% Версия пакета должна соответствовать установленной системе.
% Синтаксис для v2:
%\RequirePackage[
% locale = RU,
% detect-all,
% per-mode = symbol,
% separate-uncertainty,
% fraction-function = \sfrac
%]{siunitx}[=v2]

%\sisetup{
% inter-unit-product = \ensuremath{{}\cdot{}}
%}

% Альтернативная конфигурация (v3+, требует иного синтаксиса):
% \RequirePackage{siunitx} % + \sisetup{...} в новом формате

% 📌 Пакет siunitx не активируется по умолчанию, только если используется явно.
% Оставлен в закомментированном виде — активируйте при необходимости.

%%% --- Дополнительно (расширение) --- %%%
% 📎 Можно подключать physics, если не требуется строгое ГОСТ-оформление:
% \RequirePackage{physics}

% Примеры использования модуля (в виде комментариев)
%
% 1. Использование команды \R:
% \[
% x \in \R
% \]
%
% 2. Использование команды \dd для производной:
% \[
% \dd{f(x)}{x} = \lim\_{h \to 0} \frac{f(x+h) - f(x)}{h}
% \]
%
% 3. Использование команды \abs для модуля:
% \[
% \abs{x + y} \leq \abs{x} + \abs{y}
% \]
%
% 4. Оформление теоремы:
% \begin{theorem}
% Пусть $f(x)$ — непрерывная функция на отрезке $[a, b]$. Тогда существует точка $c \in [a, b]$, такая что:
% \[
% \int_a^b f(x) \, \mathrm{d}x = f(c) \cdot (b - a).
% \]
% \end{theorem}
%
% 5. Выделение части формулы красным цветом:
% \[
% E = mc^2 + \highlight{\frac{1}{2}mv^2}
% \]
%
% 6. Построение графика с помощью pgfplots:
% \begin{tikzpicture}
% \begin{axis}[
% xlabel=$x$,
% ylabel={$f(x)$}
% ]
% \addplot {x^2};
% \end{axis}
% \end{tikzpicture}

### Проверить установку шрифтов

tlmgr list --only-installed | grep -i latinmodern

kpsewhich latinmodern-math.otf

### Прорверить какие коллекции шрифтов установлены

tlmgr info collection-fontsrecommended

### Установить коллекцию шрифтов

tlmgr install collection-fontsrecommended

## Списки. По умолчанию ГОСТ

### Как использвать?

\usepackage[
bookstyle=academic,
liststyle=mixed, % 1) → а) → A)
msfonts
]{xememoir}

## Таблицы

Что такое «расширенные столбцы» (array)?

Пакет array позволяет задавать сложные форматы столбцов, например:

    Автоматически добавлять символы в начало/конец ячейки,
    Выравнивать по математике,
    Задавать фиксированную ширину с выравниванием.

Примеры спецификаторов:
l,c,r Стандартные: лево, центр, право
p{3cm} Параграфный столбец, ширина 3 см, выравнивание по ширине
m{3cm} По центру по вертикали (требует array )

"> {\bfseries}l" Все ячейки в столбце — жирные

"> {$}c<{$}" Столбец в математическом режиме

## Пример

\begin{tabular}{| >{\bfseries}l | >{$}c<{$} |}
\hline
Имя переменной & \text{Формула} \\
\hline
Энергия & E = mc^2 \\
\hline
\end{tabular}

- Первый столбец — жирный, второй — автоматически в $...$.

## Что такое «управление содержимым ячейки» (makecell)?

Пакет makecell даёт тонкий контроль над оформлением отдельных ячеек:

\makecell{...} Позволяет перенос строк внутри ячейки (даже в l/c/r !)

\thead{...} Заголовок ячейки: жирный + центрирование

\Gape[<нижний>][<верхний>]{...} Добавляет вертикальные отступы вокруг
содержимого

## Пример

\begin{tabular}{|l|c|}
\hline
\thead{Длинный\\ заголовок} & \makecell{Много\\ строк\\ в ячейке} \\
\hline
Обычный текст & Одна строка \\
\hline
\end{tabular}

- Без makecell перенос в l/c/r не работает.

## Пример использования для таблиц

% Пример таблицы по ГОСТ
\begin{table}[ht]
\centering
\topcaption{Сравнение шрифтов}
\begin{tabularx}{\textwidth}{lX}
\toprule
Шрифт & Описание \\
\midrule
Times New Roman & Стандартный для ГОСТ \\
\newrow
Liberation & Свободная альтернатива \\
\bottomrule
\end{tabularx}
\end{table}

% Таблица на несколько страниц
\begin{xltabular}{\textwidth}{lX}
\caption{Длинная таблица} \\
\toprule
Параметр & Значение \\
\midrule
\endfirsthead

\multicolumn{2}{c}{{\bfseries Продолжение таблицы}} \\
\toprule
Параметр & Значение \\
\midrule
\endhead

\bottomrule
\endlastfoot

Температура & 25\,\si{\celsius} \\
Давление & 101.3\,\si{\kilo\pascal} \\
% ... много строк ...
\end{xltabular}

## Пример таблицы по ГОСТ:

% \begin{table}[ht]
% \centering
% \topcaption{Пример таблицы по ГОСТ}
% \begin{tabularx}{\textwidth}{XX}
% \toprule
% Колонка 1 & Колонка 2 \\
% \midrule
% Данные & Данные \\
% \newrow
% Ещё данные & Ещё данные \\
% \bottomrule
% \end{tabularx}
% \end{table}

## Настройка подписей через memoir (без caption!)

В memoir не нужно подключать \usepackage{caption}.
Вместо этого — используй встроенные команды:
\captionstyle{<команды>} Общий стиль подписи (выравнивание, отступы)
\captionnamefont{<шрифт>} Шрифт для «Таблица 1», «Рисунок 2»
\captiontitlefont{<шрифт>} Шрифт для текста подписи
\captiondelim{<разделитель>} Что между «Таблица 1» и текстом (по умолчанию :)

- Получишь: «Таблица 1. Сравнение параметров» — как требует ГОСТ 2.105-95.

## Полный пример: таблица по ГОСТ с объединением

\begin{table}[ht]
\centering
\caption{Сравнение шрифтов}
\begin{tabular}{lcc}
\toprule
\multicolumn{2}{c}{Группа шрифтов} & Размер \\
\cmidrule(r){1-2}\cmidrule(l){3-3}
Семейство & Тип & (pt) \\
\midrule
Times New Roman & Serif & 12 \\
Arial & Sans & 12 \\
\bottomrule
\end{tabular}
\end{table}
