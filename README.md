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

## Модуль TODO

% --- Пользовательские команды ---
\newcommand{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommand{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommand{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommand{\improvement}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommand{\thiswillnotshow}[2][1=]{\todo[disable,#1]{#2}}

% --- Inline-варианты ---
\long\def\intodo#1{\todo[inline]{#1}}
\long\def\todoin#1{\todo[inline]{#1}}

% --- Список задач на отдельной странице ---
\newcommand{\Заметки}{\newpage\listoftodos[Заметки]\newpage}
\newcommand{\Отр}{\todoin{Отработано}}

% 📌 Примечания:
% - Вы можете писать \unsure{Это точно?}, \change{Нужно переписать} и т.п.
% - Команды позволяют гибко маркировать блоки прямо в тексте.
% - \
%Теперь блок заметок изолирован, и его легко отключать/подключать в зависимости от режима (final или draft).

% 📌 Примечания:
% - В режиме final все заметки автоматически скрываются.
% - Чтобы включить final-режим, добавьте в преамбулу:
% \makeatletter\def\@final{}\makeatother
% - Или используйте \usepackage[final]{xememoir} (если реализовано).

## Как использовать в документе

% В черновике:
\unsure{Проверить формулу}
\change{Переписать абзац}
\inlinetodo{Добавить ссылку}

% В конце черновика:
\listoftodospage

% В финальной версии — добавь в преамбулу:
% \makeatletter\def\@final{}\makeatother
% → все заметки исчезнут автоматически.

## Примеры использлвания

\inlinetodo{Обычная заметка}
\inlinetodo[backgroundcolor=yellow]{Важно!}
\inlinetodo[linecolor=green,disable]{Скрыть в финале}

## Пакеты по требованию

% \RequirePackage{rotating} % Для sidewaystable
% \RequirePackage{pdflscape} % Для \begin{landscape}
% \RequirePackage{pdfpages} % Для вставки PDF

Они находятся в graphicssetup при необходимости снять комментарий

## Альбомные таблицы → есть два подхода:

Поворот одной таблицы (сохраняя вертикальную нумерацию страниц) = rotating= подключить
в → tablesetup.sty

Полностраничный альбом (всё содержимое лежит) = pdflscape = подключать в
→ опционально, в .tex-файле или снять комментарий

## Почему НЕ подключать pdflscape по умолчанию?

Потому что:

    он меняет ориентацию всей страницы, включая колонтитулы,
    в PDF-ридерах текст отображается «лёжа»,
    нарушает нумерацию при печати,
    редко нужен в книгах (чаще — в отчётах или презентациях).

👉 Если тебе всё же нужен полностраничный альбом — подключи вручную в .tex:

\usepackage{pdflscape}
...
\begin{landscape}
\begin{longtable}{...}
...
\end{longtable}
\end{landscape}

## Как использовать longtable в альбоме (рекомендуемый способ)

\begin{albtable}[Длинная таблица параметров]
\begin{xltabular}{\textheight}{lX}
\caption{Продолжение таблицы}\\
\toprule
Параметр & Описание \\
\midrule
\endfirsthead

    \multicolumn{2}{c}{{\bfseries Продолжение таблицы}} \\
    \toprule
    Параметр & Описание \\
    \midrule
    \endhead

    \bottomrule
    \endlastfoot

    Температура & 25\,\si{\celsius} \\
    Давление & 101.3\,\si{\kilo\pascal} \\
    % ... 50+ строк ...

\end{xltabular}
\end{albtable}

## Есть ли longtable в твоём tablesetup.sty?

Да, longtable подключён косвенно, потому что:

✅ xltabular автоматически загружает longtable и tabularx.

Ты можешь смело использовать \begin{longtable}...\end{longtable} — он будет работать.

Но лучше использовать
\begin{xltabular}...
\end{xltabular},
потому что он даёт:
автоматическую ширину столбцов (X-столбцы),
поддержку многостраничности,
совместимость с memoir.

## Совместим ли longtable с rotating?

\begin{sidewaystable}
\begin{longtable}{...}
...
\end{longtable}
\end{sidewaystable}

Это стандартный способ для альбомных таблиц на несколько страниц в книгах
и диссертациях.

💡 sidewaystable — это не landscape, а поворот только таблицы, при этом:
номер страницы остаётся вертикальным,
колонтитулы не ломаются,
PDF-ридер не требует поворота экрана.

## Примеры использования

✅ Пример 1: xltabular в альбомной ориентации (рекомендуется)
\usepackage{rotating} % в tablesetup.sty
\usepackage{xltabular} % уже есть

% В документе:
\begin{sidewaystable}
\centering
\caption{Длинная таблица параметров}
\begin{xltabular}{\textwidth}{lX}
\toprule
Параметр & Описание \\
\midrule
\endfirsthead

    \multicolumn{2}{c}{{\bfseries Продолжение таблицы}} \\
    \toprule
    Параметр & Описание \\
    \midrule
    \endhead

    \bottomrule
    \endlastfoot

    Температура & 25\,\si{\celsius} \\
    Давление & 101.3\,\si{\kilo\pascal} \\
    % ... 50+ строк ...

\end{xltabular}
\end{sidewaystable}

## ✅ Пример 2: Чистый longtable (если не нужна автоширина)

\begin{sidewaystable}
\centering
\caption{Простая длинная таблица}
\begin{longtable}{|l|l|}
\hline
Колонка 1 & Колонка 2 \\
\hline
\endfirsthead

    \multicolumn{2}{c}{{\bfseries Продолжение}} \\
    \hline
    Колонка 1 & Колонка 2 \\
    \hline
    \endhead

    \hline
    \endlastfoot

    Данные & Данные \\
    % ... много строк ...

\end{longtable}
\end{sidewaystable}

## Объяснение

    \textwidth — ширина текстового блока (включая все столбцы),
    l — левый выравненный столбец фиксированной ширины,
    X — автоматически растягиваемый столбец, который займёт оставшееся место.

✅ Это гарантирует, что таблица не вылезет за поля.

## Как задать столбец с фиксированной шириной?

\begin{xltabular}{\textwidth}{l p{4cm} X}
Заголовок & Фиксированный столбец (4 см) & Автоширина \\
\end{xltabular}

p{4cm} — параграфный столбец, ширина 4 см, переносы внутри работают.
Можно также: m{4cm} (по вертикали по центру), b{4cm} (по низу).

## Как уместить таблицу на странице?

Правила:

Всегда используй \textwidth как общую ширину.
Избегай абсолютных единиц вроде cm для всей таблицы — лучше относительные (\textwidth).
Не используй | (вертикальные линии) — ГОСТ запрещает.
Для альбома — оборачивай в \begin{sidewaystable}...\end{sidewaystable}.

\begin{xltabular}{\textwidth}{@{} l X @{}}
\toprule
Параметр & Описание \\
\midrule
Температура & Очень длинное описание, которое автоматически переносится... \\
\bottomrule
\end{xltabular}

@{} убирает лишние отступы по краям → таблица точно влезает.

## Нужен ли ltcaption?

Нет, не нужен — и вот почему:

    Ты используешь memoir, у которого встроенная поддержка подписей для longtable/xltabular.
    Пакет ltcaption — это обёртка для caption, а caption конфликтует с memoir.
    Ты уже настроил подписи через \captiondelim{. } и др. — этого достаточно.

👉 Удали \RequirePackage{ltcaption} из tablesetup.sty.

## Где должна быть подпись таблицы: сверху или снизу?

✅ По ГОСТ 2.105-95 — подпись к таблице — СВЕРХУ!

    «Над таблицей слева (без абзацного отступа) помещают слово «Таблица»...»

То есть:
\begin{table}
\caption{Сравнение параметров} % ← СВЕРХУ!
\begin{tabular}{...}
...
\end{tabular}
\end{table}

## А для longtable/xltabular:

\begin{xltabular}{\textwidth}{lX}
\caption{Длинная таблица} \\ % ← тоже СВЕРХУ!
\toprule
...
\end{xltabular}

Это отличает таблицы от рисунков (подписи к рисункам — снизу).

## Как совмещается \captiondelim{. } с xltabular?

✅ Полностью совместимо!

    memoir применяет \captiondelim, \captionnamefont и т.д. ко всем окружениям, включая table, longtable, xltabular.
    Поэтому \caption{Текст} внутри xltabular автоматически станет:

        «Таблица 1. Текст»

— как и требует ГОСТ.

## Использование в документа

\begin{sidewaystable}
\centering
\caption{Название таблицы} % ← сверху, ГОСТ!
\begin{xltabular}{\textwidth}{@{} l X @{}}
\toprule
Колонка & Описание \\
\midrule
Данные & Очень длинный текст, который переносится автоматически \\
\bottomrule
\end{xltabular}
\end{sidewaystable}

## Что означает @{} l X @{} ?

@{} Убирает стандартный межстолбцовый отступ слева от первого столбца
l Столбец с левым выравниванием, фиксированной ширины
X Столбец из tabularx / xltabular — автоматически растягивается, чтобы
заполнить оставшееся место
@{} Убирает стандартный межстолбцовый отступ справа после последнего столбца

💡 Зачем это нужно?

По умолчанию LaTeX добавляет небольшой горизонтальный отступ (\tabcolsep)
слева и справа от каждого столбца.
Если таблица и так шириной \textwidth, то эти отступы заставляют её вылезать
за правое поле.

→ @{} отключает эти отступы по краям, и таблица точно вписывается в \textwidth.

Без @{} — переполнение (Overfull \hbox).
→ С @{} — идеально по ширине.

## Зачем загружать \RequirePackage{tabularx}, если xltabular уже включает его?

Пакет xltabular внутри себя делает:

\RequirePackage{longtable}
\RequirePackage{tabularx}

Поэтому, если ты уже загрузил xltabular, то tabularx и longtable уже доступны

## Зачем нужен dcolumn?

Пакет dcolumn позволяет выравнивать числа в столбце по десятичной точке
(или запятой) — что критично для технических, научных и финансовых таблиц.

Пример без dcolumn:
\begin{tabular}{r}
12.5 \\
1.234 \\
100.0 \\
\end{tabular}
Числа выровнены по правому краю, но точки не совпадают:
12.5
1.234
100.0

✅ С dcolumn:

\usepackage{dcolumn}
\newcolumntype{d}[1]{D{.}{.}{#1}} % создаём тип столбца

\begin{tabular}{d{2.3}} % 2 цифры слева, 3 справа от точки
12.5 \\
1.234 \\
100.0 \\
\end{tabular}
Точки строго выровнены:
12.500
1.234
100.000

## ГОСТ и dcolumn:

ГОСТ не запрещает, но требует чёткого оформления числовых данных.
Выравнивание по точке — знак профессиональной типографики.

👉 Вывод: dcolumn незаменим для числовых таблиц — multirow тут не при чём.

## Зачем нужен makecell, если есть multirow?

❗ Важно: multirow и makecell решают разные задачи:
multirow Объединяет ячейку по вертикали (одна ячейка = несколько строк).
makecell Управляет содержимым одной ячейки : переносы, форматирование, отступы.

Перенос работает даже в l/c/r!
🔸 Дополнительные фичи makecell:

    \thead{...} — автоматически делает заголовок жирным + центрированным.
    \Gape — добавляет вертикальные отступы вокруг ячейки (чтобы текст не
     "прилипал" к линиям).

## держи наглядные примеры использования \thead и \Gape из пакета makecell — с пояснениями и сравнением «до/после».

\thead{...} — красивые заголовки «из коробки»
❌ Без makecell (обычный tabular):
\begin{tabular}{|l|c|r|}
\hline
Очень длинный заголовок & Колонка 2 & Колонка 3 \\
\hline
Данные & X & Y \\
\hline
\end{tabular}

Заголовок не переносится, таблица вылезает за поле, шрифт — обычный.

✅ С \thead:
\usepackage{makecell}
\renewcommand{\theadfont}{\bfseries} % жирный (по умолчанию)
\renewcommand{\theadalign}{cc} % центр по горизонтали и вертикали

\begin{tabular}{|l|c|r|}
\hline
\thead{Очень длинный\\ заголовок} & \thead{Колонка 2} & \thead{Колонка 3} \\
\hline
Данные & X & Y \\
\hline
\end{tabular}

Результат:

    Заголовки автоматически жирные,
    Перенос строк внутри ячейки работает,
    Центрирование по умолчанию (можно изменить),
    Таблица не вылезает за поля.

💡 \thead работает даже в столбцах типа l, c, r — без p{...}!

## \Gape[<нижний>][<верхний>]{...} — отступы от линий

❌ Без \Gape (с booktabs или \hline):
\begin{tabular}{l}
\toprule
Короткая строка \\
\midrule
Текст прилип к линии \\
\bottomrule
\end{tabular}

Текст слипается с \midrule — выглядит тесно.

✅ С \Gape:

\usepackage{makecell}

\begin{tabular}{l}
\toprule
\thead{Заголовок} \\
\midrule
\Gape[3pt][3pt]{Текст с отступом от линий} \\
\bottomrule
\end{tabular}

✅ Результат:

    3pt сверху и снизу → воздух вокруг текста,
    Можно задать разные отступы: \Gape[2pt][4pt] — 2pt снизу, 4pt сверху,
    Особенно полезно с \hline или плотными таблицами.

💡 Альтернатива: \setcellgapes{3pt}\makegapedcells — применить отступы ко всем ячейкам.

## 📌 Полный пример: ГОСТ-совместимая таблица

\usepackage{makecell, booktabs}

% Настройка заголовков
\renewcommand{\theadfont}{\bfseries}
\renewcommand{\theadalign}{lc} % лево + центр по вертикали

\begin{tabular}{@{} l X @{}}
\toprule
\thead{Параметр} & \thead{Описание} \\
\midrule
Температура & \Gape{Значение с отступом от линий} \\
Давление & Ещё данные \\
\bottomrule
\end{tabular}

## Подбор ширины столбов в таблицах с множеством данных

    Для портретной ориентации

\begin{table}[ht]
\small % уменьшаем шрифт
\setlength{\tabcolsep}{4pt} % уменьшаем межстолбцовые отступы
\caption{Много столбцов в портрете}
\begin{xltabular}{\textwidth}{@{} l \*{5}{X} @{}}
\toprule
ID & Колонка 1 & Колонка 2 & Колонка 3 & Колонка 4 & Колонка 5 \\
\midrule
1 & Данные & Данные & Данные & Данные & Данные \\
\bottomrule
\end{xltabular}
\end{table}

\*{5}{X} = 5 одинаковых X-столбцов.

    Для альбомной ориентации

Стратегия:

    Оборачивай в \begin{sidewaystable}...\end{sidewaystable}.
    Используй \textheight как ширину (потому что в альбоме высота страницы = ширине таблицы).
    Можно не уменьшать шрифт, так как места больше.

\begin{sidewaystable}
\centering
\caption{Много столбцов в альбоме}
\begin{xltabular}{\textheight}{@{} l \*{8}{X} @{}}
\toprule
ID & C1 & C2 & C3 & C4 & C5 & C6 & C7 & C8 \\
\midrule
1 & ... & ... & ... & ... & ... & ... & ... & ... \\
\bottomrule
\end{xltabular}
\end{sidewaystable}

\textheight здесь — ширина таблицы, потому что страница повёрнута.

    Если столбцов ОЧЕНЬ много (10+)

Сократи заголовки: используй аббревиатуры + поясняющую таблицу отдельно.
Поверни заголовки:

\usepackage{graphicx}
\newcommand{\rot}[1]{\rotatebox{90}{#1}}

\rot{Длинный заголовок} — занимает мало горизонтали.
Используй adjustbox (осторожно!):
\usepackage{adjustbox}
\begin{adjustbox}{width=\textwidth}
\begin{tabular}{...} ... \end{tabular}
\end{adjustbox}

Но это ломает типографику (шрифт разного размера) — только в крайнем случае.

### Универсальный шаблон для любого количества столбцов

% В преамбуле
\usepackage{makecell} % для переносов в заголовках
\renewcommand{\theadfont}{\bfseries\scriptsize}
\renewcommand{\theadalign}{tc}

% В документе (портрет)
\begin{table}[ht]
\footnotesize
\setlength{\tabcolsep}{3pt}
\caption{Универсальная таблица}
\begin{xltabular}{\textwidth}{@{} l \*{10}{X} @{}}
\toprule
\thead{ID} & \thead{C1} & \thead{C2} & ... & \thead{C10} \\
\midrule
... \\
\bottomrule
\end{xltabular}
\end{table}

% В документе (альбом)
\begin{sidewaystable}
\centering
\footnotesize
\setlength{\tabcolsep}{4pt}
\caption{Универсальная таблица (альбом)}
\begin{xltabular}{\textheight}{@{} l \*{12}{X} @{}}
\toprule
\thead{ID} & \thead{C1} & ... & \thead{C12} \\
\midrule
... \\
\bottomrule
\end{xltabular}
\end{sidewaystable}

### ✅ Итог: правила «золотого стандарта»

Много столбцов Используй X -столбцы + @{}
Портрет \textwidth, \small, уменьши \tabcolsep
Альбом \textheight, sidewaystable, можно оставить \normalsize
Очень много столбцов Сокращай заголовки, поворачивай их, избегай adjustbox

## Модуль listingssetup

💡 Для разработки: раскомментируйте \InputIfFileExists{listingssetup.sty}
в xememoir.sty, чтобы использовать \blindtext, \lipsum и listings.

### Блок lstset

Без цвета в ключевых словах ГОСТ не рекомендует цвет в печатных документах
→ всё в ч/б

frame=single Визуальное отделение кода от текста — обязательно

backgroundcolor=\color{gray!5} Лёгкий фон улучшает читаемость,
но не мешает при печати

captionpos=t Подпись сверху, как у таблиц (единый стиль документа)

breakatwhitespace=true Избегает разрывов внутри слов (например,my_variable)

### 💡 Как использовать в документе

\begin{lstlisting}[caption={Пример кода на Python}]
def hello():
print("Привет, мир!")
\end{lstlisting}
Получишь ГОСТ-совместимый, читаемый, оформленный листинг.
